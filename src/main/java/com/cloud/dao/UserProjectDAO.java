package com.cloud.dao;

import java.io.Serializable;
import java.util.List;

import com.cloud.entity.User;
import com.cloud.entity.UserProject;

public interface UserProjectDAO extends BaseDAO<UserProject, Serializable>{
	public List<User> getUserToProjectId(int projectId);
	public UserProject getUserProject(int userId,int projectId);
}
