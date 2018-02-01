package com.cloud.controller.admin;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.cloud.util.DateUtil;
import com.cloud.util.Resource;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cloud.entity.Permission;
import com.cloud.service.PermissionService;
import com.cloud.util.PageUtil;
import com.cloud.util.StringUtil;

@Controller  
@RequestMapping("/admin/permission") 
public class PermissionAdminController {
	private static final Logger LOGGER = Logger.getLogger(PermissionAdminController.class);
	
	@Autowired
	private PermissionService permissionService;
	
	@RequestMapping("/list")
	public String list(int page,HttpServletRequest request,Model model){
		int pageSize = 10;
		int count = permissionService.getListCount(null, null);
		PageUtil pu = new PageUtil(page,count,pageSize);
		
		List<Permission> list = permissionService.getList(page, pageSize, null, null);
		
		model.addAttribute("pu", pu);
		model.addAttribute("permissions",list);
		
		return "admin/permission/permissions";
	}
	
	@RequestMapping("/add")
	public String add(HttpServletRequest request,Model model){
		List<Permission> parents = permissionService.getParentPermission();
		
		model.addAttribute("parents",parents);
		
		return "admin/permission/add_permission";
	}
	
	@RequestMapping("/save.json")
	public @ResponseBody Map<String,Object> add(Permission permission,HttpServletRequest request,Model model){
		Map<String,Object> returnMap = new HashMap<String, Object>();
		String msg = "恭喜您，权限创建成功!";
		int code = 200;
		
		permission.setCreateTime(DateUtil.convertDate(new Date()));
		permission.setStatus(Resource.Y);
		permission.setImageURL("");
		String id = permissionService.save(permission);
		if(id != null){
			
		}else{
			msg = "很抱歉，权限创建失败!";
			code = -1;
		}
		returnMap.put("code", code);
		returnMap.put("msg", msg);
		return returnMap;
	}
	
	@RequestMapping("/upt")
	public String upt(String id,HttpServletRequest request,Model model){
		Permission permission = permissionService.get(id);
		List<Permission> parents = permissionService.getParentPermission();
		
		model.addAttribute("permission",permission);
		model.addAttribute("parents",parents);
		
		return "admin/permission/update_permission";
	}
	
	@RequestMapping("/update.json")
	public @ResponseBody Map<String,Object> update(Permission permission,HttpServletRequest request,Model model){
		Map<String,Object> returnMap = new HashMap<String, Object>();
		String msg = "恭喜您，权限修改成功!";
		int code = 200;
		
		permissionService.update(permission,permission.getId());
		
		returnMap.put("code", code);
		returnMap.put("msg", msg);
		return returnMap;
	}
	
	@RequestMapping("/delete.json")
	public @ResponseBody Map<String,Object> delete(String id,HttpServletRequest request,Model model){
		Map<String,Object> returnMap = new HashMap<String, Object>();
		int code = 200;
		String msg = "恭喜您，权限删除成功!";
		
		permissionService.delete(id);
		returnMap.put("code", code);
		returnMap.put("msg", msg);
		
		return returnMap;
	}
	
	
}
