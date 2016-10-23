package com.cloud.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cloud.dao.UserGroupDAO;
import com.cloud.entity.UserGroup;

@Repository("userGroupDAO")
public class UserGroupDAOImpl extends BaseDAOImpl<UserGroup> implements UserGroupDAO{
	
}
