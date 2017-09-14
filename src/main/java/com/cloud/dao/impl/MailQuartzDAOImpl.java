package com.cloud.dao.impl;

import org.springframework.stereotype.Repository;

import com.cloud.dao.MailQuartzDAO;
import com.cloud.entity.MailQuartz;

@Repository("mailQuartzDAO")
public class MailQuartzDAOImpl extends BaseDAOImpl<MailQuartz> implements MailQuartzDAO{

}
