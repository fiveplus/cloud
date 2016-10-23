package com.cloud.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cloud.dao.DepartmentDAO;
import com.cloud.dao.DeptPermissionDAO;
import com.cloud.entity.Department;
import com.cloud.entity.DeptPermission;
import com.cloud.entity.Permission;
import com.cloud.service.DeptPermissionService;
import com.cloud.util.BeanUtil;

@Service("deptPermissionService") 
public class DeptPermissionServiceImpl implements DeptPermissionService{
	@Autowired  
	private DeptPermissionDAO deptPermissionDAO;

	public DeptPermission load(Integer id) {
		return deptPermissionDAO.load(id);
	}

	public DeptPermission get(Integer id) {
		return deptPermissionDAO.get(id);
	}

	public List<DeptPermission> findAll() {
		return deptPermissionDAO.finaAll();
	}

	public void persist(DeptPermission entity) {
		deptPermissionDAO.persist(entity);		
	}

	public Integer save(DeptPermission entity) {
		return (Integer) deptPermissionDAO.save(entity);
	}

	public void update(DeptPermission entity) {
		DeptPermission old = deptPermissionDAO.get(entity.getId());
		try {
			BeanUtil.copyProperties(entity, old);
			deptPermissionDAO.update(old);	
		} catch (Exception e) {
			e.printStackTrace();
		}	
	}

	public void delete(Integer id) {
		deptPermissionDAO.delete(id);		
	}

	public void flush() {
		deptPermissionDAO.flush();
	}

	public List<Permission> getChildPermission(Integer deptId) {
		return deptPermissionDAO.getChildPermission(deptId);
	}

	public int getChildCount(String[] columns,Object[] objs) {
		return deptPermissionDAO.getChildCount(columns,objs);
	}

	public List<Permission> getList(int page, int pageSize, String[] columns,
			Object[] objs) {
		return deptPermissionDAO.getList(page, pageSize, columns, objs);
	}

	public DeptPermission get(String permissionId, int deptId) {
		return deptPermissionDAO.get(permissionId, deptId);
	}


	
}
