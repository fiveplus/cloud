package com.cloud.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cloud.entity.Content;
import com.cloud.entity.Department;
import com.cloud.entity.Project;
import com.cloud.entity.User;
import com.cloud.service.ContentService;
import com.cloud.service.DepartmentService;
import com.cloud.service.ProjectService;
import com.cloud.util.StringUtil;
/**
 * 主页
 * @author hack
 *
 */
@Controller  
@RequestMapping("/") 
public class IndexController {
	 private static final Logger LOGGER = Logger.getLogger(IndexController.class);
	 
	 @Autowired
	 private ProjectService projectService;
	 @Autowired
	 private DepartmentService departmentService;
	 @Autowired
	 private ContentService contentService;
	 
	 
	 @RequestMapping("/index")
	 public String index(HttpServletRequest request,Model model){
		 HttpSession session = request.getSession();
		 User user = (User) session.getAttribute("user");
		 if(user == null){
			 return "login";
		 }else{
			 //TODO 登录验证成功
			 List<Project> projects = projectService.findAll();
			 List<Department> depts = departmentService.findAll();
			 model.addAttribute("projects",projects);
			 model.addAttribute("depts",depts);
			 
			
			 
			 return "index";
		 }
	 }
	 
	 @RequestMapping("/logout")
	 public String logout(HttpServletRequest request,Model model){
		 request.getSession().invalidate();
		 return "login";
	 }
	 
}
