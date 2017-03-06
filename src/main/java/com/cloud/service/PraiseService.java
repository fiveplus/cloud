package com.cloud.service;

import java.util.List;

import com.cloud.entity.Praise;
import com.cloud.entity.User;

public interface PraiseService {
	Praise load(Integer id);
	Praise get(Integer id);
	List<Praise> findAll();
	void persist(Praise entity);  
    Integer save(Praise entity);  
    void update(Praise entity);  
    void delete(Integer id);  
    void flush();
    
    public Praise getPraiseByContentIdAndUserId(int contentId,int userId);
    public int getCountByContentId(int contentId);
    
    public List<User> getUserListByContentId(int contentId);
    
}
