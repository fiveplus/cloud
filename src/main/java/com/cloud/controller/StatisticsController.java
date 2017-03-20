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
import com.cloud.entity.User;
import com.cloud.service.CommentService;
import com.cloud.service.ContentService;
import com.cloud.util.StringUtil;

@Controller  
@RequestMapping("/") 
public class StatisticsController {
	private static final Logger LOGGER = Logger.getLogger(StatisticsController.class);
	
	@Autowired
	private CommentService commentService;
	
	@Autowired
	private ContentService contentService;
	
	@RequestMapping("/stat")
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
		
		
		return "statistics/statistics";
	}
	
	@RequestMapping("/stat/content.json")
	public @ResponseBody Map<String,Object> content(HttpServletRequest request,Model model){
		HttpSession session = request.getSession();
		Map<String,Object> returnMap = new HashMap<String, Object>();
		int code = 0;
		String msg = "";
		User user = (User)session.getAttribute("user");
		List<StatBO> statlist = new ArrayList<StatBO>();
		Date now = new Date();
		String nowdate = StringUtil.formatDate(now,"yyyy-MM-dd");
		statlist.add(new StatBO(nowdate,0l));
		Calendar cal = Calendar.getInstance();
		cal.setTime(now);
		for(int i = 0;i < 6;i++){
			cal.add(Calendar.DATE, -1);
			Date d = cal.getTime();
			String date = StringUtil.formatDate(d,"yyyy-MM-dd");
			statlist.add(new StatBO(date,0l));
		}
		//倒序排列
		Collections.reverse(statlist);
		Map<String,Long> offsetTime = StringUtil.getBeforeTimeAndNowTime(-6);
		List<StatBO> bolist = contentService.getCountToUserIdAndCreateTime(user.getId(),offsetTime);
		for(StatBO sb:statlist){
			for(StatBO sbs:bolist){
				if(sbs.getColumn().equals(sb.getColumn())){
					sb.setCount(sbs.getCount());
					break;
				}
			}
		}
		
		returnMap.put("code", code);
		returnMap.put("msg",msg);
		returnMap.put("bolist", statlist);
		
		return returnMap;
	}
	
}
