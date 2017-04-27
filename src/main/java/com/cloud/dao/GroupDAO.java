package com.cloud.dao;

import java.io.Serializable;
import java.util.List;

import com.cloud.entity.Group;

public interface GroupDAO extends BaseDAO<Group, Serializable>{
	public List<Group> getList(int page, int pageSize, String[] columns,Object[] objs);
	public int getListCount(String[] columns, Object[] objs);
	public List<Group> getParentList();
	public List<Group> getChildList(int parentId);
	public List<Group> getChildList();
}
