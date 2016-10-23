package com.cloud.service;

import java.util.List;

import com.cloud.entity.Message;


public interface MessageService {
	Message load(Integer id);
	Message get(Integer id);
	List<Message> findAll();
	void persist(Message entity);  
    Integer save(Message entity);  
    void saveOrUpdate(Message entity);  
    void delete(Integer id);  
    void flush();
    public int getReadCount(int toUserId, int fromUserId, String isRead);
    public List<Message> getMessages(int toUserId,int fromUserId);
	public void updateReadMessage(int toUserId,int fromUserId,String isRead);
}
