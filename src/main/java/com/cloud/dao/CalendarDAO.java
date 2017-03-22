package com.cloud.dao;

import java.io.Serializable;
import java.util.List;

import com.cloud.entity.Calendar;

public interface CalendarDAO extends BaseDAO<Calendar, Serializable>{
	public List<Calendar> getCalendarToAssignUserAndStatus(int userid,String status);
	public List<Calendar> getCalendarToAssignUserAndStatusAndStartTime(int userid,String status);
}
