package com.cloud.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cloud.dao.DepartmentDAO;
import com.cloud.entity.Department;

@Service("departmentService") 
public class DepartmentService extends BaseService<Department, Integer>{
	@Autowired  
	private DepartmentDAO departmentDAO;

	public List<Department> getList(int page, int pageSize, String[] columns,
			Object[] objs) {
		return departmentDAO.getList(page, pageSize, columns, objs);
	}

	public int getListCount(String[] columns, Object[] objs) {
		return departmentDAO.getListCount(columns, objs);
	}
	
	public void delete(Integer id){
		Department d = get(id);
		d.setStatus("N");
		update(d, id);
	}
	
	
}
