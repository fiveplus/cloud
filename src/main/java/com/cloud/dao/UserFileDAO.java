package com.cloud.dao;

import java.io.Serializable;
import java.util.List;

import com.cloud.entity.UserFile;

public interface UserFileDAO extends BaseDAO<UserFile, Serializable>{
	public int getListCountToDeptId(int deptId);
	public List<UserFile> getListToDeptId(int page, int pageSize, int deptId);
	public UserFile getUserFileToUrl(String url);
}
