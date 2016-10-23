package com.cloud.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cloud.dao.ProjectDAO;
import com.cloud.entity.Progress;
import com.cloud.entity.Project;

@Repository("projectDAO")
public class ProjectDAOImpl extends BaseDAOImpl<Project> implements ProjectDAO{

	public List<Project> getList(int page, int pageSize, String[] columns,
			Object[] objs) {
		String hql = "FROM Project p WHERE 1 = 1 ";
		List list = this.getHQLList(hql, columns, objs);
		return list;
	}

	public int getListCount(String[] columns, Object[] objs) {
		String hql = "SELECT COUNT(*) FROM Project p WHERE 1 = 1 ";
		return this.getCount(hql, columns, objs);
	}

	public List<Project> getProjectToUserId(int userId) {
		String hql = "FROM Project p WHERE p.user.id=:userId ";
		List list = this.getHQLList(hql, new String[]{"userId"}, new Object[]{userId});
		return list;
	}
	
	
}
