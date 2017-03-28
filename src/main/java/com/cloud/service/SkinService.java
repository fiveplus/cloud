package com.cloud.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cloud.dao.SkinDAO;
import com.cloud.entity.Skin;

@Service("skinServcie")
public class SkinService extends BaseService<Skin, Integer>{
	
	@Autowired
	private SkinDAO skinDAO;
	
	public Skin getSkinByUserId(int userId){
		return skinDAO.getSkinByUserId(userId);
	}
}
