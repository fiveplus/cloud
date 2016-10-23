package com.cloud.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.cloud.dao.SysLogDAO;
import com.cloud.entity.SysLog;

@Repository("sysLogDAO")
public class SysLogDAOImpl extends BaseDAOImpl<SysLog> implements SysLogDAO{

	public List<SysLog> getListToUserId(int userId) {
		String hql = "FROM SysLog l WHERE l.user.id=:userId ORDER by l.createTime DESC ";
		List list = this.getHQLList(hql, new String[]{"userId"}, new Object[]{userId});
		return list;
	}

}
