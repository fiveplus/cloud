package com.cloud.service;

import java.util.List;

import com.cloud.entity.Comment;

public interface CommentService {
	Comment load(Integer id);
	Comment get(Integer id);
	List<Comment> findAll();
	void persist(Comment entity);  
    Integer save(Comment entity);  
    void update(Comment entity);  
    void delete(Integer id);  
    void flush();
    public List<Comment> getListToContentId(int page,int pageSize,int contentId);
}
