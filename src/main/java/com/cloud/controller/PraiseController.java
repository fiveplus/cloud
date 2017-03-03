package com.cloud.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cloud.entity.User;
import com.cloud.service.PraiseService;

@Controller
@RequestMapping("/")
public class PraiseController {
	private static final Logger LOGGER = Logger.getLogger(PraiseController.class);
	
	@Autowired
	private PraiseService praiseService;
	
	@RequestMapping("/praise/save")
	public @ResponseBody Map<String,Object> save(int contentId,HttpServletRequest request,Model model){
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		Map<String,Object> returnMap = new HashMap<String, Object>();
		
		
		
		return returnMap;
	}
	
	
}
