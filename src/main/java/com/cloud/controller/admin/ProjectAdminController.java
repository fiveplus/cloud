package com.cloud.controller.admin;

import java.util.Date;
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
import com.cloud.service.ProjectService;
import com.cloud.util.PageUtil;
import com.cloud.util.StringUtil;

@Controller  
@RequestMapping("/admin/project") 
public class ProjectAdminController {
	private static final Logger LOGGER = Logger.getLogger(ProjectAdminController.class);
	
	@Autowired
	private ProjectService projectService;
	
	@RequestMapping("/list")
	public String list(int page,HttpServletRequest request,Model model){
		int pageSize = 10;
		int count = projectService.getListCount(null, null);
		PageUtil pu = new PageUtil(page, count, pageSize);
		List<Project> list = projectService.getList(page, pageSize, null, null);
		
		model.addAttribute("pu",pu);
		model.addAttribute("projects",list);
		
		return "admin/project/projects";
	}
	
	@RequestMapping("/add")
	public String add(HttpServletRequest request,Model model){
		return "admin/project/add_project";
	}
	
	@RequestMapping("/save.json")
	public @ResponseBody Map<String,Object> save(Project p,HttpServletRequest request,Model model){
		Map<String,Object> returnMap = new HashMap<String, Object>();
		int code = 200;
		String msg = "恭喜您，项目创建成功!";
		
		p.setCreateTime(StringUtil.getDateToLong(new Date()));
		int id = projectService.save(p);
		if(id > 0){
			
		}else{
			msg = "很抱歉，项目创建失败!";
			code = -1;
		}
		returnMap.put("code", code);
		returnMap.put("msg", msg);
		return returnMap;
	}
	
	@RequestMapping("/upt")
	public String upt(int id,HttpServletRequest request,Model model){
		Project p = projectService.get(id);
		model.addAttribute("project",p);
		return "admin/project/update_project";
	}
	
	@RequestMapping("/update.json")
	public @ResponseBody Map<String,Object> update(Project project,HttpServletRequest request,Model model){
		Map<String,Object> returnMap = new HashMap<String, Object>();
		int code = 200;
		String msg = "恭喜您，项目修改成功!";
		
		projectService.update(project,project.getId());
		
		returnMap.put("code", code);
		returnMap.put("msg", msg);
		return returnMap;
	}
	
	
}
