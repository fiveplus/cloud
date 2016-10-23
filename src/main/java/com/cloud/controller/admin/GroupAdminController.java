package com.cloud.controller.admin;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

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
	
	@RequestMapping("/addinit")
	public String addinit(HttpServletRequest request,Model model){
		List<Group> parents = groupService.getParentList();
		model.addAttribute("parents",parents);
		return "admin/group/add_group";
	}
	
	@RequestMapping("/add")
	public String add(Group group,HttpServletRequest request,Model model){
		group.setInfo("");
		group.setCreateTime(StringUtil.getDateToLong(new Date()));
		if(group.getParent().getId() == null){
			group.setParent(null);
		}
		int id = groupService.save(group);
		if(id > 0){
			String message = "恭喜您，组创建成功!";
			String returnURL = "group/list?page=1";
			model.addAttribute("message",message);
			model.addAttribute("returnURL",returnURL);
			return "admin/success";
		}else{
			String message = "很抱歉，组创建失败!";
			model.addAttribute("message",message);
			return "admin/error";
		}
	}
	
	@RequestMapping("/updateInit")
	public String updateInit(int id,HttpServletRequest request,Model model){
		Group group = groupService.get(id);
		List<Group> parents = groupService.getParentList();
		
		model.addAttribute("parents",parents);
		model.addAttribute("group",group);
		
		return "admin/group/update_group";
	}
	
	@RequestMapping("/update")
	public String update(Group group,HttpServletRequest request,Model model){
		groupService.saveOrUpdate(group);
		String message = "恭喜您，组更新成功!";
		String returnURL = "group/list?page=1";
		model.addAttribute("message",message);
		model.addAttribute("returnURL",returnURL);
		return "admin/success";
	}
	
	
}
