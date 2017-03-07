package com.cloud.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

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

}
