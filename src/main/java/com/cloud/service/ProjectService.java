package com.cloud.service;

import java.util.List;

import com.cloud.entity.Project;


public interface ProjectService {
	Project load(Integer id);
	Project get(Integer id);
	List<Project> findAll();
	void persist(Project entity);  
    Integer save(Project entity);  
    void update(Project entity);  
    void delete(Integer id);  
    void flush();
    public List<Project> getList(int page, int pageSize, String[] columns,Object[] objs);
    public int getListCount(String[] columns, Object[] objs);
    public List<Project> getProjectToUserId(int userId);
}
