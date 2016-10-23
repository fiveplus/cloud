package com.cloud.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller  
@RequestMapping("/") 
public class ApplicationController {
	private static final Logger LOGGER = Logger.getLogger(ApplicationController.class);
	
	@RequestMapping("/applist")
	public String list(HttpServletRequest request,Model model){
		return "application/applications";
	}
	
}
