package com.cloud.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cloud.dao.DeptPermissionDAO;
import com.cloud.entity.DeptPermission;
import com.cloud.entity.Permission;

@Service("deptPermissionService") 
public class DeptPermissionService extends BaseService<DeptPermission, Integer>{
	@Autowired  
	private DeptPermissionDAO deptPermissionDAO;

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
	
	public int deletePermissionByDeptId(int deptId){
		return deptPermissionDAO.deletePermissionByDeptId(deptId);
	}
	
}
