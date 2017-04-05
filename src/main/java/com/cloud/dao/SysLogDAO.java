package com.cloud.dao;

import java.io.Serializable;
import java.util.List;

import com.cloud.entity.SysLog;


public interface SysLogDAO extends BaseDAO<SysLog, Serializable>{
	public List<SysLog> getListToUserId(int userId);
	public int getCountToUserIdAndIsRead(int userId);
}
