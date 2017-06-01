package com.cloud.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cloud.entity.Content;
import com.cloud.entity.Department;
import com.cloud.entity.Praise;
import com.cloud.entity.Project;
import com.cloud.entity.Theme;
import com.cloud.entity.User;
import com.cloud.entity.UserFile;
import com.cloud.service.ContentService;
import com.cloud.service.DepartmentService;
import com.cloud.service.PraiseService;
import com.cloud.service.ProjectService;
import com.cloud.service.ThemeService;
import com.cloud.service.UserFileService;
import com.cloud.util.HtmlParser;
import com.cloud.util.JacksonUtil;
import com.cloud.util.PageUtil;
import com.cloud.util.Resource;
import com.cloud.util.StringUtil;

@Controller  
@RequestMapping("/content") 
public class ContentController {
	
	 private static final int CONTENT_LENGTH = 100;
	
	 private static final Logger LOGGER = Logger.getLogger(ContentController.class);
	 
	 @Autowired
	 private ContentService contentService;
	 
	 @Autowired
	 private ProjectService projectService;
	 
	 @Autowired
	 private ThemeService themeService;
	 
	 @Autowired
	 private DepartmentService departmentService;
	 
	 @Autowired
	 private PraiseService praiseService;
	 
	 @Autowired
	 private UserFileService userFileService;
	 
	 @RequestMapping("/list.json")
	 public @ResponseBody String list(int page,int deptId,HttpServletRequest request,Model model){
		 int port = request.getLocalPort();
		 HttpSession session = request.getSession();
		 User user = (User) session.getAttribute("user");
		 int pageSize = 10;
		 Map<String,Object> returnMap = new HashMap<String, Object>();
		 if(deptId == 0){
			 deptId = user.getDept().getId();
		 }
		 String _themeId = request.getParameter("themeId");
		 int themeId = 0;
		 if(!"".equals(_themeId)){
			 themeId = Integer.parseInt(_themeId);
		 }
		 
		 int count = contentService.getListCountToDeptIdAndThemeId(deptId,themeId);
		 PageUtil pu = new PageUtil(page, count, pageSize);
		 List<Content> list = contentService.getListToDeptIdAndThemeId(page,pageSize,deptId,themeId);
		 for(Content c:list){
			 String str = StringUtil.HTML2Text(c.getContent());
			 str = str.length() <= CONTENT_LENGTH ? str : (str.substring(0,CONTENT_LENGTH - 1) + "...");
			 c.setStr(str);
			 c.setImgs(StringUtil.getImgStr(port,c.getContent()));
			 //是否被赞
			 Praise p = praiseService.getPraiseByContentIdAndUserId(c.getId(), user.getId());
			 c.setIsPraise(p == null ? -1 : 0);
			 int pcount = praiseService.getCountByContentId(c.getId());
			 c.setPraiseCount(pcount);
		 }
		 returnMap.put("contents", list);
		 returnMap.put("pu", pu);
		 if(list.size() > 0){
			 returnMap.put("count", list.size());
		 }else{
			 returnMap.put("count", 0);
		 }
		 String result = JacksonUtil.toJSon(returnMap);
		 return result;
	 }
	 
	 @RequestMapping("/mylist.json")
	 public @ResponseBody String list(int page,HttpServletRequest request,Model model){
		 int port = request.getLocalPort();
		 HttpSession session = request.getSession();
		 User user = (User)session.getAttribute("user");
		 int userId = user.getId();
		 int pageSize = 10;
		 Map<String,Object> returnMap = new HashMap<String, Object>();
		 
		 
		 int count = contentService.getListCountToUserId(userId);
		 PageUtil pu = new PageUtil(page, count, pageSize);
		 List<Content> list = contentService.getListToUserId(page,pageSize,userId);
		 for(Content c:list){
			 String str = StringUtil.HTML2Text(c.getContent());
			 str = str.length() <= CONTENT_LENGTH ? str : (str.substring(0,CONTENT_LENGTH - 1) + "...");
			 c.setStr(str);
			 c.setImgs(StringUtil.getImgStr(port,c.getContent()));
		 }
		 returnMap.put("contents", list);
		 returnMap.put("pu", pu);
		 if(list.size() > 0){
			 returnMap.put("count", list.size());
		 }else{
			 returnMap.put("count", 0);
		 }
		 String result = JacksonUtil.toJSon(returnMap);
		 return result;
	 }
	 
	 @RequestMapping("/plist.json")
	 public @ResponseBody String plist(int page,int projectId,HttpServletRequest request,Model model){
		 int port = request.getLocalPort();
		 int pageSize = 10;
		 Map<String,Object> returnMap = new HashMap<String, Object>();
		 
		 int count = contentService.getListCountToUserId(projectId);
		 PageUtil pu = new PageUtil(page, count, pageSize);
		 List<Content> list = contentService.getListToProjectId(page,pageSize,projectId);
		 for(Content c:list){
			 String str = StringUtil.HTML2Text(c.getContent());
			 str = str.length() <= CONTENT_LENGTH ? str : (str.substring(0,CONTENT_LENGTH - 1) + "...");
			 c.setStr(str);
			 c.setImgs(StringUtil.getImgStr(port,c.getContent()));
		 }
		 returnMap.put("contents", list);
		 returnMap.put("pu", pu);
		 if(list.size() > 0){
			 returnMap.put("count", list.size());
		 }else{
			 returnMap.put("count", 0);
		 }
		 String result = JacksonUtil.toJSon(returnMap);
		 return result;
	 }
	 
	 
	 @RequestMapping("/addcontent")
	 public String addcontent(HttpServletRequest request,Model model){
		 List<Project> projects = projectService.findAll();
		 List<Theme> themes = themeService.findAll();
		 
		 model.addAttribute("projects",projects);
		 model.addAttribute("themes",themes);
		 
		 return "content/add_content";
	 }
	 
	 @RequestMapping("/save.json")
	 public @ResponseBody Map<String,Object> save(Content c,HttpServletRequest request,Model model){
		 HttpSession session = request.getSession();
		 User user = (User)session.getAttribute("user");
		 Map<String,Object> returnMap = new HashMap<String, Object>();
		 
		 String remindTime = request.getParameter("remindTime");
		 if(remindTime != null && !remindTime.equals("")){
			 c.setRemindTime(StringUtil.getStringToLong(remindTime, StringUtil.DATE_FORMAT2));
		 }
		 
		 c.setCreateTime(StringUtil.getDateToLong(new Date()));
		 c.setUser(user);
		 if(c.getProject().getId() == 0){
			 c.setProject(null);
		 }
		 if(c.getTheme().getId() == 0){
			 c.setTheme(null);
		 }
		 
		 c.setReadCount(Resource.getRandomCount(100));
		 c.setStatus("Y");
		 int id = contentService.save(c);
		 String message = "";
		 int code = 200;
		 if(id > 0){
			 message = "帖子发布成功！";
			 code = 200;
			 
			 //TODO 解析并保存
			 List<Map<String,String>> fileList = HtmlParser.getMapToHtml(c.getContent());
			 for(Map<String,String> file:fileList){
				 String href = file.get("href");
				 String text = file.get("text");
				 UserFile f = new UserFile();
				 f.setCont(c);
				 f.setCreateTime(StringUtil.getDateToLong(new Date()));
				 f.setFileName(text);
				 f.setUrl(href);
				 f.setUser(user);
				 userFileService.save(f);
			 }
			 
		 }else{
			 message = "服务器繁忙，帖子发布失败!";
			 code = 205;
		 }
		 
		 returnMap.put("code", code);
		 returnMap.put("message", message);
		 
		 return returnMap;
	 }
	 
	 @RequestMapping("/list")
	 public String contents(int deptId,HttpServletRequest request,Model model){
		 String _themeId = request.getParameter("themeId");
		 Department dept = departmentService.get(deptId);
		 
		 List<Project> projects = projectService.findAll();
		 List<Department> depts = departmentService.findAll();
		 List<Theme> themes = themeService.findAll();
		 model.addAttribute("projects",projects);
		 model.addAttribute("depts",depts);
		 model.addAttribute("dept",dept);
		 model.addAttribute("themes",themes);
		 model.addAttribute("themeId",_themeId);
		 
		 return "content/contents";
	 }
	 
	 @RequestMapping("/get")
	 public String get(int id,HttpServletRequest request,Model model){
		 
		 Content c = contentService.get(id);
		 
		 //阅读数++
		 c.setReadCount(c.getReadCount()+1);
		 contentService.update(c,c.getId());
		 
		 int pcount = praiseService.getCountByContentId(c.getId());
		 c.setPraiseCount(pcount);
		 model.addAttribute("content",c);
		 List<User> users = praiseService.getUserListByContentId(id);
		 model.addAttribute("users",users);
		 return "content/content";
	 }
	 
	 @RequestMapping("/upt")
	 public String upt(int id,HttpServletRequest request,Model model){
		 
		Content c = contentService.get(id);
		 
		List<Theme> themes = themeService.findAll();
		List<Project> projects = projectService.findAll();
		
		model.addAttribute("content",c);
		model.addAttribute("themes",themes);
		model.addAttribute("projects",projects);
		 
		 return "content/upt";
	 }
	 
	 
	 @RequestMapping("/get.json")
	 public @ResponseBody Map<String,Object> _get(int id,HttpServletRequest request,Model model){
		 Map<String,Object> returnMap = new HashMap<String, Object>();
	
		 Content c = contentService.get(id);
		 
		 returnMap.put("content", c);
		 
		 return returnMap;
	 }
	 
	 @RequestMapping("/update.json")
	 public @ResponseBody Map<String,Object> update(Content c,HttpServletRequest request,Model model){
		 HttpSession session = request.getSession();
		 User user = (User)session.getAttribute("user");
		 Map<String,Object> returnMap = new HashMap<String, Object>();
		 int code = 200;
		 String message = "恭喜您，帖子修改成功！";
		 c.setCreateTime(StringUtil.getDateToLong(new Date()));
		 if(c.getProject().getId() == null){
			 c.setProject(null);
		 }
		 contentService.update(c, c.getId());
		 
		//TODO 解析并保存
		 List<Map<String,String>> fileList = HtmlParser.getMapToHtml(c.getContent());
		 for(Map<String,String> file:fileList){
			 String href = file.get("href");
			 String text = file.get("text");
			 UserFile f = userFileService.getUserFileToUrl(href);
			 if(f == null){
				 f = new UserFile();
				 f.setCont(c);
				 f.setCreateTime(StringUtil.getDateToLong(new Date()));
				 f.setFileName(text);
				 f.setUrl(href);
				 f.setUser(user);
				 userFileService.save(f);
			 }
		 }
		 
		 returnMap.put("code", code);
		 returnMap.put("mesage", message);
		 
		 return returnMap;
	 }
	 
	 @RequestMapping("/delete.json")
	 public @ResponseBody Map<String,Object> deleleContent(int id,HttpServletRequest request,Model model){
		 Map<String,Object> returnMap = new HashMap<String, Object>();
			
		 contentService.delete(id);
			
		 return returnMap;
	 }
	 
}
