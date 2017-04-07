package com.cloud.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.cloud.entity.User;
import com.cloud.entity.UserFile;
import com.cloud.service.UserFileService;
import com.cloud.util.PageUtil;

@Controller
@RequestMapping("/file")
public class UserFileController {
	private static final Logger LOGGER = Logger.getLogger(UserFileController.class);
	
	@Autowired
	private UserFileService userFileService;
	
	@RequestMapping("/list")
	public String list(int page,int deptId,HttpServletRequest request,Model model){
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		if(deptId == 0){
			deptId = user.getDept().getId();
		}
		int pageSize = 10;
		int count = userFileService.getListCountToDeptId(deptId);
		PageUtil pu = new PageUtil(page, count, pageSize);
		List<UserFile> list = userFileService.getListToDeptId(page,pageSize,deptId);
		
		model.addAttribute("pu",pu);
		model.addAttribute("list",list);
		
		return "file/files";
	}
}
