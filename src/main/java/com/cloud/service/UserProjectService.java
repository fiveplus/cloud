package com.cloud.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cloud.dao.UserProjectDAO;
import com.cloud.entity.User;
import com.cloud.entity.UserProject;
import com.cloud.service.UserProjectService;

@Service("userProjectService") 
public class UserProjectService extends BaseService<UserProject, Integer>{
	@Autowired  
	private UserProjectDAO userProjectDAO;

	public List<User> getUserToProjectId(int projectId) {
		return userProjectDAO.getUserToProjectId(projectId);
	}

	public UserProject getUserProject(int userId, int projectId) {
		return userProjectDAO.getUserProject(userId, projectId);
	}
}
