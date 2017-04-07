package com.cloud.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cloud.dao.UserFileDAO;
import com.cloud.entity.UserFile;

@Service("userFileService")
public class UserFileService extends BaseService<UserFile, Integer>{
	
	@Autowired
	private UserFileDAO userFileDAO;
	
	public int getListCountToDeptId(int deptId){
		return userFileDAO.getListCountToDeptId(deptId);
	}
	
	public List<UserFile> getListToDeptId(int page,int pageSize,int deptId){
		return userFileDAO.getListToDeptId(page,pageSize,deptId);
	}
	
}
