package com.cloud.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cloud.dao.ProjectDAO;
import com.cloud.entity.Progress;
import com.cloud.entity.Project;
import com.cloud.service.ProjectService;
import com.cloud.util.BeanUtil;

@Service("projectService")  
public class ProjectServiceImpl implements ProjectService{
	@Autowired 
	private ProjectDAO projectDAO;

	public Project load(Integer id) {
		return projectDAO.load(id);
	}

	public Project get(Integer id) {
		return projectDAO.get(id);
	}

	public List<Project> findAll() {
		return projectDAO.finaAll();
	}

	public void persist(Project entity) {
		projectDAO.persist(entity);		
	}

	public Integer save(Project entity) {
		return (Integer) projectDAO.save(entity);
	}

	public void update(Project entity) {
		Project old = projectDAO.get(entity.getId());
		try {
			BeanUtil.copyProperties(entity, old);
			projectDAO.update(old);	
		} catch (Exception e) {
			e.printStackTrace();
		}			
	}

	public void delete(Integer id) {
		projectDAO.delete(id);
	}

	public void flush() {
		projectDAO.flush();
	}

	public List<Project> getList(int page, int pageSize, String[] columns,
			Object[] objs) {
		return projectDAO.getList(page, pageSize, columns, objs);
	}

	public int getListCount(String[] columns, Object[] objs) {
		return projectDAO.getListCount(columns, objs);
	}

	public List<Project> getProjectToUserId(int userId) {
		return projectDAO.getProjectToUserId(userId);
	}
	
	
	
}
