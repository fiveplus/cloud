package com.cloud.dao.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.cloud.controller.bo.StatBO;
import com.cloud.dao.PraiseDAO;
import com.cloud.entity.Praise;
import com.cloud.entity.User;

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

	public List<User> getUserListByContentId(int contentId) {
		String sql = "select u.* from tbl_praise p left join tbl_user u on p.user_id = u.id where p.content_id = ? ";
		List list = this.getSQLList(sql, new Object[]{contentId}, User.class);
		return list;
	}

	public List<StatBO> getCountToUserIdAndCreateTime(int userId,
			Map<String, Long> betweens) {
		String user_hql = "and p.userId = " + userId;
		if(userId == 0) user_hql = "";
		long beforeTime = betweens.get("beforeTime");
		long afterTime = betweens.get("afterTime");
		String hql = "select new com.cloud.controller.bo.StatBO(FROM_UNIXTIME(p.createTime/1000,'%Y-%m-%d') as name,count(*) as count) from Praise p where 1 = 1 "
		+ user_hql
		+ " and p.createTime >=:beforeTime and p.createTime <=:afterTime group by FROM_UNIXTIME(p.createTime/1000,'%Y-%m-%d') ";
		List list = this.getHQLList(hql, new String[]{"beforeTime","afterTime"}, new Object[]{beforeTime,afterTime});
		return list;
	}
	

}
