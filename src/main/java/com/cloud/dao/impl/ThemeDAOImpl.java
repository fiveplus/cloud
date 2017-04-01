package com.cloud.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cloud.dao.ThemeDAO;
import com.cloud.entity.Theme;

@Repository("themeDAO")
public class ThemeDAOImpl extends BaseDAOImpl<Theme> implements ThemeDAO{
	public List<Theme> getList(int page, int pageSize, String[] columns,
			Object[] objs) {
		String hql = "FROM Theme t WHERE t.status='Y' ";
		List list = this.getList(page,pageSize,hql, columns, objs);
		return list;
	}

	public int getListCount(String[] columns, Object[] objs) {
		String hql = "SELECT COUNT(*) FROM Theme t WHERE t.status='Y' ";
		int count = this.getCount(hql, columns, objs);
		return count;
	}
	
	
}
