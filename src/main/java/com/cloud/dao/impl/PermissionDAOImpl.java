package com.cloud.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cloud.dao.PermissionDAO;
import com.cloud.entity.Content;
import com.cloud.entity.Permission;

@Repository("permissionDAO")
public class PermissionDAOImpl  extends BaseDAOImpl<Permission> implements PermissionDAO{

	public List<Permission> getParentMenu() {
		String hql = "FROM Permission p WHERE p.parentId = 'admin' AND p.isMenu = 'Y' ORDER BY p.menuIndex ASC";
		List list = this.getHQLList(hql, null, null);
		return list;
	}

	public List<Permission> getList(int page, int pageSize, String[] columns,
			Object[] objs) {
		String hql = "FROM Permission p WHERE p.status = 'Y' ";
		List list = this.getList(page,pageSize,hql, columns, objs);
		return list;
	}

	public int getListCount(String[] columns, Object[] objs) {
		String hql = "SELECT COUNT(*) FROM Permission p WHERE p.status = 'Y' ";
		int count = this.getCount(hql, columns, objs);
		return count;
	}

	public List<Permission> getParentPermission() {
		String hql = "FROM Permission p WHERE p.parentId = 'admin' AND p.status = 'Y' ";
		List list = this.getHQLList(hql, null, null);
		return list;
	}

	public List<Permission> getPermissionByParentId(String parentId) {
		String hql = "FROM Permission p WHERE p.status = 'Y' ";
		if(parentId == null){
			hql += "AND p.parentId IS NULL ";
		}else{
			hql += "AND p.parentId = '"+parentId+"'";
		}
		List list = this.getHQLList(hql, null, null);
		return list;
	}

	public int getCountByParentId(String parentId) {
		String hql = "SELECT COUNT(*) FROM Permission p WHERE p.parentId =:parentId AND p.status = 'Y' ";
		int count = this.getCount(hql, new String[]{"parentId"}, new Object[]{parentId});
		return count;
	}
	
	
}
