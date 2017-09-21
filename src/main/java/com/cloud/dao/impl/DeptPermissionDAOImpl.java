package com.cloud.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.cloud.dao.DeptPermissionDAO;
import com.cloud.entity.DeptPermission;
import com.cloud.entity.Permission;

@Repository("deptPermissionDAO")
public class DeptPermissionDAOImpl extends BaseDAOImpl<DeptPermission> implements DeptPermissionDAO{

	public List<Permission> getChildPermission(Integer deptId) {
		String sql = "select p.* from sys_dept_permission dp left join sys_permission p on dp.permission_id = p.id where dp.dept_id = ? order by p.menu_index asc ";
		List list = this.getSQLList(sql, new Object[]{deptId}, Permission.class);
		return list;
	}

	public int getChildCount(String[] columns,Object[] objs) {
		String hql = "SELECT COUNT(*) FROM Permission p where p.parentId != 'admin' ";
		int count = this.getCount(hql, columns, objs);
		return count;
	}

	public List<Permission> getList(int page, int pageSize, String[] columns,
			Object[] objs) {
		String hql = "FROM Permission p WHERE p.parentId != 'admin' ";
		List list = this.getHQLList(hql, columns, objs);
		return list;
	}

	public DeptPermission get(String permissionId, int deptId) {
		String hql = "FROM DeptPermission dp WHERE dp.permissionId=:permissionId AND dp.deptId=:deptId ";
		List list = this.getHQLList(hql, new String[]{"permissionId","deptId"}, new Object[]{permissionId,deptId});
		DeptPermission dp = null;
		if(list != null && list.size() > 0){
			dp = (DeptPermission) list.get(0);
		}
		return dp;
	}

	public int deletePermissionByDeptId(int deptId) {
		String hql = "DELETE FROM DeptPermission dp WHERE dp.deptId=:deptId ";
		int num = this.updateHQL(hql, new String[]{"deptId"}, new Object[]{deptId});
		return num;
	}
}
