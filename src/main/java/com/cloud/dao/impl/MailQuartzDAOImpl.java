package com.cloud.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.cloud.dao.MailQuartzDAO;
import com.cloud.entity.MailQuartz;

@Repository("mailQuartzDAO")
public class MailQuartzDAOImpl extends BaseDAOImpl<MailQuartz> implements MailQuartzDAO{

	public List<MailQuartz> getList(int page, int pageSize, String[] columns, String[] objs) {
		String hql = "FROM MailQuartz m WHERE 1 = 1 ";
		List list = this.getList(page, pageSize, hql, columns, objs);
		return list;
	}

	public int getListCount(String[] columns, Object[] objs) {
		String hql = "SELECT COUNT(*) FROM MailQuartz m WHERE 1 = 1 ";
		return this.getCount(hql, columns, objs);
	}

	@Override
	public MailQuartz getMailQuartzToJobName(String jobName) {
		String hql = "FROM MailQuartz m where m.jobName=:jobName ";
		List list = this.getHQLList(hql, new String[]{"jobName"}, new Object[]{jobName});
		MailQuartz mail = null;
		if(list != null && list.size() > 0){
			mail = (MailQuartz) list.get(0);
		}
		return mail;
	}

}
