package com.cloud.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cloud.dao.ProgressDAO;
import com.cloud.entity.Progress;
import com.cloud.service.ProgressService;

@Service("progressService")  
public class ProgressService extends BaseService<Progress, Integer>{
	@Autowired  
	private ProgressDAO progressDAO;

	public List<Progress> getProgressToProjectId(int projectId) {
		return progressDAO.getProgressToProjectId(projectId);
	}
	
}
