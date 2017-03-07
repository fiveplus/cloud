package com.cloud.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cloud.dao.ContentDAO;
import com.cloud.entity.Calendar;
import com.cloud.entity.Content;

@Repository("contentDAO")
public class ContentDAOImpl extends BaseDAOImpl<Content> implements ContentDAO{
	public List<Content> getList(int page, int pageSize, String[] columns,
			Object[] objs) {
		String hql = "FROM Content c WHERE c.status = 'Y' ";
		List list = this.getList(page,pageSize,hql, columns, objs);
		return list;
	}

	public int getListCount(String[] columns, Object[] objs) {
		String hql = "SELECT COUNT(*) FROM Content c WHERE c.status = 'Y' ";
		int count = this.getCount(hql, columns, objs);
		return count;
	}

	public List<Content> getListToDeptIdAndThemeId(int page, int pageSize, int deptId,int themeId) {
		String hql = "FROM Content c WHERE c.user.dept.id=:deptId AND c.status = 'Y' ";
		if(themeId > 0){
			hql += " AND c.theme.id = " + themeId;
		}
		hql += " ORDER BY c.createTime desc ";
		List list = this.getList(page,pageSize,hql, new String[]{"deptId"}, new Object[]{deptId});
		return list;
	}

	public int getListCountToDeptIdAndThemeId(int deptId,int themeId) {
		String hql = "SELECT COUNT(*) FROM Content c WHERE c.user.dept.id=:deptId AND c.status = 'Y' ";
		if(themeId > 0){
			hql += " AND c.theme.id = " + themeId;
		}
		int count = this.getCount(hql, new String[]{"deptId"}, new Object[]{deptId});
		return count;
	}

	public int getListCountToUserId(int userId) {
		String hql = "SELECT COUNT(*) FROM Content c WHERE c.user.id=:userId AND c.status = 'Y' ";
		int count = this.getCount(hql, new String[]{"userId"}, new Object[]{userId});
		return count;
	}

	public List<Content> getListToUserId(int page, int pageSize, int userId) {
		String hql = "FROM Content c WHERE c.user.id=:userId AND c.status = 'Y' ORDER BY c.createTime desc ";
		List list = this.getList(page,pageSize,hql, new String[]{"userId"}, new Object[]{userId});
		return list;
	}

	public List<Content> getListToProjectId(int page, int pageSize,
			int projectId) {
		String hql = "FROM Content c WHERE c.project.id=:projectId AND c.status = 'Y' ORDER BY c.createTime desc  ";
		List list = this.getList(page,pageSize,hql, new String[]{"projectId"}, new Object[]{projectId});
		return list;
	}

	public int getListCountToProjectId(int projectId) {
		String hql = "SELECT COUNT(*) FROM Content c WHERE c.project.id=:projectId AND c.status = 'Y' ";
		int count = this.getCount(hql, new String[]{"projectId"}, new Object[]{projectId});
		return count;
	}

	public int getReadCountSumToUserId(int userId) {
		String hql = "SELECT SUM(c.readCount) FROM Content c WHERE c.user.id=:userId ";
		int sum = this.getCount(hql, new String[]{"userId"}, new Object[]{userId});
		return sum;
	}
}
