package com.cloud.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.cloud.dao.UserProjectDAO;
import com.cloud.entity.User;
import com.cloud.entity.UserProject;

@Repository("userProjectDAO")
public class UserProjectDAOImpl extends BaseDAOImpl<UserProject> implements UserProjectDAO{

	public List<User> getUserToProjectId(int projectId) {
		String sql = "select u.* from tbl_user_project up left join tbl_user u on up.user_id = u.id where up.project_id = ? ";
		List list = this.getSQLList(sql, new Object[]{projectId}, User.class);
		return list;
	}

	public UserProject getUserProject(int userId, int projectId) {
		UserProject up = null;
		String hql = "FROM UserProject up WHERE up.user.id=:userId AND up.project.id=:projectId ";
		List list = this.getHQLList(hql, new String[]{"userId","projectId"}, new Object[]{userId,projectId});
		if(list != null && list.size() > 0){
			up = (UserProject) list.get(0);
		}
		return up;
	}
	
}
