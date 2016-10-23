package com.cloud.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cloud.dao.UserGroupDAO;
import com.cloud.entity.Theme;
import com.cloud.entity.UserGroup;
import com.cloud.service.UserGroupService;
import com.cloud.util.BeanUtil;

@Service("userGroupService") 
public class UserGroupServiceImpl implements UserGroupService{
	@Autowired  
	private UserGroupDAO userGroupDAO;

	public UserGroup load(Integer id) {
		return userGroupDAO.load(id);
	}

	public UserGroup get(Integer id) {
		return userGroupDAO.get(id);
	}

	public List<UserGroup> findAll() {
		return userGroupDAO.finaAll();
	}

	public void persist(UserGroup entity) {
		userGroupDAO.persist(entity);		
	}

	public Integer save(UserGroup entity) {
		return (Integer) userGroupDAO.save(entity);
	}

	public void saveOrUpdate(UserGroup entity) {
		UserGroup old = userGroupDAO.get(entity.getId());
		try {
			BeanUtil.copyProperties(entity, old);
			userGroupDAO.update(old);	
		} catch (Exception e) {
			e.printStackTrace();
		}	
	}

	public void delete(Integer id) {
		userGroupDAO.delete(id);
	}

	public void flush() {
		userGroupDAO.flush();
	}
}
