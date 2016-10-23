package com.cloud.dao;

import java.io.Serializable;
import java.util.LinkedHashMap;
import java.util.List;

public interface BaseDAO<T,PK extends Serializable> {
	T load(PK id);
	T get(PK id);
	List<T> finaAll();
	void persist(T entity);
	PK save(T entity);
	void update(T entity);
	void updateHQL(String hql,String[] columns,Object[] objs);
	void delete(PK id);
	void flush();
	List<?> getHQLList(String hql,String[] columns,Object[] objs);
	List<?> getList(int page,int pageSize,String hql,String[] columns,Object[] objs);
	int getCount(String hql,String[] columns,Object[] objs);
	List<?> getSQLList(String sql,Object[] objs,Class clazz);
}
