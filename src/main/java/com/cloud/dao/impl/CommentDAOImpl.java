package com.cloud.dao.impl;

import org.springframework.stereotype.Repository;

import com.cloud.dao.CommentDAO;
import com.cloud.entity.Comment;

@Repository("commentDAO")
public class CommentDAOImpl extends BaseDAOImpl<Comment> implements CommentDAO{

}
