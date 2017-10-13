package com.cloud.dao;

import java.io.Serializable;
import java.util.List;

import com.cloud.entity.MailQuartz;

public interface MailQuartzDAO extends BaseDAO<MailQuartz, Serializable>{
	public List<MailQuartz> getList(int page,int pageSize,String[] columns,String[] objs);
	public int getListCount(String[] columns, Object[] objs);
	public MailQuartz getMailQuartzToJobName(String jobName);
}
