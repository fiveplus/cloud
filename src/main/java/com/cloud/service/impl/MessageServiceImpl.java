package com.cloud.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cloud.dao.MessageDAO;
import com.cloud.entity.Group;
import com.cloud.entity.Message;
import com.cloud.service.MessageService;
import com.cloud.util.BeanUtil;

@Service("messageService")  
public class MessageServiceImpl implements MessageService{
	@Autowired  
	private MessageDAO messageDAO;

	public Message load(Integer id) {
		return messageDAO.load(id);
	}

	public Message get(Integer id) {
		return messageDAO.get(id);
	}

	public List<Message> findAll() {
		return messageDAO.finaAll();
	}

	public void persist(Message entity) {
		messageDAO.persist(entity);		
	}

	public Integer save(Message entity) {
		return (Integer) messageDAO.save(entity);
	}

	public void saveOrUpdate(Message entity) {
		Message old = messageDAO.get(entity.getId());
		try {
			BeanUtil.copyProperties(entity, old);
			messageDAO.update(old);	
		} catch (Exception e) {
			e.printStackTrace();
		}		
	}

	public void delete(Integer id) {
		messageDAO.delete(id);		
	}

	public void flush() {
		messageDAO.flush();
	}

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
