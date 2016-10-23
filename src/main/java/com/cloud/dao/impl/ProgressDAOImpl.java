package com.cloud.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cloud.dao.ProgressDAO;
import com.cloud.entity.Progress;

@Repository("progressDAO")
public class ProgressDAOImpl extends BaseDAOImpl<Progress> implements ProgressDAO{

	public List<Progress> getProgressToProjectId(int projectId) {
		String hql = "FROM Progress p where p.project.id=:projectId ";
		List list = this.getHQLList(hql, new String[]{"projectId"}, new Object[]{projectId});
		return list;
	}
	
	
}
