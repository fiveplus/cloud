package com.cloud.service;

import java.util.List;

import com.cloud.entity.DeptPermission;
import com.cloud.entity.Permission;


public interface DeptPermissionService {
	DeptPermission load(Integer id);
	DeptPermission get(Integer id);
	List<DeptPermission> findAll();
	void persist(DeptPermission entity);  
    Integer save(DeptPermission entity);  
    void update(DeptPermission entity);  
    void delete(Integer id);
    void flush();
    List<Permission> getChildPermission(Integer deptId); 
    int getChildCount(String[] columns,Object[] objs);
    public List<Permission> getList(int page, int pageSize, String[] columns,Object[] objs); 
    DeptPermission get(String permissionId,int deptId);
}
