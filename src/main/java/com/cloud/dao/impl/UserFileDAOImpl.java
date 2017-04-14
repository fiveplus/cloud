package com.cloud.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.cloud.dao.UserFileDAO;
import com.cloud.entity.UserFile;

@Repository("userFileDAO")
public class UserFileDAOImpl extends BaseDAOImpl<UserFile> implements UserFileDAO{

	public int getListCountToDeptId(int deptId) {
		String hql = "SELECT COUNT(*) FROM UserFile f WHERE f.user.dept.id=:deptId  ";
		int count = this.getCount(hql, new String[]{"deptId"}, new Object[]{deptId});
		return count;
	}

	public List<UserFile> getListToDeptId(int page, int pageSize, int deptId) {
		String hql = "FROM UserFile f WHERE f.user.dept.id=:deptId ORDER BY f.createTime DESC ";
		List list = this.getList(page, pageSize, hql, new String[]{"deptId"}, new Object[]{deptId});
		return list;
	}

	public UserFile getUserFileToUrl(String url) {
		UserFile f = null;
		String hql = "FROM UserFile f WHERE f.url=:url ";
		List list = this.getHQLList(hql, new String[]{"url"}, new Object[]{url});
		if(list != null && list.size() > 0){
			f = (UserFile) list.get(0);
		}
		return f;
	}

}
