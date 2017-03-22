package com.cloud.controller;

import java.util.ArrayList;
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

import com.cloud.controller.bo.CalendarBO;
import com.cloud.entity.Calendar;
import com.cloud.entity.SysLog;
import com.cloud.entity.User;
import com.cloud.service.CalendarService;
import com.cloud.service.SysLogService;
import com.cloud.service.UserService;
import com.cloud.util.StringUtil;
/**
 * 日历列表
 * @author hack
 *
 */
@Controller  
@RequestMapping("/calendar") 
public class CalendarController {
	private static final Logger LOGGER = Logger.getLogger(CalendarController.class);
	
	@Autowired
	private CalendarService calendarService;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private SysLogService sysLogService;
	
	@RequestMapping("/get")
	public String get(HttpServletRequest request,Model model){
		List<User> users = userService.findAll();
		model.addAttribute("users",users);
		
		return "calendar/calendar";
	}
	
	@RequestMapping("/save.json")
	public @ResponseBody Map<String,Object> save(Calendar c,HttpServletRequest request,Model model){
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		Map<String,Object> returnMap = new HashMap<String, Object>();
		
		String userid = request.getParameter("userid");
		User assignUser = userService.get(Integer.parseInt(userid));
		
		c.setCreateUser(user);
		c.setAssignUser(assignUser);
		c.setContent(c.getContent());
		c.setTitle(c.getTitle());
		c.setStatus("W");
		c.setStartTime(StringUtil.getStringToLong(c.getStart(),"yyyy-MM-dd HH:mm"));
		c.setEndTime(StringUtil.getStringToLong(c.getEnd(),"yyyy-MM-dd HH:mm"));
		
		//TODO 
		
		int id = calendarService.save(c);
		String message = "";
		if(id > 0){
			//TODO 建立日志
			//你的日程"title"发布成功，请等待用户username的审核哦～
			String title = "日程消息";
			String content = "你的日程 \""+StringUtil.substring(c.getTitle(), 10)+"\"发布成功,请耐心等待用户"+assignUser.getUsername()+"的审核哦~";
			SysLog log = new SysLog();
			log.setTitle(title);
			log.setContent(content);
			log.setUser(user);
			log.setCreateTime(StringUtil.getDateToLong(new Date()));
			sysLogService.save(log);
			
			message = "恭喜您，日程创建成功，请等待审核!";
		}else{
			message = "很抱歉，日称创建失败!";
		}
		returnMap.put("message", message);
		
		return returnMap;
	}
	
	@RequestMapping("/list.json")
	public @ResponseBody Map<String,Object> list(int userid,HttpServletRequest request,Model model){
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		Map<String,Object> returnMap = new HashMap<String, Object>();
		
		if(userid == 0){
			userid = user.getId();
		}
		
		List<Calendar> list = calendarService.getCalendarToAssignUserAndStatus(userid, "Y");
		List<CalendarBO> bolist = new ArrayList<CalendarBO>();
		
		for(Calendar c:list){
			CalendarBO cbo = new CalendarBO();
			cbo.setId(c.getId());
			cbo.setTitle(c.getTitle());
			cbo.setStart(StringUtil.getLongToString(c.getStartTime(),"yyyy-MM-dd'T'HH:mm:ss"));
			cbo.setEnd(StringUtil.getLongToString(c.getEndTime(),"yyyy-MM-dd'T'HH:mm:ss"));
			bolist.add(cbo);
		}
		
		returnMap.put("bolist", bolist);
		
		return returnMap;
	}
	
	//TODO 事件审核作废
	/*
	@RequestMapping("/calexam")
	public String calexam(HttpServletRequest request,Model model){
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		List<Calendar> calendars = calendarService.getCalendarToAssignUserAndStatus(user.getId(),"W");
		
		model.addAttribute("calendars",calendars);
		
		return "calendar/calexam";
	}*/
	
	@RequestMapping("/get.json")
	public @ResponseBody Map<String,Object> get(int id,HttpServletRequest request,Model model){
		Map<String,Object> returnMap = new HashMap<String, Object>();
		
		Calendar c = calendarService.get(id);
		
		returnMap.put("calendar", c);
		
		return returnMap;
	}
	
	@RequestMapping("/update.json")
	public @ResponseBody Map<String,Object> update(int id,String status,HttpServletRequest request,Model model){
		Map<String,Object> returnMap = new HashMap<String, Object>();
		Calendar c = calendarService.get(id);
		c.setStatus(status);
		
		calendarService.update(c,c.getId());
		
		String message = "恭喜您，审核成功！";
		
		//TODO 插入日志，提醒用户
		//您的日程"title"发布成功，请等待用户username的审核哦～
		String title = "日程消息";
		String content = "你的日程\""+StringUtil.substring(c.getTitle(), 10)+"\"审核";
		if(status.equals("Y")){
			content += "通过，哎哟不错哦~";
		}else{
			content += "未通过，别灰心哦~";
		}
		SysLog log = new SysLog();
		log.setTitle(title);
		log.setContent(content);
		log.setUser(c.getCreateUser());
		log.setCreateTime(StringUtil.getDateToLong(new Date()));
		sysLogService.save(log);
		
		
		returnMap.put("message", message);
		
		return returnMap;
	}
	
	/**
	 * 时间段是否重叠
	 * @param list
	 * @param c
	 * @return 重叠返回true
	 */
	private boolean isRepeat(List<Calendar> list,Calendar c){
		boolean flag = false;
		long start = c.getStartTime();
		long end = c.getEndTime();
		for(Calendar cal:list){
			if( (start < cal.getEndTime() && start > cal.getStartTime()) 
					|| (end < cal.getEndTime() && end > cal.getStartTime() ) ){
				flag = true;
				break;
			}
		}
		return flag;
	}
	
}
