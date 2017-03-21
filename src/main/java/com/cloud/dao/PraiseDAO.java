package com.cloud.dao;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

import com.cloud.controller.bo.StatBO;
import com.cloud.entity.Praise;
import com.cloud.entity.User;

public interface PraiseDAO extends BaseDAO<Praise, Serializable>{
	public Praise getPraiseByContentIdAndUserId(int contentId,int userId);
	public int getCountByContentId(int contentId);
	public List<User> getUserListByContentId(int contentId);
	
	public List<StatBO> getCountToUserIdAndCreateTime(int userId,Map<String,Long> betweens);
	
}
