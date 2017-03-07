package com.cloud.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cloud.dao.CommentDAO;
import com.cloud.entity.Comment;
import com.cloud.service.CommentService;
import com.cloud.util.BeanUtil;

@Service("commentService")
public class CommentServiceImpl implements CommentService{
	@Autowired
	private CommentDAO commentDAO;

	public Comment load(Integer id) {
		return commentDAO.load(id);
	}

	public Comment get(Integer id) {
		return commentDAO.get(id);
	}

	public List<Comment> findAll() {
		return commentDAO.finaAll();
	}

	public void persist(Comment entity) {
		commentDAO.persist(entity);
	}

	public Integer save(Comment entity) {
		return (Integer) commentDAO.save(entity);
	}

	public void update(Comment entity) {
		Comment old = commentDAO.get(entity.getId());
		try {
			BeanUtil.copyProperties(entity, old);
			commentDAO.update(old);	
		} catch (Exception e) {
			e.printStackTrace();
		}	
	}

	public void delete(Integer id) {
		commentDAO.delete(id);
	}

	public void flush() {
		commentDAO.flush();
	}

	public List<Comment> getListToContentId(int page, int pageSize,
			int contentId) {
		return commentDAO.getListToContentId(page,pageSize,contentId);
	}
	
	
	
}
