package com.cloud.controller.admin;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cloud.entity.Department;
import com.cloud.service.DepartmentService;
import com.cloud.util.PageUtil;
import com.cloud.util.StringUtil;

@Controller  
@RequestMapping("/admin/dept") 
public class DepartmentAdminController {
	private static final Logger LOGGER = Logger.getLogger(DepartmentAdminController.class);
	
	@Autowired
	private DepartmentService departmentService;
	
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
	
	@RequestMapping("/addinit")
	public String addinit(HttpServletRequest request,Model model){
		return "admin/dept/add_dept";
	}
	
	@RequestMapping("/add")
	public String add(Department dept,HttpServletRequest request,Model model){
		dept.setCreateTime(StringUtil.getDateToLong(new Date()));
		int id = departmentService.save(dept);
		if(id > 0){
			String message = "恭喜您，部门创建成功!";
			String returnURL = "dept/list?page=1";
			model.addAttribute("message",message);
			model.addAttribute("returnURL",returnURL);
			return "admin/success";
		}else{
			String message = "很抱歉，部门创建失败!";
			model.addAttribute("message",message);
			return "admin/error";
		}
	}
	
	@RequestMapping("/updateInit")
	public String updateInit(int id,HttpServletRequest request,Model model){
		Department dept = departmentService.get(id);
		model.addAttribute("dept",dept);
		return "admin/dept/update_dept";
	}
	
	@RequestMapping("/update")
	public String update(Department dept,HttpServletRequest request,Model model){
		departmentService.update(dept,dept.getId());
		String message = "恭喜您，部门修改成功!";
		String returnURL = "dept/list?page=1";
		model.addAttribute("message",message);
		model.addAttribute("returnURL",returnURL);
		return "admin/success";
	}
	
	
}
