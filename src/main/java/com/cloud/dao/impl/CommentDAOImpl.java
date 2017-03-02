package com.cloud.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.cloud.dao.CommentDAO;
import com.cloud.entity.Comment;

@Repository("commentDAO")
public class CommentDAOImpl extends BaseDAOImpl<Comment> implements CommentDAO{

	public List<Comment> getListToContentId(int page, int pageSize,
			int contentId) {
		String hql = "FROM Comment c where c.cont.id =:contentId ";
		List list = this.getList(page, pageSize, hql, new String[]{"contentId"}, new Object[]{contentId});
		return list;
	}

}
