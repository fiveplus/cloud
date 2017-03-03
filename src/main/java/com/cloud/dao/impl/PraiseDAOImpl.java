package com.cloud.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.cloud.dao.PraiseDAO;
import com.cloud.entity.Praise;

@Repository("praiseDAO")
public class PraiseDAOImpl extends BaseDAOImpl<Praise> implements PraiseDAO{

	public Praise getPraiseByContentIdAndUserId(int contentId, int userId) {
		Praise praise = null;
		String hql = "FROM Praise p WHERE p.contentId=:contentId and p.userId=:userId ";
		List list = this.getHQLList(hql, new String[]{"contentId","userId"}, new Object[]{contentId,userId});
		if(list != null && list.size()>0){
			praise = (Praise) list.get(0);
		}
		return praise;
	}

	public int getCountByContentId(int contentId) {
		String hql = "SELECT COUNT(*) FROM Praise p WHERE p.contentId=:contentId ";
		int count = this.getCount(hql, new String[]{"contentId"}, new Object[]{contentId});
		return count;
	}

}
