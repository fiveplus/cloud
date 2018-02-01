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

import com.cloud.util.DateUtil;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cloud.controller.bo.RankBO;
import com.cloud.controller.bo.StatBO;
import com.cloud.entity.Department;
import com.cloud.entity.Project;
import com.cloud.entity.Theme;
import com.cloud.entity.User;
import com.cloud.service.CommentService;
import com.cloud.service.ContentService;
import com.cloud.service.DepartmentService;
import com.cloud.service.PraiseService;
import com.cloud.service.ProjectService;
import com.cloud.service.ThemeService;
import com.cloud.service.UserProjectService;
import com.cloud.util.StringUtil;

@Controller  
@RequestMapping("/stat") 
public class StatisticsController {
	private static final Logger LOGGER = Logger.getLogger(StatisticsController.class);
	
	@Autowired
	private CommentService commentService;
	
	@Autowired
	private ContentService contentService;
	
	@Autowired
	private PraiseService praiseService;
	
	@Autowired
	private ProjectService projectService;
	
	@Autowired
	private UserProjectService userProjectService;
	
	@Autowired
	private ThemeService themeService;
	
	@Autowired
	private DepartmentService departmentService;
	
	@RequestMapping("/stats")
	public String statistics(HttpServletRequest request,Model model){
		
		List<Project> projects = projectService.findAll();
		for(Project p:projects){
			List<User> users = userProjectService.getUserToProjectId(p.getId());
			p.setUsers(users);
		}
		model.addAttribute("projects",projects);
		
		return "statistics/statistics";
	}
	
	@RequestMapping("/content_stat.json")
	public @ResponseBody Map<String,Object> content(HttpServletRequest request,Model model){
		HttpSession session = request.getSession();
		Map<String,Object> returnMap = new HashMap<String, Object>();
		int code = 0;
		String msg = "";
		List<StatBO> contents = init_daylist();
		List<StatBO> comments = init_daylist();
		List<StatBO> praises = init_daylist();
		
		Map<String,Long> offsetTime = DateUtil.getBeforeTimeAndNowTime(-29);
		List<StatBO> clist = contentService.getCountToUserIdAndCreateTime(0,offsetTime);
		List<StatBO> clist2 = commentService.getCountToUserIdAndCreateTime(0,offsetTime);
		List<StatBO> plist = praiseService.getCountToUserIdAndCreateTime(0,offsetTime);
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
	
	@RequestMapping("/dept_stat.json")
	public @ResponseBody Map<String,Object> dept_stat(HttpServletRequest request,Model model){
		Map<String,Object> returnMap = new HashMap<String, Object>();
		int code = 0;
		String msg = "";
		Map<String,Long> offsetTime = DateUtil.getBeforeTimeAndNowTime(-29);
		List<Theme> themes = themeService.findAll();
		List<Department> ds = departmentService.findAll();
		List<RankBO> depts = contentService.getCountToDeptNameAndCreateTime(offsetTime);
		
		returnMap.put("code", code);
		returnMap.put("msg", msg);
		returnMap.put("depts", depts);
		returnMap.put("themes", themes);
		returnMap.put("ds", ds);
		
		return returnMap;
	}
	
	private List<StatBO> init_daylist(){
		List<StatBO> bolist = new ArrayList<StatBO>();
		Date now = new Date();
		//String nowdate = StringUtil.formatDate(now,"yyyy-MM-dd");
		bolist.add(new StatBO(now,0l));
		Calendar cal = Calendar.getInstance();
		cal.setTime(now);
		for(int i = 0;i < 29;i++){
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
			String bname = DateUtil.convertDate(sb.getName(), "yyyy-MM-dd");
			for(StatBO sbs:small){
				String sname = DateUtil.convertDate(sbs.getName(), "yyyy-MM-dd");
				if(sname.equals(bname)){
					sb.setCount(sbs.getCount());
					break;
				}
			}
		}
		return big;
	}
	
}
