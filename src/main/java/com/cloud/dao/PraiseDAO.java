package com.cloud.dao;

import java.io.Serializable;

import com.cloud.entity.Praise;

public interface PraiseDAO extends BaseDAO<Praise, Serializable>{
	public Praise getPraiseByContentIdAndUserId(int contentId,int userId);
	public int getCountByContentId(int contentId);
}
