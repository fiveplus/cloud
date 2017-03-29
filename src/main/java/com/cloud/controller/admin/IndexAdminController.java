package com.cloud.controller.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cloud.entity.User;


@Controller  
@RequestMapping("/admin") 
public class IndexAdminController {
	 private static final Logger LOGGER = Logger.getLogger(IndexAdminController.class);
	 
	 @RequestMapping("/index")
	 public String index(HttpServletRequest request,Model model){
		 HttpSession session = request.getSession();
		 User user = (User) session.getAttribute("user");
		 if(user == null){
			 return "admin/login";
		 }else{
			 return "admin/index";
		 }
	 }
	 
	 @RequestMapping("/logout")
	 public String logout(HttpServletRequest request,Model model){
		 request.getSession().invalidate();
		 return "admin/login";
	 }
	 
	 @RequestMapping("/login")
	 public String login(HttpServletRequest request,Model model){
		 return "admin/login";
	 }

}
