package com.cloud.controller;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
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

import com.cloud.controller.bo.StatBO;
import com.cloud.entity.Project;
import com.cloud.entity.SysLog;
import com.cloud.entity.User;
import com.cloud.service.CommentService;
import com.cloud.service.ContentService;
import com.cloud.service.PraiseService;
import com.cloud.service.ProjectService;
import com.cloud.service.SysLogService;
import com.cloud.service.UserProjectService;
import com.cloud.service.UserService;
import com.cloud.util.StringUtil;

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
	
	@Autowired
	private CommentService commentService;
	
	@Autowired
	private UserProjectService userProjectService;
	
	@Autowired
	private PraiseService praiseService;
	
	@Autowired
	private ProjectService projectService;
	
	@RequestMapping("/msg")
	public String calmsg(HttpServletRequest request,Model model){
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		List<SysLog> list = sysLogService.getListToUserId(user.getId());
		
		model.addAttribute("logs",list);
		
		return "my/msg";
	}
	
	@RequestMapping("/msg/delete.json")
	public @ResponseBody Map<String,Object> del_msg(int id,HttpServletRequest request,Model model){
		Map<String,Object> returnMap = new HashMap<String, Object>();
		int code = 200;
		String message = "恭喜您，消息删除成功！";
		SysLog log = sysLogService.get(id);
		if(log != null){
			sysLogService.delete(id);
		}
		
		returnMap.put("code", code);
		returnMap.put("message", message);
		
		return returnMap;
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
	
	@RequestMapping("/stats")
	public String statistics(HttpServletRequest request,Model model){
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		//帖子数
		int count = contentService.getListCountToUserId(user.getId());
		//评论数
		int ccount = commentService.getListCountToUserId(user.getId());
		//阅读数
		int sum = contentService.getReadCountSumToUserId(user.getId());
		 
		model.addAttribute("count",count);
		model.addAttribute("ccount",ccount);
		model.addAttribute("sum",sum);
		
		List<Project> projects = projectService.getProjectToUserId(user.getId());
		for(Project p:projects){
			List<User> users = userProjectService.getUserToProjectId(p.getId());
			p.setUsers(users);
		}
		model.addAttribute("projects",projects);
		
		
		return "my/statistics";
	}
	
	@RequestMapping("/content_stat.json")
	public @ResponseBody Map<String,Object> content(HttpServletRequest request,Model model){
		HttpSession session = request.getSession();
		Map<String,Object> returnMap = new HashMap<String, Object>();
		int code = 0;
		String msg = "";
		User user = (User)session.getAttribute("user");
		List<StatBO> contents = init_daylist();
		List<StatBO> comments = init_daylist();
		List<StatBO> praises = init_daylist();
		
		Map<String,Long> offsetTime = StringUtil.getBeforeTimeAndNowTime(-6);
		List<StatBO> clist = contentService.getCountToUserIdAndCreateTime(user.getId(),offsetTime);
		List<StatBO> clist2 = commentService.getCountToUserIdAndCreateTime(user.getId(),offsetTime);
		List<StatBO> plist = praiseService.getCountToUserIdAndCreateTime(user.getId(),offsetTime);
		contents = update_daylist(contents, clist);
		comments = update_daylist(comments, clist2);
		praises = update_daylist(praises, plist);
		
		returnMap.put("code", code);
		returnMap.put("msg",msg);
		returnMap.put("contents", contents);
		returnMap.put("comments", comments);
		returnMap.put("praises", praises);
		
		return returnMap;
	}
	
	private List<StatBO> init_daylist(){
		List<StatBO> bolist = new ArrayList<StatBO>();
		Date now = new Date();
		//String nowdate = StringUtil.formatDate(now,"yyyy-MM-dd");
		bolist.add(new StatBO(now,0l));
		Calendar cal = Calendar.getInstance();
		cal.setTime(now);
		for(int i = 0;i < 6;i++){
			cal.add(Calendar.DATE, -1);
			Date d = cal.getTime();
			//String date = StringUtil.formatDate(d,"yyyy-MM-dd");
			bolist.add(new StatBO(d,0l));
		}
		//倒序排列
		Collections.reverse(bolist);
		return bolist;
	}
	
	private List<StatBO> update_daylist(List<StatBO> big,List<StatBO> small){
		for(StatBO sb:big){
			String bname = StringUtil.formatDate(sb.getName(), "yyyy-MM-dd");
			for(StatBO sbs:small){
				String sname = StringUtil.formatDate(sbs.getName(), "yyyy-MM-dd");
				if(sname.equals(bname)){
					sb.setCount(sbs.getCount());
					break;
				}
			}
		}
		return big;
	}
}
