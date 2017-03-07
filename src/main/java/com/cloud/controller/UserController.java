package com.cloud.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletRequest;
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

import com.cloud.controller.bo.GroupBO;
import com.cloud.controller.bo.TreeBO;
import com.cloud.dao.CommentDAO;
import com.cloud.entity.Group;
import com.cloud.entity.Project;
import com.cloud.entity.User;
import com.cloud.service.CommentService;
import com.cloud.service.ContentService;
import com.cloud.service.GroupService;
import com.cloud.service.MessageService;
import com.cloud.service.ProjectService;
import com.cloud.service.UserService;
import com.cloud.util.ImageUtil;
import com.cloud.util.JacksonUtil;
import com.cloud.util.MD5;

@Controller  
@RequestMapping("/user") 
public class UserController {
	 private static final Logger LOGGER = Logger.getLogger(UserController.class);  
	 
	 @Autowired  
	 private UserService userService;
	 
	 @Autowired
	 private GroupService groupService;
	 
	 @Autowired
	 private MessageService messageService;
	 
	 @Autowired
	 private ProjectService projectService;
	 
	 @Autowired
	 private ContentService contentService;
	 
	 @Autowired
	 private CommentService commentService;
	 
	 @RequestMapping("/login")
	 public @ResponseBody String login(String email,String password,HttpServletRequest request) throws Exception{
		 HttpSession session = request.getSession();
		 User user = userService.getUserByLoginNameAndPassword(email,MD5.GetMD5Password(password));
		 String result = "";
		 if(user != null){
			 
			 session.setAttribute("user", user);
			 
			 Map<String,Object> returnMap = new HashMap<String, Object>();
			 returnMap.put("code", 200);
			 returnMap.put("status", 1);
			 result = JacksonUtil.toJSon(returnMap);
		 }
		 
		 return result;
	 }
	 
	 @RequestMapping("/persons")
	 public String person(HttpServletRequest request,Model model){
		 HttpSession session = request.getSession();
		 User user = (User) session.getAttribute("user");
		 List<Group> parents = groupService.getParentList();
		 List<GroupBO> groups = new ArrayList<GroupBO>(); 
		 if(parents != null){
			 for(Group g:parents){
				 List<User> users = userService.getUserToGroupId(g.getId());
				 List<Group> childs = groupService.getChildList(g.getId());
				 
				 List<GroupBO> _childs = new ArrayList<GroupBO>(); 
				 if(childs != null){
					 for(Group c:childs){
						 List<User> _users = userService.getUserToGroupId(c.getId());
						 for(User u:_users){
							int count = messageService.getReadCount(user.getId(),u.getId(), "N");
							u.setMessageCount(count);
						 }
						 GroupBO gbo = new GroupBO(c.getId(),c.getName(),_users);
						 _childs.add(gbo);
					 }
				 }
				 groups.add(new GroupBO(g.getId(), g.getName(), users , _childs));
			 }
		 }
		 
		 model.addAttribute("groups",groups);
		 
		 return "user/persons";
	 }
	 
	 @RequestMapping("/info")
	 public @ResponseBody User info(int id,HttpServletRequest request,Model model){
		 User u = userService.get(id);
		 return u;
	 }
	 
	 @RequestMapping("/projects")
	 public String project(HttpServletRequest request,Model model){
		 HttpSession session = request.getSession();
		 User user = (User)session.getAttribute("user");
		//我创建的项目  user_id = current_user_id
		 List<Project> cp = projectService.getProjectToUserId(user.getId());
		//我管理的项目
		//我参与的项目
		 
		 model.addAttribute("cp",cp);
		 
		 return "user/projects";
	 }
	 
	 @RequestMapping("/trees")
	 public @ResponseBody List<TreeBO> trees(HttpServletRequest request,HttpServletResponse response){
		 List<User> users = userService.findAll();
		 List<Group> parents = groupService.getParentList();
		 List<Group> childs = groupService.getChildList();
		 List<TreeBO> trees = new ArrayList<TreeBO>();
		 for(User u:users){
			//查询未读消息数
			trees.add(new TreeBO(u.getId(), u.getGroup().getId(), u.getUsername(), false,u.getPortrait()));
		 }
		 for(Group g:parents){
			trees.add(new TreeBO(g.getId(), 0, g.getName(), true,""));
		 }
		 for(Group g:childs){
			trees.add(new TreeBO(g.getId(), g.getParent().getId(), g.getName(), true,""));
		 }
		 
		 return trees;
	 }
	 
	 @RequestMapping("/upload")
	 public @ResponseBody String upload(@RequestParam(value = "file",required = false) MultipartFile file,int x,int y,int width,int height, HttpServletRequest request, ModelMap model){
		 HttpSession session = request.getSession();
		 User us = (User)session.getAttribute("user");
		 String path = request.getSession().getServletContext().getRealPath("/upload_images");
		 File fp = new File(path);
		 if(!fp.exists()){
			 fp.mkdir();
		 }
		 if(file != null){
			 String fileName = file.getOriginalFilename();
			 String fileExt = fileName.substring(fileName.lastIndexOf(".") + 1).toLowerCase();
			 String newImgName = us.getLoginName()+"."+fileExt;
			 File targetFile = new File(path, newImgName);  
			 
			 System.out.println("width="+width);
			 
			 //保存
			 try {
				 file.transferTo(targetFile);
				//裁剪图片
				 ImageUtil.cutImage(path+"/"+newImgName, x, y, width, height);
			 } catch (Exception e) {
				 e.printStackTrace();
			 }
			 //更新user
			 us.setPortrait("upload_images"+"/"+newImgName);
			 userService.update(us);
		 }
		 return "";
	 }
	
	 
	 @RequestMapping("/checkpass")
	 public @ResponseBody Map<String,Object> checkpass(String password,HttpServletRequest request,Model model) throws Exception{
		 HttpSession session = request.getSession();
		 User user = (User)session.getAttribute("user");
		 Map<String,Object> returnMap = new HashMap<String, Object>();

		 String returnCode = "0";
		 
		 user = userService.get(user.getId());
		 if(MD5.GetMD5Password(password).equals(user.getPassword())){
			 returnCode = "0";
		 }else{
			 returnCode = "1";
		 }
		 
		 returnMap.put("returnCode", returnCode);
		 
		 return returnMap;
	 }
	 
	 @RequestMapping("/updatepass")
	 public @ResponseBody Map<String,Object> updatepass(String oldpass,String newpass,HttpServletRequest request,Model model) throws Exception{
		 HttpSession session = request.getSession();
		 User user = (User)session.getAttribute("user");
		 Map<String,Object> returnMap = new HashMap<String, Object>();
		 
		 String returnCode = "1";
		 if(oldpass == null || oldpass.equals("") || newpass == null || newpass.equals("") || oldpass.equals(newpass)){
			 returnCode = "1";
		 }else{
			 user = userService.get(user.getId());
			 if(MD5.GetMD5Password(oldpass).equals(user.getPassword())){
				 user.setPassword(MD5.GetMD5Password(newpass));
				 returnCode = "0";
				 userService.update(user);
			 }
		 }
		 
		 returnMap.put("returnCode", returnCode);
		 
		 return returnMap;
	 }
	 
	 @RequestMapping("/user")
	 public String user(int id,HttpServletRequest request,Model model){
		 User u = userService.get(id);
		 //帖子数
		 int count = contentService.getListCountToUserId(id);
		 //评论数
		 int ccount = commentService.getListCountToUserId(id);
		 //阅读数
		 int sum = contentService.getReadCountSumToUserId(id);
		 
		 model.addAttribute("u",u);
		 model.addAttribute("count",count);
		 model.addAttribute("ccount",ccount);
		 model.addAttribute("sum",sum);
		 
		 return "user/user";
	 }
	 
}
