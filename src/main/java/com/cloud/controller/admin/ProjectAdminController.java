package com.cloud.controller.admin;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

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
	
	@RequestMapping("/addinit")
	public String adddinit(HttpServletRequest request,Model model){
		return "admin/project/add_project";
	}
	
	@RequestMapping("/add")
	public String add(Project p,HttpServletRequest request,Model model){
		p.setCreateTime(StringUtil.getDateToLong(new Date()));
		int id = projectService.save(p);
		if(id > 0){
			String message = "恭喜您，项目创建成功!";
			String returnURL = "project/list?page=1";
			model.addAttribute("message",message);
			model.addAttribute("returnURL",returnURL);
			return "admin/success";
		}else{
			String message = "很抱歉，项目创建失败!";
			model.addAttribute("message",message);
			return "admin/error";
		}
	}
	
	@RequestMapping("/updateInit")
	public String updateInit(int id,HttpServletRequest request,Model model){
		Project p = projectService.get(id);
		model.addAttribute("project",p);
		return "admin/project/update_project";
	}
	
	@RequestMapping("/update")
	public String update(Project project,HttpServletRequest request,Model model){
		projectService.update(project);
		String message = "恭喜您，项目修改成功!";
		String returnURL = "project/list?page=1";
		model.addAttribute("message",message);
		model.addAttribute("returnURL",returnURL);
		return "admin/success";
	}
	
	
}
