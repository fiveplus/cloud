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
import com.cloud.entity.Project;
import com.cloud.entity.Theme;
import com.cloud.entity.User;
import com.cloud.service.ContentService;
import com.cloud.service.DepartmentService;
import com.cloud.service.ProjectService;
import com.cloud.service.ThemeService;
import com.cloud.util.JacksonUtil;
import com.cloud.util.PageUtil;
import com.cloud.util.Resource;
import com.cloud.util.StringUtil;

@Controller  
@RequestMapping("/") 
public class ContentController {
	 private static final Logger LOGGER = Logger.getLogger(ContentController.class);
	 
	 @Autowired
	 private ContentService contentService;
	 
	 @Autowired
	 private ProjectService projectService;
	 
	 @Autowired
	 private ThemeService themeService;
	 
	 @Autowired
	 private DepartmentService departmentService;
	 
	 @RequestMapping("/content/list")
	 public @ResponseBody String list(int page,int deptId,HttpServletRequest request,Model model){
		 HttpSession session = request.getSession();
		 int pageSize = 10;
		 Map<String,Object> returnMap = new HashMap<String, Object>();
		 if(deptId == 0){
			 User user = (User) session.getAttribute("user");
			 deptId = user.getDept().getId();
		 }
		 
		 int count = contentService.getListCountToDeptId(deptId);
		 PageUtil pu = new PageUtil(page, count, pageSize);
		 List<Content> list = contentService.getListToDeptId(page,pageSize,deptId);
		 for(Content c:list){
			 c.setStr(StringUtil.HTML2Text(c.getContent()));
			 c.setImgs(StringUtil.getImgStr(c.getContent()));
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
	 
	 @RequestMapping("/content/mylist")
	 public @ResponseBody String list(int page,HttpServletRequest request,Model model){
		 HttpSession session = request.getSession();
		 User user = (User)session.getAttribute("user");
		 int userId = user.getId();
		 int pageSize = 10;
		 Map<String,Object> returnMap = new HashMap<String, Object>();
		 
		 
		 int count = contentService.getListCountToUserId(userId);
		 PageUtil pu = new PageUtil(page, count, pageSize);
		 List<Content> list = contentService.getListToUserId(page,pageSize,userId);
		 for(Content c:list){
			 c.setStr(StringUtil.HTML2Text(c.getContent()));
			 c.setImgs(StringUtil.getImgStr(c.getContent()));
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
	 
	 @RequestMapping("/content/plist")
	 public @ResponseBody String plist(int page,int projectId,HttpServletRequest request,Model model){
		 int pageSize = 10;
		 Map<String,Object> returnMap = new HashMap<String, Object>();
		 
		 
		 int count = contentService.getListCountToUserId(projectId);
		 PageUtil pu = new PageUtil(page, count, pageSize);
		 List<Content> list = contentService.getListToProjectId(page,pageSize,projectId);
		 for(Content c:list){
			 c.setStr(StringUtil.HTML2Text(c.getContent()));
			 c.setImgs(StringUtil.getImgStr(c.getContent()));
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
	 
	 @RequestMapping("/content/add")
	 public @ResponseBody Map<String,Object> add(Content c,HttpServletRequest request,Model model){
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
		 }else{
			 message = "服务器繁忙，帖子发布失败!";
			 code = 205;
		 }
		 
		 returnMap.put("code", code);
		 returnMap.put("message", message);
		 
		 return returnMap;
	 }
	 
	 @RequestMapping("/contents")
	 public String contents(int deptId,HttpServletRequest request,Model model){
		 
		 Department dept = departmentService.get(deptId);
		 
		 List<Project> projects = projectService.findAll();
		 List<Department> depts = departmentService.findAll();
		 model.addAttribute("projects",projects);
		 model.addAttribute("depts",depts);
		 model.addAttribute("dept",dept);
		 
		 
		 return "content/contents";
	 }
	 
	 @RequestMapping("/content/cont")
	 public String content(int id,HttpServletRequest request,Model model){
		 
		 Content c = contentService.get(id);
		 
		 model.addAttribute("content",c);
		 
		 return "content/content";
	 }
	 
}
