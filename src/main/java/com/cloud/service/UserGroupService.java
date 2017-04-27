package com.cloud.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cloud.dao.UserGroupDAO;
import com.cloud.entity.UserGroup;
import com.cloud.service.UserGroupService;

@Service("userGroupService") 
public class UserGroupService extends BaseService<UserGroup, Integer>{
	@Autowired  
	private UserGroupDAO userGroupDAO;

}
