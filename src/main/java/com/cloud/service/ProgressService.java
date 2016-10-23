package com.cloud.service;

import java.util.List;

import com.cloud.entity.Progress;


public interface ProgressService {
	Progress load(Integer id);
	Progress get(Integer id);
	List<Progress> findAll();
	void persist(Progress entity);  
    Integer save(Progress entity);  
    void saveOrUpdate(Progress entity);  
    void delete(Integer id);  
    void flush();
    public List<Progress> getProgressToProjectId(int projectId);
}
