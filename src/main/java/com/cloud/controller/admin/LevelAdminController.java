package com.cloud.controller.admin;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cloud.entity.Level;
import com.cloud.service.LevelService;
import com.cloud.util.PageUtil;
import com.cloud.util.StringUtil;

@Controller
@RequestMapping("/admin/level")
public class LevelAdminController {
	
	private static final Logger LOGGER = Logger.getLogger(LevelAdminController.class);
	
	@Autowired
	private LevelService levelService;
	
	@RequestMapping("/list")
	public String list(int page,HttpServletRequest request,Model model){
		int pageSize = 10;
		int count = levelService.getListCount(null,null);
		PageUtil pu = new PageUtil(page, count, pageSize);
		List<Level> list = levelService.getList(page,pageSize,null,null);
		
		model.addAttribute("pu",pu);
		model.addAttribute("levels",list);
		
		return "admin/level/levels";
	}
	
	@RequestMapping("/addinit")
	public String addinit(HttpServletRequest request,Model model){
		List<Level> parents = levelService.getParentList();
		model.addAttribute("parents",parents);
		return "admin/level/add_level";
	}
	
	@RequestMapping("/add")
	public String add(Level level,HttpServletRequest request,Model model){
		level.setCreateTime(StringUtil.getDateToLong(new Date()));
		if(level.getLevel().getId() == null){
			level.setLevel(null);
		}
		int id = levelService.save(level);
		if(id > 0){
			String message = "恭喜您，职位级别创建成功!";
			String returnURL = "level/list?page=1";
			model.addAttribute("message",message);
			model.addAttribute("returnURL",returnURL);
			return "admin/success";
		}else{
			String message = "很抱歉，职位级别创建失败！";
			model.addAttribute("message",message);
			return "admin/error";
		}
		
	}
	
	@RequestMapping("/updateInit")
	public String updateInit(int id,HttpServletRequest request,Model model){
		
		Level level = levelService.get(id);
		List<Level> parents = levelService.getParentList();
		model.addAttribute("level",level);
		model.addAttribute("parents",parents);
		
		return "admin/level/update_level";
	}
	
	@RequestMapping("/update")
	public String update(Level level,HttpServletRequest request,Model model){
		levelService.update(level,level.getId());
		String message = "恭喜您。职位级别更新成功!";
		String returnURL = "level/list?page=1";
		model.addAttribute("message",message);
		model.addAttribute("returnURL",returnURL);
		
		return "admin/success";
	}
	
	
	@RequestMapping("childs")
	public @ResponseBody Map<String,Object> childs(int id,HttpServletRequest request,Model model){
		Map<String,Object> returnMap = new HashMap<String, Object>();
		
		List<Level> childs = levelService.getChildList(id);
		
		returnMap.put("childs", childs);
		
		return returnMap;
	}
	
}
