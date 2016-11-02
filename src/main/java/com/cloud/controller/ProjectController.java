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

import com.cloud.entity.Project;
import com.cloud.entity.User;
import com.cloud.service.ProjectService;
import com.cloud.service.UserProjectService;
import com.cloud.util.StringUtil;

@Controller  
@RequestMapping("/") 
public class ProjectController {
	private static final Logger LOGGER = Logger.getLogger(ProjectController.class);
	
	@Autowired
	private ProjectService projectService;
	
	@Autowired
	private UserProjectService userProjectService;
	
	
	@RequestMapping("/proj")
	public String project(int id,HttpServletRequest request,Model model){
		Project p = projectService.get(id);
		List<User> users = userProjectService.getUserToProjectId(id);
		model.addAttribute("project",p);
		
		model.addAttribute("users",users);
		
		return "project/project";
	}
	
	@RequestMapping("/project/add")
	public @ResponseBody Map<String,Object> add(Project p,HttpServletRequest request,Model model){
		HttpSession session = request.getSession();
		Map<String,Object> returnMap = new HashMap<String, Object>();
		User user = (User)session.getAttribute("user");
		p.setCreateTime(StringUtil.getDateToLong(new Date()));
		p.setUser(user);
		
		int id = projectService.save(p);
		String message = "";
		int code = 200;
		if(id > 0){
			code = 200;
			message = "恭喜您，项目创建成功!";
		}else{
			code = 205;
			message = "很抱歉，项目创建失败!";
		}
		returnMap.put("message", message);
		returnMap.put("code", code);
		returnMap.put("id", id);
		
		
		return returnMap;
	}
	
	@RequestMapping("/projectset")
	public String projectset(int id,HttpServletRequest request,Model model){
		Project project = projectService.get(id);
		model.addAttribute("project",project);
		return "project/projectset";
	}
	
	@RequestMapping("/project/update")
	public Map<String,Object> update(Project p,HttpServletRequest request,Model model){
		Map<String,Object> returnMap = new HashMap<String, Object>();
		int code = 200;
		
		projectService.update(p);
		
		String message = "恭喜您，项目修改成功!";
		returnMap.put("message", message);
		returnMap.put("code", code);
		
		return returnMap;
	}
	
}
