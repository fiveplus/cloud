package com.cloud.dao;

import java.io.Serializable;
import java.util.List;

import com.cloud.entity.DeptPermission;
import com.cloud.entity.Permission;


public interface DeptPermissionDAO extends BaseDAO<DeptPermission, Serializable>{
	List<Permission> getChildPermission(Integer deptId); 
	int getChildCount(String[] columns,Object[] objs);
	List<Permission> getList(int page,int pageSize,String[] columns,Object[] objs);
	DeptPermission get(String permissionId,int deptId);
}
