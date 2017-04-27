package com.cloud.dao;

import java.io.Serializable;
import java.util.List;

import com.cloud.entity.Theme;


public interface ThemeDAO extends BaseDAO<Theme, Serializable>{
	public List<Theme> getList(int page, int pageSize, String[] columns,Object[] objs);
	public int getListCount(String[] columns, Object[] objs);
}
