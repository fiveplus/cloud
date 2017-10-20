package com.cloud.controller.admin;

import java.io.File;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.cloud.controller.admin.bo.PermissionBO;
import com.cloud.entity.Department;
import com.cloud.entity.Group;
import com.cloud.entity.Level;
import com.cloud.entity.Permission;
import com.cloud.entity.User;
import com.cloud.service.DepartmentService;
import com.cloud.service.DeptPermissionService;
import com.cloud.service.GroupService;
import com.cloud.service.LevelService;
import com.cloud.service.PermissionService;
import com.cloud.service.UserService;
import com.cloud.util.MD5;
import com.cloud.util.PageUtil;
import com.cloud.util.StringUtil;

@Controller  
@RequestMapping("/admin/user") 
public class UserAdminController {
	private static final Logger LOGGER = Logger.getLogger(UserAdminController.class);  
	 
	@Autowired  
	private UserService userService;
	@Autowired
	private DeptPermissionService deptPermissionService;
	@Autowired
	private PermissionService permissionService;
	@Autowired
	private DepartmentService departmentService;
	@Autowired
	private GroupService groupService;
	@Autowired
	private LevelService levelService;
	 
	@RequestMapping("/login")
	public String login(String loginName,String password,HttpServletRequest request,HttpServletResponse response) throws Exception{
		 HttpSession session = request.getSession();
		 User user = userService.getUserByLoginNameAndPassword(loginName, MD5.GetMD5Password(password));
		 if(user == null){
			 String error = "用户名/密码错误!";
			 Cookie myCookie[]=request.getCookies();
			 for(Cookie co:myCookie){
				if("loginName".equals(co.getName())){
					co = null;
					continue;
				}
				else if("password".equals(co.getName())){
					co = null;
					continue;
				}
			}
			request.setAttribute("error", error);
			return "admin/login";
		 }else{
			 List<Permission> pers = deptPermissionService.getChildPermission(user.getDept().getId());
			 user.setPers(pers);
			 Cookie thepassword = new Cookie("password",String.valueOf(password));
			 Cookie theloginname = new Cookie("loginName",String.valueOf(loginName));
			 response.addCookie(thepassword);
			 response.addCookie(theloginname);
			 //菜单权限组装
			 List<PermissionBO> pbos = new ArrayList<PermissionBO>();
		     List<Permission> parentMenu = permissionService.getParentMenu();
		     //初始化
		     for(Permission menu:parentMenu){
			    	 PermissionBO pbo = new PermissionBO();
		        	 pbo.setPermission(menu);
		        	 pbo.setPers(new ArrayList<Permission>());
		        	 pbos.add(pbo);
		     }
		     for(PermissionBO pbo:pbos){
		    	 for(Permission per:pers){
		    		 if(per.getParentId().equals(pbo.getPermission().getId())&&per.getIsMenu().equals("Y")){
		    			 pbo.getPers().add(per);
		    		 }
		    	 }
		     }
		     //反向遍历清除空元素
		     for(int i = pbos.size()-1;i>=0;i--){
		    	 PermissionBO pbo = pbos.get(i);
		         if(pbo.getPers()== null || pbo.getPers().size() == 0){
		        	 pbos.remove(pbo);
		         }
		     }
		     session.setAttribute("user", user);
		     session.setAttribute("menus", pbos);
		     return "admin/index";   
		 }
	 }
	 
	 @RequestMapping("/list")
	 public String list(int page,HttpServletRequest request,Model model){
		 int pageSize = 10;
		 int count = userService.getListCount(null, null);
		 PageUtil pu = new PageUtil(page, count, pageSize);
		 List<User> list = userService.getList(page, pageSize, null, null);
		 model.addAttribute("users",list);
		 model.addAttribute("pu",pu);
		 return "admin/user/users";
	 }
	 
	 @RequestMapping("/add")
	 public String add(HttpServletRequest request,Model model){
		 List<Department> depts = departmentService.findAll();
		 
		 List<Group> parents = groupService.getParentList();
		 for(Group g:parents){
			List<Group> childs = groupService.getChildList(g.getId());
			g.setChilds(childs);
		 }
		 
		 List<Level> levels = levelService.getParentList();
		 model.addAttribute("plevels",levels);
		 
		 
		 model.addAttribute("parents",parents);
		 model.addAttribute("depts",depts);
		 
		 return "admin/user/add_user";
	 }
	 
	 @RequestMapping("/save.json")
	 public @ResponseBody Map<String,Object> save(User us,HttpServletRequest request,Model model) throws Exception{
		 Map<String,Object> returnMap = new HashMap<String, Object>();
		 int code = 200;
		 String msg = "恭喜您，用户创建成功!";
		 
		 if(us.getGroup().getId() == null){
			 int pid = Integer.parseInt(request.getParameter("parentid"));
			 us.getGroup().setId(pid);
		 }
		 us.setCreateTime(StringUtil.getDateToLong(new Date()));
		 us.setPortrait("");
		 us.setPassword(MD5.GetMD5Password("123456"));
		 us.setStatus("Y");
		 int id = userService.save(us);
		 if(id > 0){
		 }else{
			 msg = "很抱歉，用户创建失败!";
			 code = -1;
		 }
		 
		 returnMap.put("code", code);
		 returnMap.put("msg", msg);
		 return returnMap;
	 }
	 
	 @RequestMapping("/upt")
	 public String upt(int id,HttpServletRequest request,Model model){
		 List<Department> depts = departmentService.findAll();
		 User us = userService.get(id);
		 
		 List<Group> parents = groupService.getParentList();
		 for(Group g:parents){
			List<Group> childs = groupService.getChildList(g.getId());
			g.setChilds(childs);
		 }
		 
		 List<Group> childs = new ArrayList<Group>();
		 if(us.getGroup().getParent() != null){
			 childs = groupService.getChildList(us.getGroup().getParent().getId());
		 }
		 
		 List<Level> lchilds = levelService.getChildList(us.getLevel().getLevel().getId());
		 model.addAttribute("lchilds",lchilds);
		 
		 List<Level> levels = levelService.getParentList();
		 model.addAttribute("plevels",levels);
		 
		 model.addAttribute("childs",childs);
		 model.addAttribute("parents",parents);
		 model.addAttribute("depts",depts);
		 model.addAttribute("us",us);
		 
		 return "admin/user/update_user";
	 }
	 
	 @RequestMapping("/update.json")
	 public @ResponseBody Map<String,Object> update(User us,HttpServletRequest request,Model model){
		 Map<String,Object> returnMap = new HashMap<String, Object>();
		 int code = 200;
		 String msg = "恭喜您，用户修改成功!";
		 
		 userService.update(us,us.getId());
		 
		 returnMap.put("code", code);
		 returnMap.put("msg", msg);
		 return returnMap;
	 }
	 
	 @RequestMapping("/uptUser")
	 public String uptUser(int id,HttpServletRequest request,Model model){
		 List<Department> depts = departmentService.findAll();
		 User us = userService.get(id);
		 model.addAttribute("depts",depts);
		 model.addAttribute("us",us);
		 return "admin/user/this_update_user";
	 }
	 
	 @RequestMapping("/updateUser.json")
	 public @ResponseBody Map<String,Object> updateUser(User us,HttpServletRequest request,Model model){
		 Map<String,Object> returnMap = new HashMap<String, Object>();
		 int code = 200;
		 String msg = "恭喜您，用户信息修改成功，重新登录生效!";
		 
		 if (us.getPassword().equals("")) us.setPassword(null);
		 userService.update(us,us.getId());
		 
		 returnMap.put("code", code);
		 returnMap.put("msg", msg);
		 return returnMap;
	 }
	 
	 @RequestMapping("/head")
	 public String head(int id,HttpServletRequest request,Model model){
		 User us = userService.get(id);
		 model.addAttribute("us",us);
		 return "admin/user/head";
	 }
	 
	 @RequestMapping("/upload.json")
	 public @ResponseBody Map<String,Object> upload(@RequestParam(value = "file",required = false) MultipartFile file,int id,int x,int y,int width,int height, HttpServletRequest request, ModelMap model){
		 Map<String,Object> returnMap = new HashMap<String, Object>();
		 String [] fileExts = {"jpg","jpeg","png"};
		 String message = "恭喜您，头像上传成功！";
		 int code = 200;
		 User us = userService.get(id);
		 String path = request.getSession().getServletContext().getRealPath("/upload_images");
		 File fp = new File(path);
		 if(!fp.exists()){
			 fp.mkdir();
		 }
		 if(file != null){
			 String fileName = file.getOriginalFilename();
			 String fileExt = fileName.substring(fileName.lastIndexOf(".") + 1).toLowerCase();
			 boolean flag = false;
			 for(String ext:fileExts){
				 if(fileExt.equals(ext)){
					 flag = true;
					 break;
				 }
			 }
			 if(!flag){
				 message = "请上传JPG,JPEG,PNG格式的图片！";
				 code = -1;
			 }else{
				 String newImgName = us.getLoginName()+"."+fileExt;
				 File targetFile = new File(path, newImgName);  
				 //保存
				 try {
					 file.transferTo(targetFile);
				 } catch (Exception e) {
					 e.printStackTrace();
				 }
				 //更新user
				 us.setPortrait("upload_images"+"/"+newImgName);
				 userService.update(us,us.getId());
			 }
		 }
		 returnMap.put("code", code);
		 returnMap.put("message", message);
		 return returnMap;
	 }
	 
	 @RequestMapping("/delete.json")
	 public @ResponseBody Map<String,Object> delete(int id,HttpServletRequest request,Model model){
		 Map<String,Object> returnMap = new HashMap<String, Object>();
		 int code = 200;
		 String msg = "恭喜您，用户删除成功！";
		 //TODO 关闭账户
		 userService.close(id);
		 returnMap.put("msg", msg);
		 returnMap.put("code",code);
		 return returnMap;
	 }
	 
}
