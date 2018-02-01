package com.cloud.controller;

import java.util.Date;
import java.util.HashMap;
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

import com.cloud.entity.Praise;
import com.cloud.entity.User;
import com.cloud.service.PraiseService;
import com.cloud.util.StringUtil;

@Controller
@RequestMapping("/praise")
public class PraiseController {
	private static final Logger LOGGER = Logger.getLogger(PraiseController.class);
	
	@Autowired
	private PraiseService praiseService;
	
	@RequestMapping("/save.json")
	public @ResponseBody Map<String,Object> save(int contentId,HttpServletRequest request,Model model){
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		Map<String,Object> returnMap = new HashMap<String, Object>();
		
		Praise praise = praiseService.getPraiseByContentIdAndUserId(contentId, user.getId());
		int code = 200;
		String msg = "点赞成功。";
		if(praise != null){
			praiseService.delete(praise.getId());
			code = 201;
			msg = "消赞成功。";
		}else{
			praise = new Praise();
			praise.setContentId(contentId);
			praise.setCreateTime(DateUtil.convertDate(new Date()));
			praise.setUserId(user.getId());
			praiseService.save(praise);
		}
		
		returnMap.put("code", code);
		returnMap.put("msg", msg);
		
		return returnMap;
	}
	
	
}
