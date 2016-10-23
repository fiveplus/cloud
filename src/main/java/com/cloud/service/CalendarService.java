package com.cloud.service;

import java.util.List;

import com.cloud.entity.Calendar;


public interface CalendarService {
	Calendar load(Integer id);
	Calendar get(Integer id);
	List<Calendar> findAll();
	void persist(Calendar entity);  
    Integer save(Calendar entity);  
    void saveOrUpdate(Calendar entity);  
    void delete(Integer id);  
    void flush();
    public List<Calendar> getCalendarToAssignUserAndStatus(int userid,String status);
}
