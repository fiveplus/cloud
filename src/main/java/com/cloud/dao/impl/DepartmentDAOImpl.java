package com.cloud.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.cloud.dao.DepartmentDAO;
import com.cloud.entity.Department;

@Repository("departmentDAO")
public class DepartmentDAOImpl extends BaseDAOImpl<Department> implements DepartmentDAO{
	public List<Department> getList(int page, int pageSize, String[] columns,
			Object[] objs) {
		String hql = "FROM Department d WHERE d.status = 'Y' ";
		List list = this.getList(page,pageSize,hql, columns, objs);
		return list;
	}

	public int getListCount(String[] columns, Object[] objs) {
		String hql = "SELECT COUNT(*) FROM Department d WHERE d.status = 'Y' ";
		int count = this.getCount(hql, columns, objs);
		return count;
	}
}
