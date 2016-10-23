package com.cloud.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cloud.entity.Project;
import com.cloud.entity.User;
import com.cloud.entity.UserProject;
import com.cloud.service.ProjectService;
import com.cloud.service.UserProjectService;

@Controller  
@RequestMapping("/") 
public class UserProjectController {
	private static final Logger LOGGER = Logger.getLogger(UserProjectController.class);

	@Autowired
	private ProjectService projectService;
	
	@Autowired
	private UserProjectService userProjectService;
	
	
	@RequestMapping("/projectuser")
	public String projectuser(int id,HttpServletRequest request,Model model){
		Project project = projectService.get(id);
		List<User> users = userProjectService.getUserToProjectId(id);

		model.addAttribute("project",project);
		model.addAttribute("users",users);
		
		return "project/projectuser";
	}
	
	@RequestMapping("/projectuser/add")
	public @ResponseBody Map<String,Object> add(UserProject up,HttpServletRequest request,Model model){
		Map<String,Object> returnMap = new HashMap<String, Object>();
		String message = "";
		Project p = projectService.get(up.getProject().getId());
		UserProject temp = userProjectService.getUserProject(up.getUser().getId(), up.getProject().getId());
		if(temp != null && up.getUser().getId().equals(p.getUser().getId())){
			message = "项目成员已存在!";
		}else{
			int id = userProjectService.save(up);
			if(id > 0){
				message = "项目成员新增成功!";
			}else{
				message = "项目成员新增失败!";
			}
		}
		returnMap.put("message", message);
		returnMap.put("projectId",p.getId());
				
		return returnMap;
	}
	
	@RequestMapping("/projectuser/delete")
	public @ResponseBody Map<String,Object> delete(int userid,int projectid,HttpServletRequest request,Model model){
		Map<String,Object> returnMap = new HashMap<String, Object>();
		
		String message = "";
		UserProject temp = userProjectService.getUserProject(userid, projectid);
		if(temp == null){
			message = "项目成员不存在，删除失败!";
		}else{
			userProjectService.delete(temp.getId());
		}
		
		returnMap.put("message", message);
		returnMap.put("projectId",projectid);
		
		return returnMap;
	}

}
