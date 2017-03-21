package com.cloud.controller.admin;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cloud.entity.Theme;
import com.cloud.service.ThemeService;
import com.cloud.util.PageUtil;
import com.cloud.util.StringUtil;

@Controller  
@RequestMapping("/admin/theme") 
public class ThemeAdminController {
	private static final Logger LOGGER = Logger.getLogger(ThemeAdminController.class);
	
	@Autowired
	private ThemeService themeService;
	
	@RequestMapping("/list")
	public String list(int page,HttpServletRequest request,Model model){
		int pageSize = 10;
		int count = themeService.getListCount(null, null);
		PageUtil pu = new PageUtil(page, count, pageSize);
		List<Theme> list = themeService.getList(page, pageSize, null, null);
		
		model.addAttribute("pu",pu);
		model.addAttribute("themes",list);
		
		return "admin/theme/themes";
	}
	
	@RequestMapping("/addinit")
	public String addinit(HttpServletRequest request,Model model){
		return "admin/theme/add_theme";
	}
	
	@RequestMapping("/add")
	public String add(Theme theme,HttpServletRequest request,Model model){
		theme.setCreateTime(StringUtil.getDateToLong(new Date()));
		int id = themeService.save(theme);
		if(id > 0){
			String message = "恭喜您，主题创建成功!";
			String returnURL = "theme/list?page=1";
			model.addAttribute("message",message);
			model.addAttribute("returnURL",returnURL);
			return "admin/success";
		}else{
			String message = "很抱歉，主题创建失败!";
			model.addAttribute("message",message);
			return "admin/error";
		}
	}
	
	@RequestMapping("/updateInit")
	public String updateInit(int id,HttpServletRequest request,Model model){
		Theme theme = themeService.get(id);
		model.addAttribute("theme",theme);
		return "admin/theme/update_theme";
	}
	
	@RequestMapping("/update")
	public String update(Theme theme,HttpServletRequest request,Model model){
		themeService.update(theme,theme.getId());
		String message = "恭喜您，主题修改成功!";
		String returnURL = "theme/list?page=1";
		model.addAttribute("message",message);
		model.addAttribute("returnURL",returnURL);
		return "admin/success";
	}
	
}
