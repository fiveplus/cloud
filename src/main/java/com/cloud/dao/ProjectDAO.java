package com.cloud.dao;

import java.io.Serializable;
import java.util.List;

import com.cloud.entity.Permission;
import com.cloud.entity.Project;

public interface ProjectDAO extends BaseDAO<Project, Serializable>{
	public List<Project> getList(int page, int pageSize, String[] columns,Object[] objs);
	public int getListCount(String[] columns, Object[] objs);
	public List<Project> getProjectToUserId(int userId);
}
