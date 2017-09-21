package com.cloud.dao;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

import com.cloud.controller.bo.StatBO;
import com.cloud.entity.Comment;

public interface CommentDAO extends BaseDAO<Comment, Serializable>{
	public List<Comment> getListToContentIdAndCommentId(int page,int pageSize,int contentId,int commentId,String order);
	public int getListCountToUserId(int userId);
	
	public List<StatBO> getCountToUserIdAndCreateTime(int userId,Map<String,Long> betweens);
	public List<Comment> getListToCommentId(int commentId);
}
