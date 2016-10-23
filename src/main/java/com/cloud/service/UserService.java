package com.cloud.service;

import java.util.List;

import com.cloud.dao.BaseDAO;
import com.cloud.entity.Project;
import com.cloud.entity.User;

public interface UserService{
	User load(Integer id);
	User get(Integer id);
	List<User> findAll();
	void persist(User entity);  
    Integer save(User entity);  
    void update(User entity);  
    void delete(Integer id);  
    void flush();
    User getUserByLoginNameAndPassword(String loginName,String password);
    public List<User> getList(int page, int pageSize, String[] columns,Object[] objs);
	public int getListCount(String[] columns, Object[] objs);
	public List<User> getUserToGroupId(int groupId);
	
}
