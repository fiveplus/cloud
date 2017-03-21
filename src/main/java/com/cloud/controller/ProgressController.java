package com.cloud.controller;

import java.io.PrintWriter;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cloud.controller.bo.GanttBO;
import com.cloud.controller.bo.Value;
import com.cloud.entity.Progress;
import com.cloud.entity.Project;
import com.cloud.entity.User;
import com.cloud.service.ProgressService;
import com.cloud.service.ProjectService;
import com.cloud.service.UserProjectService;
import com.cloud.util.StringUtil;

@Controller  
@RequestMapping("/") 
public class ProgressController {
	private static final Logger LOGGER = Logger.getLogger(ProgressController.class);

	@Autowired
	private ProjectService projectService;
	
	@Autowired
	private UserProjectService userProjectService;
	
	@Autowired
	private ProgressService progressService;
	
	
	@RequestMapping("/progress")
	public String progress(int id,HttpServletRequest request,Model model){
		
		Project project = projectService.get(id);
		List<User> users = userProjectService.getUserToProjectId(project.getId());
		List<Progress> progresses = progressService.getProgressToProjectId(project.getId());
		
		model.addAttribute("project",project);	
		model.addAttribute("users",users);
		model.addAttribute("progresses",progresses);
				
		return "project/progress";
	}
	
	@RequestMapping("/progress/gantt")
	public void gantt(int id,HttpServletRequest request,HttpServletResponse response) throws Exception{
		
		PrintWriter out = response.getWriter(); 
		response.setContentType("text/html");
		
		List<Progress> progresses = progressService.getProgressToProjectId(id);
		String json = "[";
		for(Progress p:progresses){
			Value v = new Value(p.getStartTime().toString(),p.getEndTime().toString(),p.getTitle());
			GanttBO gbo = new GanttBO(p.getUser().getUsername(), p.getTitle(), v);
			json += gbo.toString()+",";
		}
		json = json.substring(0, json.length()-1);
		json += "]";
		
		out.print(json);
	}
	
	@RequestMapping("/progress/add")
	public @ResponseBody Map<String,Object> add(Progress pg,HttpServletRequest request,Model model){
		Map<String,Object> returnMap = new HashMap<String, Object>();
		
		String dateRangePicker = (String)request.getParameter("dateRangePicker");
		Map<String,Long> betweens = StringUtil.getBetweenTime2(dateRangePicker);
		pg.setStartTime(betweens.get("beforeTime"));
		pg.setEndTime(betweens.get("afterTime"));
		pg.setCreateTime(StringUtil.getDateToLong(new Date()));
		pg.setStatus("Y");
		
		int id = progressService.save(pg);
		String message = "";
		if(id > 0){
			message = "项目计划新增成功!";
		}else{
			message = "项目计划新增失败!";
		}
		returnMap.put("message", message);
		returnMap.put("projectId", pg.getProject().getId());
		
		return returnMap;
	}
	
	@RequestMapping("/progress/updateInit")
	public @ResponseBody Map<String,Object> updateInit(int id,HttpServletRequest request,Model model){
		Map<String,Object> returnMap = new HashMap<String, Object>();
		
		Progress progress = progressService.get(id);
		returnMap.put("progress", progress);
		returnMap.put("dateRangePicker", StringUtil.getBetweenToString2(progress.getStartTime(), progress.getEndTime()));

		return returnMap;
	}
	
	@RequestMapping("/progress/update")
	public @ResponseBody Map<String,Object> update(Progress pg,HttpServletRequest request,Model model){
		Map<String,Object> returnMap = new HashMap<String, Object>();
		
		String dateRangePicker = (String)request.getParameter("dateRangePicker");
		
		Map<String,Long> betweens = StringUtil.getBetweenTime2(dateRangePicker);
		pg.setStartTime(betweens.get("beforeTime"));
		pg.setEndTime(betweens.get("afterTime"));
		
		progressService.update(pg,pg.getId());
		
		String message = "项目计划修改成功!";
		returnMap.put("message", message);
		returnMap.put("projectId", pg.getProject().getId());
		
		return returnMap;
	}
	
	@RequestMapping("/progress/delete")
	public @ResponseBody Map<String,Object> delete(int id,HttpServletRequest request,Model model){
		Map<String,Object> returnMap = new HashMap<String, Object>();
		Progress pg = progressService.get(id);
		
		returnMap.put("projectId", pg.getProject().getId());
		
		progressService.delete(id);
		String message = "项目计划删除成功!";
		returnMap.put("message", message);
		
		return returnMap;
	}
	
	
}
