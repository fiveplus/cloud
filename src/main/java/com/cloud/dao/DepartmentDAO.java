package com.cloud.dao;

import java.io.Serializable;
import java.util.List;

import com.cloud.entity.Department;


public interface DepartmentDAO extends BaseDAO<Department, Serializable>{
	public List<Department> getList(int page, int pageSize, String[] columns,Object[] objs);
	public int getListCount(String[] columns, Object[] objs);
}
