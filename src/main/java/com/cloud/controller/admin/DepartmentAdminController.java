package com.cloud.controller.admin;

import java.util.ArrayList;
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

import com.cloud.controller.admin.bo.AdditionalParameters;
import com.cloud.controller.admin.bo.Item;
import com.cloud.controller.admin.bo.TreeRespBO;
import com.cloud.entity.Department;
import com.cloud.entity.DeptPermission;
import com.cloud.entity.Permission;
import com.cloud.service.DepartmentService;
import com.cloud.service.DeptPermissionService;
import com.cloud.service.PermissionService;
import com.cloud.util.PageUtil;
import com.cloud.util.StringUtil;

@Controller  
@RequestMapping("/admin/dept") 
public class DepartmentAdminController {
	private static final Logger LOGGER = Logger.getLogger(DepartmentAdminController.class);
	
	@Autowired
	private DepartmentService departmentService;
	
	@Autowired
	private PermissionService permissionService;
	
	@Autowired
	private DeptPermissionService deptPermissionService;
	
	@RequestMapping("/list")
	public String list(int page,HttpServletRequest request,Model model){
		int pageSize = 10;
		int count = departmentService.getListCount(null, null);
		PageUtil pu = new PageUtil(page, count, pageSize);
		
		List<Department> list = departmentService.getList(page, pageSize, null, null);
		
		model.addAttribute("pu",pu);
		model.addAttribute("depts",list);
		
		return "admin/dept/depts";
	}
	
	@RequestMapping("/add")
	public String add(HttpServletRequest request,Model model){
		return "admin/dept/add_dept";
	}
	
	@RequestMapping("/select")
	public String select(int id,HttpServletRequest requst,Model model){
		Department department = departmentService.get(id);
		model.addAttribute("department",department);
		return "admin/dept/dept";
	}
	
	
	@RequestMapping("/save.json")
	public @ResponseBody Map<String,Object> save(Department dept,HttpServletRequest request,Model model){
		Map<String,Object> returnMap = new HashMap<String, Object>();
		String message = "恭喜您，部门创建成功!";
		int code = 200;
		
		dept.setCreateTime(StringUtil.getDateToLong(new Date()));
		int id = departmentService.save(dept);
		if(id > 0){
			
		}else{
			code = -1;
			message = "很抱歉，部门创建失败!";
		}
		
		returnMap.put("code", code);
		returnMap.put("message", message);
		
		return returnMap;
	}
	
	@RequestMapping("/upt")
	public String updateInit(int id,HttpServletRequest request,Model model){
		Department dept = departmentService.get(id);
		model.addAttribute("dept",dept);
		return "admin/dept/update_dept";
	}
	
	@RequestMapping("/update")
	public @ResponseBody Map<String,Object> update(Department dept,HttpServletRequest request,Model model){
		Map<String,Object> returnMap = new HashMap<String, Object>();
		String message = "恭喜您，部门修改成功!";
		int code = 200;
		
		departmentService.update(dept,dept.getId());
		
		returnMap.put("code", code);
		returnMap.put("message", message);
		
		return returnMap;
	}
	
	@RequestMapping("/delete.json")
	public @ResponseBody Map<String,Object> delete(int id,HttpServletRequest request,Model model){
		Map<String,Object> returnMap = new HashMap<String, Object>();
		int code = 200;
		String message = "恭喜您，部门删除成功！";
		
		departmentService.delete(id);
		model.addAttribute("code",code);
		model.addAttribute("message",message);
		
		return returnMap;
	}
	
	@RequestMapping("/perlist")
	public String perlist(int id,HttpServletRequest request,Model model){
		Department department = departmentService.get(id);
		model.addAttribute("department",department);
		return "admin/dept/dept_permissions";
	}
	
	@RequestMapping("/perlist.json")
	public @ResponseBody TreeRespBO perlist_json(String pid,int did,HttpServletRequest request,Model model){
		List<Permission> perlist = deptPermissionService.getChildPermission(did);
		List<Permission> list = permissionService.getPermissionByParentId(pid);
		TreeRespBO tree = new TreeRespBO();
		List<Item> boItemList = new ArrayList<Item>();
		if(null != list && list.size() > 0){
			for(Permission p:list){
				Item item = new Item();
				//查询子节点数量
				int child_count = permissionService.getCountByParentId(p.getId());
				item.setName(p.getName());
				if(child_count > 0){
					item.setType("folder");
					AdditionalParameters adp = new AdditionalParameters();
					adp.setId(p.getId());
					item.setAdditionalParameters(adp);
				}else{
					AdditionalParameters adp = new AdditionalParameters();
					adp.setId(p.getId());
					item.setAdditionalParameters(adp);
					for(Permission per:perlist){
						if(per.getId().equals(p.getId())){
							adp.setItemSeleted(true);
							break;
						}
					}
					
					item.setType("item");
				}
				boItemList.add(item);
			}
		}
		tree.setData(boItemList);
		tree.setStatus("OK");
		return tree;
	}
	
	@RequestMapping("/savepers.json")
	public @ResponseBody Map<String,Object> savepers(int did,String pids,HttpServletRequest request,Model model){
		Map<String,Object> returnMap = new HashMap<String,Object>();
		//权限清除
		deptPermissionService.deletePermissionByDeptId(did);
		if(pids != null && !pids.equals("")){
			//权限保存
			String[] ids = pids.split(",");
			for(String id:ids){
				DeptPermission dp = new DeptPermission();
				dp.setDeptId(did);
				dp.setPermissionId(id);
				int count = deptPermissionService.save(dp);
				System.out.println("dp:"+count);
			}
		}
		returnMap.put("code", 0);
		returnMap.put("msg", "成功！很好地完成了提交。");
		
		return returnMap;
	}
	
	
	
}
