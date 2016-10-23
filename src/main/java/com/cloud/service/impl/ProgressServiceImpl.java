package com.cloud.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cloud.dao.ProgressDAO;
import com.cloud.entity.Message;
import com.cloud.entity.Progress;
import com.cloud.service.ProgressService;
import com.cloud.util.BeanUtil;

@Service("progressService")  
public class ProgressServiceImpl implements ProgressService{
	@Autowired  
	private ProgressDAO progressDAO;

	public Progress load(Integer id) {
		return progressDAO.load(id);
	}

	public Progress get(Integer id) {
		return progressDAO.get(id);
	}

	public List<Progress> findAll() {
		return progressDAO.finaAll();
	}

	public void persist(Progress entity) {
		progressDAO.persist(entity);		
	}

	public Integer save(Progress entity) {
		return (Integer) progressDAO.save(entity);
	}

	public void saveOrUpdate(Progress entity) {
		Progress old = progressDAO.get(entity.getId());
		try {
			BeanUtil.copyProperties(entity, old);
			progressDAO.update(old);	
		} catch (Exception e) {
			e.printStackTrace();
		}	
	}

	public void delete(Integer id) {
		progressDAO.delete(id);		
	}

	public void flush() {
		progressDAO.flush();		
	}

	public List<Progress> getProgressToProjectId(int projectId) {
		return progressDAO.getProgressToProjectId(projectId);
	}
	
	
	
}
