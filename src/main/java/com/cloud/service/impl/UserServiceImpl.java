package com.cloud.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cloud.dao.UserDAO;
import com.cloud.entity.Project;
import com.cloud.entity.User;
import com.cloud.entity.UserProject;
import com.cloud.service.UserService;
import com.cloud.util.BeanUtil;

@Service("userService")  
public class UserServiceImpl implements UserService{

	@Autowired  
    private UserDAO userDAO;
	
	public User load(Integer id) {
		return userDAO.load(id);
	}

	public User get(Integer id) {
		return userDAO.get(id);
	}

	public List<User> findAll() {
		return userDAO.finaAll();
	}

	public void persist(User entity) {
		userDAO.persist(entity);  
	}

	public Integer save(User entity) {
		return (Integer) userDAO.save(entity);  
	}

	public void update(User entity) {
		User old = userDAO.get(entity.getId());
		try {
			BeanUtil.copyProperties(entity, old);
			userDAO.update(old);	
		} catch (Exception e) {
			e.printStackTrace();
		}	
	}

	public void delete(Integer id) {
		userDAO.delete(id);  
	}

	public void flush() {
		userDAO.flush();  
	}

	public User getUserByLoginNameAndPassword(String loginName, String password) {
		return userDAO.getUserByLoginNameAndPassword(loginName, password);
	}

	public List<User> getList(int page, int pageSize, String[] columns,
			Object[] objs) {
		return userDAO.getList(page, pageSize, columns, objs);
	}

	public int getListCount(String[] columns, Object[] objs) {
		return userDAO.getListCount(columns, objs);
	}

	public List<User> getUserToGroupId(int groupId) {
		return userDAO.getUserToGroupId(groupId);
	}

	

}
