package com.cloud.service;

import java.util.List;

import com.cloud.entity.Permission;


public interface PermissionService {
	Permission load(String id);
	Permission get(String id);
	List<Permission> findAll();
	void persist(Permission entity);  
	String save(Permission entity);  
    void saveOrUpdate(Permission entity);  
    void delete(String id);  
    void flush();
    List<Permission> getParentMenu();
    List<Permission> getParentPermission();
    List<Permission> getList(int page,int pageSize,String[] columns,Object[] objs);
    int getListCount(String[] columns,Object[] objs);
}
