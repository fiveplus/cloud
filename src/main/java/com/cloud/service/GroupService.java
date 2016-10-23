package com.cloud.service;

import java.util.List;

import com.cloud.entity.Group;
import com.cloud.entity.Permission;


public interface GroupService {
	Group load(Integer id);
	Group get(Integer id);
	List<Group> findAll();
	void persist(Group entity);  
    Integer save(Group entity);  
    void saveOrUpdate(Group entity);  
    void delete(Integer id);  
    void flush();
    List<Group> getList(int page,int pageSize,String[] columns,Object[] objs);
    int getListCount(String[] columns,Object[] objs);
    List<Group> getParentList();
    public List<Group> getChildList(int parentId);
    public List<Group> getChildList();
}
