package com.cloud.controller;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
/**
 * APP程序列表
 * @author hack
 *
 */
@Controller  
@RequestMapping("/app") 
public class ApplicationController {
	private static final Logger LOGGER = Logger.getLogger(ApplicationController.class);
	@RequestMapping("/list")
	public String list(HttpServletRequest request,Model model){
		return "application/applications";
	}
	
}
