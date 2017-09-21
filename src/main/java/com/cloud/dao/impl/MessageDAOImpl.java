package com.cloud.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.cloud.dao.MessageDAO;
import com.cloud.entity.Message;

@Repository("messageDAO")
public class MessageDAOImpl extends BaseDAOImpl<Message> implements MessageDAO{

	public int getReadCount(int toUserId, int fromUserId, String isRead) {
		String hql = "SELECT COUNT(*) FROM Message a where a.toUser.id = " + toUserId + " AND a.fromUser.id = " + fromUserId + " AND a.isRead = " + "'" + isRead + "' ";
		return this.getCount(hql, null, null);
	}

	public List<Message> getMessages(int toUserId, int fromUserId) {
		String hql = "FROM Message m WHERE (m.toUser.id=:toUserId AND m.fromUser.id=:fromUserId) OR (m.toUser.id=:fromUserId AND m.fromUser.id=:toUserId) ORDER BY m.createTime ASC ";
		List list = this.getHQLList(hql, new String[]{"toUserId","fromUserId"}, new Object[]{toUserId,fromUserId});
		return list;
	}

	public void updateReadMessage(int toUserId, int fromUserId, String isRead) {
		String hql = "UPDATE Message a set a.isRead = '"+isRead+"' WHERE a.toUser.id = " + toUserId+" AND a.fromUser.id = " + fromUserId;
		this.updateHQL(hql, null, null);
	}
	
	
	
	
}
