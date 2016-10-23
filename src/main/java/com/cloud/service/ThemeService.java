package com.cloud.service;

import java.util.List;

import com.cloud.entity.Theme;

public interface ThemeService {
	Theme load(Integer id);
	Theme get(Integer id);
	List<Theme> findAll();
	void persist(Theme entity);  
    Integer save(Theme entity);  
    void saveOrUpdate(Theme entity);  
    void delete(Integer id);  
    void flush();
    List<Theme> getList(int page,int pageSize,String[] columns,Object[] objs);
    int getListCount(String[] columns,Object[] objs);
}
