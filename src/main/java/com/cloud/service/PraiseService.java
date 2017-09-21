package com.cloud.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cloud.controller.bo.StatBO;
import com.cloud.dao.PraiseDAO;
import com.cloud.entity.Praise;
import com.cloud.entity.User;
import com.cloud.service.PraiseService;

@Service("praiseService")
public class PraiseService extends BaseService<Praise, Integer>{
	@Autowired
	private PraiseDAO praiseDAO;

	public Praise getPraiseByContentIdAndUserId(int contentId, int userId) {
		return praiseDAO.getPraiseByContentIdAndUserId(contentId, userId);
	}

	public int getCountByContentId(int contentId) {
		return praiseDAO.getCountByContentId(contentId);
	}

	public List<User> getUserListByContentId(int contentId) {
		return praiseDAO.getUserListByContentId(contentId);
	}
	
	public List<StatBO> getCountToUserIdAndCreateTime(int userId,Map<String,Long> betweens){
		return praiseDAO.getCountToUserIdAndCreateTime(userId, betweens);
	}
	
}
