package com.cloud.dao.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.cloud.controller.bo.StatBO;
import com.cloud.dao.CommentDAO;
import com.cloud.entity.Comment;

@Repository("commentDAO")
public class CommentDAOImpl extends BaseDAOImpl<Comment> implements CommentDAO{

	public List<Comment> getListToContentId(int page, int pageSize,
			int contentId) {
		String hql = "FROM Comment c WHERE c.cont.id =:contentId ORDER BY c.createTime DESC ";
		List list = this.getList(page, pageSize, hql, new String[]{"contentId"}, new Object[]{contentId});
		return list;
	}

	public int getListCountToUserId(int userId) {
		String hql = "SELECT COUNT(*) FROM Comment c WHERE c.user.id=:userId ";
		int count = this.getCount(hql, new String[]{"userId"}, new Object[]{userId});
		return count;
	}

	@Override
	public List<StatBO> getCountToUserIdAndCreateTime(int userId,
			Map<String, Long> betweens) {
		long beforeTime = betweens.get("beforeTime");
		long afterTime = betweens.get("afterTime");
		String hql = "select new com.cloud.controller.bo.StatBO(FROM_UNIXTIME(c.createTime/1000,'%Y-%m-%d') as name,count(*) as count) from Comment c where c.user.id =:userId and c.createTime >=:beforeTime and c.createTime <=:afterTime group by FROM_UNIXTIME(c.createTime/1000,'%Y-%m-%d') ";
		List list = this.getHQLList(hql, new String[]{"userId","beforeTime","afterTime"}, new Object[]{userId,beforeTime,afterTime});
		return list;
	}

}
