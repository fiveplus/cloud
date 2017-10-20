package com.cloud.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cloud.dao.UserDAO;
import com.cloud.entity.User;
import com.cloud.service.UserService;
import com.cloud.util.Resource;

@Service("userService")  
public class UserService extends BaseService<User, Integer>{
	@Autowired  
    private UserDAO userDAO;

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

	public void close(int id) {
		User user = userDAO.get(id);
		if(user != null) {
			user.setStatus(Resource.N);
			userDAO.update(user);
		}
	}
	

}
