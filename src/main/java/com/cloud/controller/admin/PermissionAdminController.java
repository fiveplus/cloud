package com.cloud.controller.admin;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

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
	
	@RequestMapping("/addinit")
	public String addinit(HttpServletRequest request,Model model){
		List<Permission> parents = permissionService.getParentPermission();
		
		model.addAttribute("parents",parents);
		
		return "admin/permission/add_permission";
	}
	
	@RequestMapping("/add")
	public String add(Permission permission,HttpServletRequest request,Model model){
		permission.setCreateTime(StringUtil.getDateToLong(new Date()));
		permission.setStatus("Y");
		permission.setImageURL("");
		String id = permissionService.save(permission);
		if(id != null){
			String message = "恭喜您，权限创建成功!";
			String returnURL = "permission/list?page=1";
			model.addAttribute("message",message);
			model.addAttribute("returnURL",returnURL);
			return "admin/success";
		}else{
			String message = "很抱歉，权限创建失败!";
			model.addAttribute("message",message);
			return "admin/error";
		}
	}
	
	@RequestMapping("/updateInit")
	public String updateInit(String id,HttpServletRequest request,Model model){
		Permission permission = permissionService.get(id);
		List<Permission> parents = permissionService.getParentPermission();
		
		model.addAttribute("permission",permission);
		model.addAttribute("parents",parents);
		
		return "admin/permission/update_permission";
	}
	
	@RequestMapping("/update")
	public String update(Permission permission,HttpServletRequest request,Model model){
		
		permissionService.update(permission,permission.getId());
		String message = "恭喜您，权限修改成功!";
		String returnURL = "permission/list?page=1";
		model.addAttribute("message",message);
		model.addAttribute("returnURL",returnURL);
		return "admin/success";
	}
	
	
}
