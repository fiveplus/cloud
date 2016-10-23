package com.cloud.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cloud.dao.UserDAO;
import com.cloud.entity.Theme;
import com.cloud.entity.User;
import com.cloud.service.UserService;

@Repository("userDAO")
public class UserDAOImpl extends BaseDAOImpl<User> implements UserDAO{
	

	public User getUserByLoginNameAndPassword(String loginName, String password) {
		String hql = "from User u where u.loginName=:loginName and u.password=:password";
		User user = null;
		List list = this.getHQLList(hql, new String[]{"loginName","password"}, new Object[]{loginName,password});
		if(list != null && list.size() > 0){
			user = (User) list.get(0);
		}
		return user;
	}

	public List<User> getList(int page, int pageSize, String[] columns,
			Object[] objs) {
		String hql = "FROM User WHERE 1 = 1 ";
		List list = this.getHQLList(hql, columns, objs);
		return list;
	}

	public int getListCount(String[] columns, Object[] objs) {
		String hql = "SELECT COUNT(*) FROM User WHERE 1 = 1 ";
		return this.getCount(hql, columns, objs);
	}

	public List<User> getUserToGroupId(int groupId) {
		String hql = "FROM User u WHERE u.group.id=:groupId ";
		List list = this.getHQLList(hql, new String[]{"groupId"}, new Object[]{groupId});
		return list;
	}
	
}
