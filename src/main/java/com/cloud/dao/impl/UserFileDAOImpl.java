package com.cloud.dao.impl;

import org.springframework.stereotype.Repository;

import com.cloud.dao.UserFileDAO;
import com.cloud.entity.UserFile;

@Repository("userFileDAO")
public class UserFileDAOImpl extends BaseDAOImpl<UserFile> implements UserFileDAO{

}
