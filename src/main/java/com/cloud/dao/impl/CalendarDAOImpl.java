package com.cloud.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cloud.dao.CalendarDAO;
import com.cloud.entity.Calendar;

@Repository("calendarDAO")
public class CalendarDAOImpl extends BaseDAOImpl<Calendar> implements CalendarDAO{

	public List<Calendar> getCalendarToAssignUserAndStatus(int userid,String status) {
		String hql = "FROM Calendar c WHERE c.assignUser.id=:userId AND c.status=:status ";
		List list = this.getHQLList(hql, new String[]{"userId","status"}, new Object[]{userid,status});
		return list;
	}
	
	
	

}
