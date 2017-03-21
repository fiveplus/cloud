package com.cloud.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cloud.dao.PermissionDAO;
import com.cloud.entity.Permission;

@Service("permissionService")  
public class PermissionService extends BaseService<Permission, String>{
	@Autowired  
	private PermissionDAO permissionDAO;

	public List<Permission> getParentMenu() {
		return permissionDAO.getParentMenu();
	}

	public List<Permission> getList(int page, int pageSize, String[] columns,
			Object[] objs) {
		return permissionDAO.getList(page, pageSize, columns, objs);
	}

	public int getListCount(String[] columns, Object[] objs) {
		return permissionDAO.getListCount(columns, objs);
	}

	public List<Permission> getParentPermission() {
		return permissionDAO.getParentPermission();
	}
	
	
	
}
