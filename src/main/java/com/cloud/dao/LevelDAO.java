package com.cloud.dao;

import java.io.Serializable;
import java.util.List;

import com.cloud.entity.Level;

public interface LevelDAO extends BaseDAO<Level, Serializable>{
	public int getListCount(String[] columns,Object[] objs);
	public List<Level> getList(int page,int pageSize,String[] columns,Object[] objs);
	public List<Level> getParentList();
	public List<Level> getChildList(int parentId);
}
