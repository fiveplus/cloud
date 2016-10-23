package com.cloud.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cloud.dao.UserProjectDAO;
import com.cloud.entity.User;
import com.cloud.entity.UserGroup;
import com.cloud.entity.UserProject;
import com.cloud.service.UserProjectService;
import com.cloud.util.BeanUtil;

@Service("userProjectService") 
public class UserProjectServiceImpl implements UserProjectService{
	@Autowired  
	private UserProjectDAO userProjectDAO;

	public UserProject load(Integer id) {
		return userProjectDAO.load(id);
	}

	public UserProject get(Integer id) {
		return userProjectDAO.get(id);
	}

	public List<UserProject> findAll() {
		return userProjectDAO.finaAll();
	}

	public void persist(UserProject entity) {
		userProjectDAO.persist(entity);
	}

	public Integer save(UserProject entity) {
		return (Integer) userProjectDAO.save(entity);
	}

	public void saveOrUpdate(UserProject entity) {
		UserProject old = userProjectDAO.get(entity.getId());
		try {
			BeanUtil.copyProperties(entity, old);
			userProjectDAO.update(old);	
		} catch (Exception e) {
			e.printStackTrace();
		}	
	}

	public void delete(Integer id) {
		userProjectDAO.delete(id);
	}

	public void flush() {
		userProjectDAO.flush();
	}

	public List<User> getUserToProjectId(int projectId) {
		return userProjectDAO.getUserToProjectId(projectId);
	}

	public UserProject getUserProject(int userId, int projectId) {
		return userProjectDAO.getUserProject(userId, projectId);
	}
}
