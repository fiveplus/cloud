package com.cloud.service;

import java.util.List;

import com.cloud.entity.SysLog;
import com.cloud.entity.User;


public interface SysLogService {
	SysLog load(Integer id);
	SysLog get(Integer id);
	List<SysLog> findAll();
	void persist(SysLog entity);  
    Integer save(SysLog entity);  
    void saveOrUpdate(SysLog entity);  
    void delete(Integer id);  
    void flush();
    
    List<SysLog> getListToUserId(int userId);
}
