package com.cloud.dao;

import java.io.Serializable;
import java.util.List;

import com.cloud.entity.Calendar;
import com.cloud.entity.Comment;

public interface CommentDAO extends BaseDAO<Comment, Serializable>{
	public List<Comment> getListToContentId(int page,int pageSize,int contentId);
}
