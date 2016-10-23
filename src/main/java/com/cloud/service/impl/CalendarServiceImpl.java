package com.cloud.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cloud.dao.CalendarDAO;
import com.cloud.entity.Calendar;
import com.cloud.service.CalendarService;
import com.cloud.util.BeanUtil;

@Service("calendarService")  
public class CalendarServiceImpl implements CalendarService{
	@Autowired  
	private CalendarDAO calendarDAO;

	public Calendar load(Integer id) {
		return calendarDAO.load(id);
	}

	public Calendar get(Integer id) {
		return calendarDAO.get(id);
	}

	public List<Calendar> findAll() {
		return calendarDAO.finaAll();
	}

	public void persist(Calendar entity) {
		calendarDAO.persist(entity);		
	}

	public Integer save(Calendar entity) {
		return (Integer) calendarDAO.save(entity);
	}

	public void saveOrUpdate(Calendar entity) {
		Calendar old = calendarDAO.get(entity.getId());
		try {
			BeanUtil.copyProperties(entity, old);
			calendarDAO.update(old);	
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void delete(Integer id) {
		calendarDAO.delete(id);		
	}

	public void flush() {
		calendarDAO.flush();		
	}

	public List<Calendar> getCalendarToAssignUserAndStatus(int userid,String status) {
		return calendarDAO.getCalendarToAssignUserAndStatus(userid,status);
	}
	
}
