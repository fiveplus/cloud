package com.cloud.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cloud.dao.ProjectDAO;
import com.cloud.entity.Project;
import com.cloud.service.ProjectService;

@Service("projectService")  
public class ProjectService extends BaseService<Project, Integer>{
	@Autowired 
	private ProjectDAO projectDAO;

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
