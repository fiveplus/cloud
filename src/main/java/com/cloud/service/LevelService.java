package com.cloud.service;

import java.util.List;

import com.cloud.entity.Level;

public interface LevelService {
	public int getListCount(String[] columns,Object[] objs);
	public List<Level> getList(int page,int pageSize,String[] columns,Object[] objs);
	
	public void update(Level level);
	public Integer save(Level level);
	public Level get(Integer id);
	public List<Level> getParentList();
	
	public List<Level> getChildList(int parentId);
	
}
