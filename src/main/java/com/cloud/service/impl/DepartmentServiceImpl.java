package com.cloud.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cloud.dao.DepartmentDAO;
import com.cloud.entity.Content;
import com.cloud.entity.Department;
import com.cloud.service.DepartmentService;
import com.cloud.util.BeanUtil;

@Service("departmentService") 
public class DepartmentServiceImpl implements DepartmentService{
	@Autowired  
	private DepartmentDAO departmentDAO;

	public Department load(Integer id) {
		return departmentDAO.load(id);
	}

	public Department get(Integer id) {
		return departmentDAO.get(id);
	}

	public List<Department> findAll() {
		return departmentDAO.finaAll();
	}

	public void persist(Department entity) {
		departmentDAO.persist(entity);		
	}

	public Integer save(Department entity) {
		return (Integer) departmentDAO.save(entity);
	}

	public void saveOrUpdate(Department entity) {
		Department old = departmentDAO.get(entity.getId());
		try {
			BeanUtil.copyProperties(entity, old);
			departmentDAO.update(old);	
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void delete(Integer id) {
		departmentDAO.delete(id);		
	}

	public void flush() {
		departmentDAO.flush();		
	}

	public List<Department> getList(int page, int pageSize, String[] columns,
			Object[] objs) {
		return departmentDAO.getList(page, pageSize, columns, objs);
	}

	public int getListCount(String[] columns, Object[] objs) {
		return departmentDAO.getListCount(columns, objs);
	}
	
	
}
