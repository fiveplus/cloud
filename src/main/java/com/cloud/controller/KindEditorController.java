package com.cloud.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.Hashtable;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MaxUploadSizeExceededException;
import org.springframework.web.multipart.MultipartFile;

import com.cloud.entity.User;
import com.cloud.util.JacksonUtil;
/**
 * Kingeditor插件
 * @author hack
 *
 */
@Controller  
@RequestMapping("/ke") 
public class KindEditorController {
	private static final Logger LOGGER = Logger.getLogger(KindEditorController.class);  
	
	@RequestMapping(value = "/upload")  
	public @ResponseBody Map<String,Object> upload(@RequestParam(value = "imgFile",required = false) MultipartFile imgFile, HttpServletRequest request, ModelMap model){
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		//文件保存路径
		String savePath = request.getSession().getServletContext().getRealPath("/") + "attached/";
		String pressPath = request.getSession().getServletContext().getRealPath("/") + "images/";
		
		//TODO 用户路径
		savePath += user.getId()+"/";
		
		//文件保存目录URL
		String saveUrl = request.getContextPath() + "/attached/";
		
		saveUrl += user.getId()+"/";
		
		//定义允许上传的文件扩展名
		HashMap<String, String> extMap = new HashMap<String, String>();
		extMap.put("image", "gif,jpg,jpeg,png,bmp");
		extMap.put("flash", "swf,flv");
		extMap.put("media", "swf,flv,mp3,wav,wma,wmv,mid,avi,mpg,asf,rm,rmvb");
		extMap.put("file", "doc,docx,xls,xlsx,ppt,htm,html,txt,zip,rar,gz,bz2");
		
		
		if(imgFile.isEmpty()){
			Map<String,Object> result = getError("请选择文件!");
			return result;
		}
		
		//创建用户目录
		File userDir = new File(savePath);
		if(!userDir.isDirectory()){
			userDir.mkdirs();
		}
		
		//检查目录
		File uploadDir = new File(savePath);
		if(!uploadDir.isDirectory()){
			Map<String,Object> result = getError("上传目录不存在!");
			return result;
		}
		
		//检查写权限
		if(!uploadDir.canWrite()){
			Map<String,Object> result = getError("上传目录没有写权限!");
			return result;
		}
		
		String dirName = request.getParameter("dir");
		if(dirName == null){
			dirName = "image";
		}
		if(!extMap.containsKey(dirName)){
			Map<String,Object> result = getError("目录名不正确!");
			return result;
		}
		//创建文件夹
		savePath += dirName + "/";
		saveUrl += dirName + "/";
		File saveDirFile = new File(savePath);
		if(!saveDirFile.exists()){
			saveDirFile.mkdirs();
		} 
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		String ymd = sdf.format(new Date());
		savePath += ymd + "/";
		saveUrl += ymd + "/";
		File dirFile = new File(savePath);
		if(!dirFile.exists()){
			dirFile.mkdirs();
		}
		if(!dirFile.isDirectory()){
			Map<String,Object> result = getError("上传目录不存在!");
			return result;
		}
		//检查写权限
		if(!dirFile.canWrite()){
			Map<String,Object> result = getError("上传目录没有写权限!");
			return result;
		}
		String fileName = imgFile.getOriginalFilename();
		//检查扩展名
		String fileExt = fileName.substring(fileName.lastIndexOf(".") + 1).toLowerCase();
		if(!Arrays.<String>asList(extMap.get(dirName).split(",")).contains(fileExt)){
			Map<String,Object> result = getError("上传文件扩展名是不允许的扩展名。\n只允许" + extMap.get(dirName) + "格式。");
		    return result;
		}
		//重构上传图片的名称
		SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");
		String newImgName = df.format(new Date()) + "_" + new Random().nextInt(1000) + "." + fileExt;
		
		File targetFile = new File(savePath, newImgName);  
		
		//保存
		try {
			imgFile.transferTo(targetFile);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		Map<String,Object> returnMap = new HashMap<String, Object>();
		returnMap.put("error", 0);
		returnMap.put("url", saveUrl + "/" + newImgName);
		return returnMap;
	}
	
	/**
	 * 异常处理
	 * @param e
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@org.springframework.web.bind.annotation.ExceptionHandler
	public @ResponseBody Map<String,Object> ExceptionHandler(Exception e,HttpServletRequest request) throws Exception{
		if(e instanceof MaxUploadSizeExceededException){
			long maxSize = ((MaxUploadSizeExceededException) e).getMaxUploadSize();
			Map<String,Object> result = getError("上传文件太大，不能超过" + maxSize / 1024 + "k");
			return result;
		}else if(e instanceof RuntimeException){
			Map<String,Object> result = getError("未选中文件!");
			return result;
		}else{
			Map<String,Object> result =  getError("上传失败!");
			return result;
		}
	}
	
	private Map<String,Object> getError(String message){
		Map<String,Object> result = new HashMap<String, Object>();
		result.put("error", 1);
		result.put("message", message);
		return result;
	}
	
	@RequestMapping(value = "/manager")  
	public void manager(HttpServletRequest request,HttpServletResponse response) throws Exception{
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		//根目录路径，可以指定绝对路径，比如 /var/www/attached/
		String rootPath =request.getSession().getServletContext().getRealPath("/") + "attached/";
		String rootUrl  = request.getContextPath() + "/attached/";
		
		//TODO 单用户读取
		rootPath += user.getId() + "/";
		rootUrl += user.getId() + "/";
		
		ServletOutputStream out = response.getOutputStream();  
		//图片扩展名
		String[] fileTypes = new String[]{"gif", "jpg", "jpeg", "png", "bmp"};
		String dirName = request.getParameter("dir");
		if (dirName != null) {
			if(!Arrays.<String>asList(new String[]{"image", "flash", "media", "file"}).contains(dirName)){
				String result = "Invalid Directory name.";
				out.println(result);
				return;
			}
			rootPath += dirName + "/";
			rootUrl += dirName + "/";
			File saveDirFile = new File(rootPath);
			if (!saveDirFile.exists()) {
				saveDirFile.mkdirs();
			}
		}
		//根据path参数，设置各路径和URL
		String path = request.getParameter("path") != null ? request.getParameter("path") : "";
		String currentPath = rootPath + path;
		String currentUrl = rootUrl + path;
		String currentDirPath = path;
		String moveupDirPath = "";
		if (!"".equals(path)) {
			String str = currentDirPath.substring(0, currentDirPath.length() - 1);
			moveupDirPath = str.lastIndexOf("/") >= 0 ? str.substring(0, str.lastIndexOf("/") + 1) : "";
		}
		//排序形式，name or size or type
		String order = request.getParameter("order") != null ? request.getParameter("order").toLowerCase() : "name";
		//不允许使用..移动到上一级目录
		if (path.indexOf("..") >= 0) {
			String result = "Access is not allowed.";
			out.println(result);
			return;
		}
		//最后一个字符不是/
		if (!"".equals(path) && !path.endsWith("/")) {
			String result = "Parameter is not valid.";
			out.println(result);
			return;
		}
		//目录不存在或不是目录
		File currentPathFile = new File(currentPath);
		if(!currentPathFile.isDirectory()){
			String result = "Directory does not exist.";
			out.println(result);
			return;
		}
		//遍历目录取的文件信息
		List<Hashtable> fileList = new ArrayList<Hashtable>();
		if(currentPathFile.listFiles() != null) {
			for (File file : currentPathFile.listFiles()) {
				Hashtable<String, Object> hash = new Hashtable<String, Object>();
				String fileName = file.getName();
				if(file.isDirectory()) {
					hash.put("is_dir", true);
					hash.put("has_file", (file.listFiles() != null));
					hash.put("filesize", 0L);
					hash.put("is_photo", false);
					hash.put("filetype", "");
				} else if(file.isFile()){
					String fileExt = fileName.substring(fileName.lastIndexOf(".") + 1).toLowerCase();
					hash.put("is_dir", false);
					hash.put("has_file", false);
					hash.put("filesize", file.length());
					hash.put("is_photo", Arrays.<String>asList(fileTypes).contains(fileExt));
					hash.put("filetype", fileExt);
				}
				hash.put("filename", fileName);
				hash.put("datetime", new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(file.lastModified()));
				fileList.add(hash);
			}
		}
		

		if ("size".equals(order)) {
			Collections.sort(fileList, new SizeComparator());
		} else if ("type".equals(order)) {
			Collections.sort(fileList, new TypeComparator());
		} else {
			Collections.sort(fileList, new NameComparator());
		}
		
		Map<String,Object> returnMap = new HashMap<String, Object>();
		returnMap.put("moveup_dir_path", moveupDirPath);
		returnMap.put("current_dir_path", currentDirPath);
		returnMap.put("current_url", currentUrl);
		returnMap.put("total_count", fileList.size());
		returnMap.put("file_list", fileList);
		String result = JacksonUtil.toJSon(returnMap);
		response.setContentType("application/json; charset=UTF-8");
		out.println(result);
	}

	public class NameComparator implements Comparator {
		public int compare(Object a, Object b) {
			Hashtable hashA = (Hashtable)a;
			Hashtable hashB = (Hashtable)b;
			if (((Boolean)hashA.get("is_dir")) && !((Boolean)hashB.get("is_dir"))) {
				return -1;
			} else if (!((Boolean)hashA.get("is_dir")) && ((Boolean)hashB.get("is_dir"))) {
				return 1;
			} else {
				return ((String)hashA.get("filename")).compareTo((String)hashB.get("filename"));
			}
		}
	}
	public class SizeComparator implements Comparator {
		public int compare(Object a, Object b) {
			Hashtable hashA = (Hashtable)a;
			Hashtable hashB = (Hashtable)b;
			if (((Boolean)hashA.get("is_dir")) && !((Boolean)hashB.get("is_dir"))) {
				return -1;
			} else if (!((Boolean)hashA.get("is_dir")) && ((Boolean)hashB.get("is_dir"))) {
				return 1;
			} else {
				if (((Long)hashA.get("filesize")) > ((Long)hashB.get("filesize"))) {
					return 1;
				} else if (((Long)hashA.get("filesize")) < ((Long)hashB.get("filesize"))) {
					return -1;
				} else {
					return 0;
				}
			}
		}
	}
	public class TypeComparator implements Comparator {
		public int compare(Object a, Object b) {
			Hashtable hashA = (Hashtable)a;
			Hashtable hashB = (Hashtable)b;
			if (((Boolean)hashA.get("is_dir")) && !((Boolean)hashB.get("is_dir"))) {
				return -1;
			} else if (!((Boolean)hashA.get("is_dir")) && ((Boolean)hashB.get("is_dir"))) {
				return 1;
			} else {
				return ((String)hashA.get("filetype")).compareTo((String)hashB.get("filetype"));
			}
		}
	}
	
}
