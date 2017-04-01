package com.cloud.controller.admin;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
	
	@RequestMapping("/add")
	public String add(HttpServletRequest request,Model model){
		return "admin/theme/add_theme";
	}
	
	@RequestMapping("/save.json")
	public @ResponseBody Map<String,Object> save(Theme theme,HttpServletRequest request,Model model){
		Map<String,Object> returnMap = new HashMap<String, Object>();
		int code = 200;
		String msg = "恭喜您，主题创建成功!";
		
		theme.setCreateTime(StringUtil.getDateToLong(new Date()));
		int id = themeService.save(theme);
		if(id > 0){
			
		}else{
			code = -1;
			msg = "很抱歉，主题创建失败!";
		}
		
		returnMap.put("code", code);
		returnMap.put("msg", msg);
		return returnMap;
	}
	
	@RequestMapping("/upt")
	public String upt(int id,HttpServletRequest request,Model model){
		Theme theme = themeService.get(id);
		model.addAttribute("theme",theme);
		return "admin/theme/update_theme";
	}
	
	@RequestMapping("/update.json")
	public @ResponseBody Map<String,Object> update(Theme theme,HttpServletRequest request,Model model){
		Map<String,Object> returnMap = new HashMap<String, Object>();
		int code = 200;
		String msg = "恭喜您，主题修改成功!";
		
		themeService.update(theme,theme.getId());
		
		returnMap.put("code", code);
		returnMap.put("msg", msg);
		return returnMap;
	}
	
	@RequestMapping("/delete.json")
	public @ResponseBody Map<String,Object> delete(int id,HttpServletRequest request,Model model){
		Map<String,Object> returnMap = new HashMap<String, Object>();
		String msg = "恭喜您，主题删除成功！";
		int code = 200;
		
		themeService.delete(id);
		
		returnMap.put("code", code);
		returnMap.put("msg", msg);
		return returnMap;
	}
	
}
