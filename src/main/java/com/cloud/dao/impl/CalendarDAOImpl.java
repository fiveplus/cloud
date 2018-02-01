package com.cloud.dao.impl;

import java.util.Date;
import java.util.List;

import com.cloud.util.DateUtil;
import org.springframework.stereotype.Repository;

import com.cloud.dao.CalendarDAO;
import com.cloud.entity.Calendar;
import com.cloud.util.StringUtil;

@Repository("calendarDAO")
public class CalendarDAOImpl extends BaseDAOImpl<Calendar> implements CalendarDAO{

	public List<Calendar> getCalendarToAssignUserAndStatus(int userid,String status) {
		String hql = "FROM Calendar c WHERE c.assignUser.id=:userId AND c.status=:status ";
		List list = this.getHQLList(hql, new String[]{"userId","status"}, new Object[]{userid,status});
		return list;
	}

	@Override
	public List<Calendar> getCalendarToAssignUserAndStatusAndStartTime(
			int userid, String status) {
		Date now = new Date();
		long start = DateUtil.convertDate(now);
		String hql = "FROM Calendar c WHERE c.assignUser.id=:userId AND c.status=:status and c.startTime >= "+start+" ORDER BY c.startTime ASC ";
		List list = this.getHQLList(hql, new String[]{"userId","status"}, new Object[]{userid,status});
		return list;
	}
	
	
	

}
