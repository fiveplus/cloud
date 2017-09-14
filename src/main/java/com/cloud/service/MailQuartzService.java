package com.cloud.service;

import java.io.Serializable;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cloud.dao.MailQuartzDAO;
import com.cloud.entity.MailQuartz;

@Service("mailQuartzService")
public class MailQuartzService extends BaseService<MailQuartz, Serializable>{
	@Autowired
	private MailQuartzDAO mailQuartzDAO;
	
	
	
}
