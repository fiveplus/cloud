package com.cloud.service;

import java.util.List;

import com.cloud.entity.Content;
import com.cloud.entity.Theme;


public interface ContentService {
	Content load(Integer id);
	Content get(Integer id);
	List<Content> findAll();
	void persist(Content entity);  
    Integer save(Content entity);  
    void update(Content entity);  
    void delete(Integer id);  
    void flush();
    List<Content> getList(int page,int pageSize,String[] columns,Object[] objs);
    int getListCount(String[] columns,Object[] objs);
    
	List<Content> getListToDeptIdAndThemeId(int page, int pageSize,int deptId,int themeId);
	int getListCountToDeptIdAndThemeId(int deptId,int themeId);
	
	int getListCountToUserId(int userId);
	List<Content> getListToUserId(int page,int pageSize,int userId);
	
	List<Content> getListToProjectId(int page,int pageSize,int projectId);
	int getListCountToProjectId(int projectId);
	int getReadCountSumToUserId(int userId);
	
}
