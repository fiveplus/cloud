package com.cloud.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.cloud.dao.LevelDAO;
import com.cloud.entity.Level;

@Repository("levelDAO")
public class LevelDAOImpl extends BaseDAOImpl<Level> implements LevelDAO{

	public int getListCount(String[] columns, Object[] objs) {
		String hql = "SELECT COUNT(*) FROM Level l WHERE l.status='Y' ";
		return this.getCount(hql, columns, objs);
	}

	public List<Level> getList(int page, int pageSize, String[] columns,
			Object[] objs) {
		String hql = "FROM Level l WHERE l.status='Y' ";
		List list = this.getList(page,pageSize,hql, columns, objs);
		return list;
	}

	public List<Level> getParentList() {
		String sql = "select * from tbl_level l where l.status='Y' AND l.parent_id is NULL ";
		List list = this.getSQLList(sql, null, Level.class);
		return list;
	}

	public List<Level> getChildList(int parentId) {
		String sql = "select * from tbl_level l where l.status='Y' AND l.parent_id = ? ";
		List list = this.getSQLList(sql, new Object[]{parentId}, Level.class);
		return list;
	}

}
