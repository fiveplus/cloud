package com.cloud.controller;

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

import com.cloud.entity.SysLog;
import com.cloud.entity.User;
import com.cloud.service.ContentService;
import com.cloud.service.SysLogService;
import com.cloud.service.UserService;

@Controller
@RequestMapping("/my")
public class MyController {
	private static final Logger LOGGER = Logger.getLogger(MyController.class);
	
	@Autowired
	private SysLogService sysLogService;
	
	@Autowired
	private ContentService contentService;
	
	@Autowired
	private UserService userService;
	
	@RequestMapping("/msg")
	public String calmsg(HttpServletRequest request,Model model){
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		List<SysLog> list = sysLogService.getListToUserId(user.getId());
		
		model.addAttribute("logs",list);
		
		return "my/msg";
	}
	
	@RequestMapping("/getlog.json")
	public @ResponseBody Map<String,Object> getlog(int id,HttpServletRequest request,Model model){
		Map<String,Object> returnMap = new HashMap<String, Object>();
		
		SysLog log = sysLogService.get(id);
		
		returnMap.put("log", log);
		
		return returnMap;
	}
	
	@RequestMapping("/me")
	public String my(HttpServletRequest request,Model model){
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		model.addAttribute("u", user);
		return "my/me";
	}
	
	@RequestMapping("/contents")
	public String mycontents(HttpServletRequest request,Model model){
		
		return "my/contents";
	}
	
	@RequestMapping("/calendar")
	public String calendar(HttpServletRequest request,Model model){
		List<User> users = userService.findAll();
		model.addAttribute("users",users);
		return "my/calendar";
	}
	
}
