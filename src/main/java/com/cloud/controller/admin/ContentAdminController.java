package com.cloud.controller.admin;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cloud.entity.Content;
import com.cloud.service.ContentService;
import com.cloud.util.PageUtil;
/**
 * 发布
 * @author hack
 *
 */
@Controller  
@RequestMapping("/admin/content") 
public class ContentAdminController {
	private static final Logger LOGGER = Logger.getLogger(ContentAdminController.class);
	
	@Autowired
	private ContentService contentService;
	
	@RequestMapping("/list")
	public String list(int page,HttpServletRequest request,Model model){
		int pageSize = 10;
		int count = contentService.getListCount(null, null);
		PageUtil pu = new PageUtil(page, count, pageSize);
		List<Content> list = contentService.getList(page, pageSize, null, null);
		model.addAttribute("pu",pu);
		model.addAttribute("contents",list);
		return "admin/content/contents";
	}
	
}
