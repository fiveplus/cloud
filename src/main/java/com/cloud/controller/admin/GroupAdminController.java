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

import com.cloud.entity.Group;
import com.cloud.service.GroupService;
import com.cloud.util.PageUtil;
import com.cloud.util.StringUtil;

@Controller  
@RequestMapping("/admin/group") 
public class GroupAdminController {
	private static final Logger LOGGER = Logger.getLogger(GroupAdminController.class);
	
	@Autowired
	private GroupService groupService;
	
	@RequestMapping("/list")
	public String list(int page,HttpServletRequest request,Model model){
		int pageSize = 10;
		int count = groupService.getListCount(null, null);
		PageUtil pu = new PageUtil(page, count, pageSize);
		List<Group> list = groupService.getList(page, pageSize, null, null);
		
		model.addAttribute("pu",pu);
		model.addAttribute("groups",list);
		
		return "admin/group/groups";
	}
	
	@RequestMapping("/add")
	public String add(HttpServletRequest request,Model model){
		List<Group> parents = groupService.getParentList();
		model.addAttribute("parents",parents);
		return "admin/group/add_group";
	}
	
	@RequestMapping("/save.json")
	public @ResponseBody Map<String,Object> save(Group group,HttpServletRequest request,Model model){
		Map<String,Object> returnMap = new HashMap<String, Object>();
		int code = 200;
		String msg = "恭喜您，组创建成功!";
		
		group.setInfo("");
		group.setCreateTime(StringUtil.getDateToLong(new Date()));
		if(group.getParent().getId() == null){
			group.setParent(null);
		}
		int id = groupService.save(group);
		if(id > 0){
			
		}else{
			code = -1;
			msg = "很抱歉，组创建失败!";
		}
		returnMap.put("code", code);
		returnMap.put("msg", msg);
		return returnMap;
	}
	
	@RequestMapping("/upt")
	public String upt(int id,HttpServletRequest request,Model model){
		Group group = groupService.get(id);
		List<Group> parents = groupService.getParentList();
		
		model.addAttribute("parents",parents);
		model.addAttribute("group",group);
		
		return "admin/group/update_group";
	}
	
	@RequestMapping("/update.json")
	public @ResponseBody Map<String,Object> update(Group group,HttpServletRequest request,Model model){
		Map<String,Object> returnMap = new HashMap<String, Object>();
		int code = 200;
		String msg = "恭喜您，组更新成功!";
		
		groupService.update(group,group.getId());
		
		returnMap.put("code",code);
		returnMap.put("msg",msg);
		
		return returnMap;
	}
	
	
}
