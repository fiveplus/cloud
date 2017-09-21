package com.cloud.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.cloud.dao.ProjectDAO;
import com.cloud.entity.Project;

@Repository("projectDAO")
public class ProjectDAOImpl extends BaseDAOImpl<Project> implements ProjectDAO{

	public List<Project> getList(int page, int pageSize, String[] columns,
			Object[] objs) {
		String hql = "FROM Project p WHERE 1 = 1 and p.status = 'Y' ";
		List list = this.getHQLList(hql, columns, objs);
		return list;
	}

	public int getListCount(String[] columns, Object[] objs) {
		String hql = "SELECT COUNT(*) FROM Project p WHERE 1 = 1 and p.status = 'Y' ";
		return this.getCount(hql, columns, objs);
	}

	public List<Project> getProjectToUserId(int userId) {
		String hql = "FROM Project p WHERE p.status = 'Y' and p.user.id=:userId ";
		List list = this.getHQLList(hql, new String[]{"userId"}, new Object[]{userId});
		return list;
	}
	
	public List<Project> findAll(){
		String hql = "FROM Project p WHERE 1 = 1 and p.status = 'Y' ";
		List list = this.getHQLList(hql, null, null);
		return list;
	}
	
	
}
