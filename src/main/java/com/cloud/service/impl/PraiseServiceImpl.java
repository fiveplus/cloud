package com.cloud.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cloud.dao.PraiseDAO;
import com.cloud.entity.Message;
import com.cloud.entity.Praise;
import com.cloud.entity.User;
import com.cloud.service.PraiseService;
import com.cloud.util.BeanUtil;

@Service("praiseService")
public class PraiseServiceImpl implements PraiseService{
	@Autowired
	private PraiseDAO praiseDAO;

	public Praise load(Integer id) {
		return praiseDAO.load(id);
	}

	public Praise get(Integer id) {
		return praiseDAO.get(id);
	}

	public List<Praise> findAll() {
		return praiseDAO.finaAll();
	}

	public void persist(Praise entity) {
		praiseDAO.persist(entity);
	}

	public Integer save(Praise entity) {
		return (Integer) praiseDAO.save(entity);
	}

	public void update(Praise entity) {
		Praise old = praiseDAO.get(entity.getId());
		try {
			BeanUtil.copyProperties(entity, old);
			praiseDAO.update(old);	
		} catch (Exception e) {
			e.printStackTrace();
		}			
	}

	public void delete(Integer id) {
		praiseDAO.delete(id);
	}

	public void flush() {
		praiseDAO.flush();
	}

	public Praise getPraiseByContentIdAndUserId(int contentId, int userId) {
		return praiseDAO.getPraiseByContentIdAndUserId(contentId, userId);
	}

	public int getCountByContentId(int contentId) {
		return praiseDAO.getCountByContentId(contentId);
	}

	public List<User> getUserListByContentId(int contentId) {
		return praiseDAO.getUserListByContentId(contentId);
	}
	
	
	
}
