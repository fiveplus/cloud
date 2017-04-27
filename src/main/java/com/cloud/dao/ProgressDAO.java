package com.cloud.dao;

import java.io.Serializable;
import java.util.List;

import com.cloud.entity.Progress;

public interface ProgressDAO extends BaseDAO<Progress, Serializable>{
	public List<Progress> getProgressToProjectId(int projectId);
}
