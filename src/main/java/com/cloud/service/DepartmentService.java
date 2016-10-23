package com.cloud.service;

import java.util.List;

import com.cloud.entity.Department;
import com.cloud.entity.Permission;


public interface DepartmentService {
	Department load(Integer id);
	Department get(Integer id);
	List<Department> findAll();
	void persist(Department entity);  
    Integer save(Department entity);  
    void saveOrUpdate(Department entity);  
    void delete(Integer id);  
    void flush();
    List<Department> getList(int page,int pageSize,String[] columns,Object[] objs);
    int getListCount(String[] columns,Object[] objs);
}
