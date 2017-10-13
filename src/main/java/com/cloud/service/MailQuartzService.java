package com.cloud.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cloud.dao.MailQuartzDAO;
import com.cloud.entity.MailQuartz;

@Service("mailQuartzService")
public class MailQuartzService extends BaseService<MailQuartz, Integer>{
	@Autowired
	private MailQuartzDAO mailQuartzDAO;
	
	public List<MailQuartz> getList(int page,int pageSize,String[] columns,String[] objs){
		return mailQuartzDAO.getList(page, pageSize,columns, objs);
	}

	public int getListCount(String[] columns, Object[] objs) {
		return mailQuartzDAO.getListCount(columns, objs);
	}
	
	public MailQuartz getMailQuartzToJobName(String jobName){
		return mailQuartzDAO.getMailQuartzToJobName(jobName);
	}
}
