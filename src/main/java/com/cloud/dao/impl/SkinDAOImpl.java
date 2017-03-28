package com.cloud.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.cloud.dao.SkinDAO;
import com.cloud.entity.Skin;


@Repository("skinDAO")
public class SkinDAOImpl extends BaseDAOImpl<Skin> implements SkinDAO{

	public Skin getSkinByUserId(int userId) {
		Skin skin = null;
		String hql = "FROM Skin s WHERE s.user.id=:userId ";
		List list = this.getHQLList(hql, new String[]{"userId"}, new Object[]{userId});
		if(list != null && list.size() > 0){
			skin = (Skin) list.get(0);
		}
		return skin;
	}
	
}
