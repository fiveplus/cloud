package com.cloud.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cloud.dao.PermissionDAO;
import com.cloud.entity.Permission;
import com.cloud.service.PermissionService;
import com.cloud.util.BeanUtil;

@Service("permissionService")  
public class PermissionServiceImpl implements PermissionService{
	@Autowired  
	private PermissionDAO permissionDAO;

	public Permission load(String id) {
		return permissionDAO.load(id);
	}

	public Permission get(String id) {
		return permissionDAO.get(id);
	}

	public List<Permission> findAll() {
		return permissionDAO.finaAll();
	}

	public void persist(Permission entity) {
		permissionDAO.persist(entity);		
	}

	public String save(Permission entity) {
		return (String) permissionDAO.save(entity);
	}

	public void saveOrUpdate(Permission entity) {
		Permission old = permissionDAO.get(entity.getId());
		try {
			BeanUtil.copyProperties(entity, old);
			permissionDAO.update(old);	
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void delete(String id) {
		permissionDAO.delete(id);		
	}

	public void flush() {
		permissionDAO.flush();		
	}

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
