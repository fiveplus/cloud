package com.cloud.dao;

import java.io.Serializable;
import java.util.List;

import com.cloud.entity.Content;

public interface ContentDAO extends BaseDAO<Content, Serializable>{
	List<Content> getList(int page, int pageSize, String[] columns,Object[] objs);
	int getListCount(String[] columns, Object[] objs);
	
	List<Content> getListToDeptIdAndThemeId(int page, int pageSize,int deptId,int themeId);
	int getListCountToDeptIdAndThemeId(int deptId,int themeId);
	
	int getListCountToUserId(int userId);
	List<Content> getListToUserId(int page,int pageSize,int userId);
	
	List<Content> getListToProjectId(int page,int pageSize,int projectId);
	public int getListCountToProjectId(int projectId);
	
	public int getReadCountSumToUserId(int userId);
	
	
}
