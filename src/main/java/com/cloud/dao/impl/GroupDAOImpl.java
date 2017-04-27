package com.cloud.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cloud.dao.GroupDAO;
import com.cloud.entity.Content;
import com.cloud.entity.Group;

@Repository("groupDAO")
public class GroupDAOImpl extends BaseDAOImpl<Group> implements GroupDAO{

	public List<Group> getList(int page, int pageSize, String[] columns,
			Object[] objs) {
		String hql = "FROM Group g WHERE g.status = 'Y' ";
		List list = this.getList(page,pageSize,hql, columns, objs);
		return list;
	}

	public int getListCount(String[] columns, Object[] objs) {
		String hql = "SELECT COUNT(*) FROM Group g WHERE g.status = 'Y' ";
		int count = this.getCount(hql, columns, objs);
		return count;
	}

	public List<Group> getParentList() {
		String sql = "select * from tbl_group g where g.status = 'Y' AND g.parent_id is NULL";
		List list = this.getSQLList(sql, null, Group.class);
		return list;
	}

	public List<Group> getChildList(int parentId) {
		String sql = "select * from tbl_group g where g.status = 'Y' AND g.parent_id = ? ";
		List list = this.getSQLList(sql, new Object[]{parentId}, Group.class);
		return list;
	}

	public List<Group> getChildList() {
		String sql = "select * from tbl_group g where g.status = 'Y' AND g.parent_id is not null ";
		List list = this.getSQLList(sql, null, Group.class);
		return list;
	}
	
	
	
	
}
