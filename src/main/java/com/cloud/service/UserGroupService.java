package com.cloud.service;

import java.util.List;

import com.cloud.entity.UserGroup;


public interface UserGroupService {
	UserGroup load(Integer id);
	UserGroup get(Integer id);
	List<UserGroup> findAll();
	void persist(UserGroup entity);  
    Integer save(UserGroup entity);  
    void saveOrUpdate(UserGroup entity);  
    void delete(Integer id);  
    void flush();
}
