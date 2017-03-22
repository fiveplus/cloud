package com.cloud.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cloud.dao.CalendarDAO;
import com.cloud.entity.Calendar;
import com.cloud.service.CalendarService;

@Service("calendarService")  
public class CalendarService extends BaseService<Calendar, Integer>{
	
	@Autowired  
	private CalendarDAO calendarDAO;

	public List<Calendar> getCalendarToAssignUserAndStatus(int userid,String status) {
		return calendarDAO.getCalendarToAssignUserAndStatus(userid,status);
	}
	
	public List<Calendar> getCalendarToAssignUserAndStatusAndStartTime(int userid,String status){
		return calendarDAO.getCalendarToAssignUserAndStatusAndStartTime(userid, status);
	}
	
}
