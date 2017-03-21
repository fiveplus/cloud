package com.cloud.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cloud.dao.SysLogDAO;
import com.cloud.entity.SysLog;
import com.cloud.service.SysLogService;

@Service("sysLogService") 
public class SysLogService extends BaseService<SysLog, Integer>{
	@Autowired  
	private SysLogDAO sysLogDAO;

	public List<SysLog> getListToUserId(int userId) {
		return sysLogDAO.getListToUserId(userId);
	}

}
