package com.cloud.dao;

import java.io.Serializable;
import java.util.List;

import com.cloud.entity.Message;


public interface MessageDAO extends BaseDAO<Message, Serializable>{
	public int getReadCount(int toUserId,int fromUserId, String isRead);
	public List<Message> getMessages(int toUserId,int fromUserId);
	public void updateReadMessage(int toUserId,int fromUserId,String isRead);
}
