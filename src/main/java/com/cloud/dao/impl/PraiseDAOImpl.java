package com.cloud.dao.impl;

import org.springframework.stereotype.Repository;

import com.cloud.dao.PraiseDAO;
import com.cloud.entity.Praise;

@Repository("praiseDAO")
public class PraiseDAOImpl extends BaseDAOImpl<Praise> implements PraiseDAO{

}
