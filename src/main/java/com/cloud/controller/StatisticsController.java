package com.cloud.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller  
@RequestMapping("/") 
public class StatisticsController {
	private static final Logger LOGGER = Logger.getLogger(StatisticsController.class);
	
	@RequestMapping("/statistics")
	public String statistics(HttpServletRequest request,Model model){
		return "statistics/statistics";
	}
}
