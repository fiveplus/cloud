package com.cloud.dao;

import java.io.Serializable;
import java.util.List;

import com.cloud.entity.User;

public interface UserDAO  extends BaseDAO<User, Serializable>{
	public User getUserByLoginNameAndPassword(String loginName,String password);
	public List<User> getList(int page, int pageSize, String[] columns,Object[] objs);
	public int getListCount(String[] columns, Object[] objs);
	public List<User> getUserToGroupId(int groupId);
}
