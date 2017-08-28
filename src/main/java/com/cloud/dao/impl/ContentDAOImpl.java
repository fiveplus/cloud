package com.cloud.dao.impl;

import java.util.List;
import java.util.Map;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cloud.controller.bo.KeyBO;
import com.cloud.controller.bo.RankBO;
import com.cloud.controller.bo.StatBO;
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

	public int getListCount(String username, Map<String, Long> betweens) {
		String hql = "SELECT COUNT(*) FROM Content c where c.status = 'Y' ";
		if(username != null){
			hql += " AND c.user.username like '%"+username+"%' ";
		}
		if(betweens != null){
			hql += " AND c.createTime > " + betweens.get("beforeTime");
			hql += " AND c.createTime < " + betweens.get("afterTime");
		}
		int count = this.getCount(hql, null, null);
		return count;
	}

	public List<Content> getListToUsername(int page, int pageSize,
			String username, Map<String, Long> betweens) {
		String hql = "FROM Content c where c.status = 'Y' ";
		if(username != null){
			hql += " AND c.user.username like '%"+username+"%' ";
		}
		if(betweens != null){
			hql += " AND c.createTime > " + betweens.get("beforeTime");
			hql += " AND c.createTime < " + betweens.get("afterTime");
		}
		hql += " ORDER BY c.createTime DESC ";
		List list = this.getList(page, pageSize, hql, null, null);
		return list;
	}

	@Override
	public List<StatBO> getCountToUserIdAndCreateTime(int userId,
			Map<String, Long> betweens) {
		String user_hql = "and c.user.id = " + userId;
		if(userId == 0) user_hql = "";
		long beforeTime = betweens.get("beforeTime");
		long afterTime = betweens.get("afterTime");
		String hql = "select new com.cloud.controller.bo.StatBO(FROM_UNIXTIME(c.createTime/1000,'%Y-%m-%d') as name,count(*) as count) from Content c where 1 = 1 "
		+ user_hql
		+ " and c.createTime >=:beforeTime and c.createTime <=:afterTime group by FROM_UNIXTIME(c.createTime/1000,'%Y-%m-%d') ";
		List list = this.getHQLList(hql, new String[]{"beforeTime","afterTime"}, new Object[]{beforeTime,afterTime});
		return list;
	}

	public List<RankBO> getCountToDeptNameAndCreateTime(
			Map<String, Long> betweens) {
		long beforeTime = betweens.get("beforeTime");
		long afterTime = betweens.get("afterTime");
		String hql = "select new com.cloud.controller.bo.RankBO(c.user.dept.name as deptName,c.theme.name as themeName,count(*) as count) from Content c where 1 = 1 and c.createTime >=:beforeTime and c.createTime <=:afterTime group by c.user.dept.id,c.theme.id order by count(*) ";
		List list = this.getHQLList(hql, new String[]{"beforeTime","afterTime"}, new Object[]{beforeTime,afterTime});
		return list;
	}
}
