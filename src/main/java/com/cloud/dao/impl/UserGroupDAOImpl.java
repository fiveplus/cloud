package com.cloud.dao.impl;


import org.springframework.stereotype.Repository;

import com.cloud.dao.UserGroupDAO;
import com.cloud.entity.UserGroup;

@Repository("userGroupDAO")
public class UserGroupDAOImpl extends BaseDAOImpl<UserGroup> implements UserGroupDAO{
	
}
