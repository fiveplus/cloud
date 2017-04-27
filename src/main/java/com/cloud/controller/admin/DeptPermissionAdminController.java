package com.cloud.controller.admin;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cloud.entity.Department;
import com.cloud.entity.DeptPermission;
import com.cloud.entity.Permission;
import com.cloud.service.DepartmentService;
import com.cloud.service.DeptPermissionService;
import com.cloud.service.PermissionService;
import com.cloud.util.PageUtil;

@Controller  
@RequestMapping("/admin/deptPermission") 
public class DeptPermissionAdminController {
	private static final Logger LOGGER = Logger.getLogger(DeptPermissionAdminController.class);
	
	@Autowired
	private DeptPermissionService deptPermissionService;
	@Autowired
	private PermissionService permissionService;
	
	@Autowired
	private DepartmentService departmentService;
	
	@RequestMapping("/list")
	public String list(int page,int id,HttpServletRequest request,Model model){
		//TODO id为部门ID
		
		Department dept = departmentService.get(id);
		
		int pageSize = 10;
		int count = deptPermissionService.getChildCount(null,null);
		List<Permission> permissions = deptPermissionService.getList(page, pageSize, null, null);
		
		List<Permission> pers = deptPermissionService.getChildPermission(id);
		//权限组装
		for(int i = 0;i< permissions.size();i++){
			for(Permission per:pers){
				if(per.getId().equals(permissions.get(i).getId())){
					per.setFlag(0);
					permissions.set(i, per);
					break;
				}
			}
		}
		
		PageUtil pu = new PageUtil(page, count, pageSize);
		
		model.addAttribute("permissions",permissions);
		model.addAttribute("pu",pu);
		model.addAttribute("department",dept);
		
		return "admin/dept/dept_permissions";
	}
	
	@RequestMapping("/add")
	public  @ResponseBody String add(DeptPermission dp,HttpServletRequest request,Model model){
		DeptPermission temp = deptPermissionService.get(dp.getPermissionId(), dp.getDeptId());
		if(temp == null){
			deptPermissionService.save(dp);
		}
		return "";
	}
	
	@RequestMapping("/delete")
	public @ResponseBody String delete(DeptPermission dp,HttpServletRequest request,Model model){
		DeptPermission temp = deptPermissionService.get(dp.getPermissionId(), dp.getDeptId());
		if(temp != null){
			deptPermissionService.delete(temp.getId());
		}
		return "";
	}
	
	
}
