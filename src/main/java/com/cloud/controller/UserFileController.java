package com.cloud.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.aspectj.internal.lang.annotation.ajcDeclareAnnotation;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.cloud.entity.Department;
import com.cloud.entity.Project;
import com.cloud.entity.Theme;
import com.cloud.entity.User;
import com.cloud.entity.UserFile;
import com.cloud.service.DepartmentService;
import com.cloud.service.ProjectService;
import com.cloud.service.ThemeService;
import com.cloud.service.UserFileService;
import com.cloud.util.PageUtil;

@Controller
@RequestMapping("/file")
public class UserFileController {
	private static final Logger LOGGER = Logger.getLogger(UserFileController.class);
	
	@Autowired
	private UserFileService userFileService;
	
	@Autowired
	private DepartmentService departmentService;
	
	@Autowired
	private ProjectService projectService;
	
	@Autowired
	private ThemeService themeService;
	
	@RequestMapping("/list")
	public String list(int page,int deptId,HttpServletRequest request,Model model){
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		if(deptId == 0){
			deptId = user.getDept().getId();
		}
		int pageSize = 10;
		int count = userFileService.getListCountToDeptId(deptId);
		PageUtil pu = new PageUtil(page, count, pageSize);
		List<UserFile> list = userFileService.getListToDeptId(page,pageSize,deptId);
		
		model.addAttribute("pu",pu);
		model.addAttribute("list",list);
		
		Department dept = departmentService.get(deptId);
		 
		List<Project> projects = projectService.findAll();
		List<Department> depts = departmentService.findAll();
		List<Theme> themes = themeService.findAll();
		model.addAttribute("projects",projects);
		model.addAttribute("depts",depts);
		model.addAttribute("dept",dept);
		model.addAttribute("themes",themes);
		
		
		return "file/files";
	}
}
