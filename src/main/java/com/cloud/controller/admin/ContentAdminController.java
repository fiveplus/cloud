package com.cloud.controller.admin;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.cloud.util.DateUtil;
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
		String dateRangePicker = request.getParameter("dateRangePicker");
		Map<String,Long> betweens = null;
		if(dateRangePicker != null && !dateRangePicker.equals("")){
			betweens = DateUtil.getBetweenTime(dateRangePicker);
		}
		String username = request.getParameter("username");
		int count = contentService.getListCount(username,betweens);
		PageUtil pu = new PageUtil(page, count, pageSize);
		List<Content> list = contentService.getListToUsername(page, pageSize, username,betweens);
		model.addAttribute("pu",pu);
		model.addAttribute("contents",list);
		
		model.addAttribute("dateRangePicker",dateRangePicker);
		model.addAttribute("username",username);
		
		return "admin/content/contents";
	}
	
	
}
