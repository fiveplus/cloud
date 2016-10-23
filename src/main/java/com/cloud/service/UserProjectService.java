package com.cloud.service;

import java.util.List;

import com.cloud.entity.User;
import com.cloud.entity.UserProject;


public interface UserProjectService {
	UserProject load(Integer id);
	UserProject get(Integer id);
	List<UserProject> findAll();
	void persist(UserProject entity);  
    Integer save(UserProject entity);  
    void saveOrUpdate(UserProject entity);  
    void delete(Integer id);  
    void flush();
	public List<User> getUserToProjectId(int projectId);
	public UserProject getUserProject(int userId, int projectId);
}
