package com.cloud.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cloud.dao.MessageDAO;
import com.cloud.entity.Message;
import com.cloud.service.MessageService;

@Service("messageService")  
public class MessageService extends BaseService<Message, Integer>{
	@Autowired  
	private MessageDAO messageDAO;

	public int getReadCount(int toUserId, int fromUserId, String isRead) {
		return messageDAO.getReadCount(toUserId, fromUserId, isRead);
	}

	public List<Message> getMessages(int toUserId, int fromUserId) {
		return messageDAO.getMessages(toUserId, fromUserId);
	}

	public void updateReadMessage(int toUserId, int fromUserId, String isRead) {
		messageDAO.updateReadMessage(toUserId, fromUserId, isRead);
	}
}
