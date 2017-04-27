package com.cloud.dao;

import java.io.Serializable;
import java.util.List;

import com.cloud.entity.Permission;

public interface PermissionDAO extends BaseDAO<Permission, Serializable>{
	public List<Permission> getParentMenu();
	public List<Permission> getList(int page, int pageSize, String[] columns,Object[] objs);
	public int getListCount(String[] columns, Object[] objs);
	public List<Permission> getParentPermission();
	public List<Permission> getPermissionByParentId(String parentId);
	public int getCountByParentId(String parentId);
}
