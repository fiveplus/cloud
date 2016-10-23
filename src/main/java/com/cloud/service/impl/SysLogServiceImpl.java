package com.cloud.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cloud.dao.SysLogDAO;
import com.cloud.entity.Permission;
import com.cloud.entity.SysLog;
import com.cloud.service.SysLogService;
import com.cloud.util.BeanUtil;

@Service("sysLogService") 
public class SysLogServiceImpl implements SysLogService{

	@Autowired  
	private SysLogDAO sysLogDAO;
	
	public SysLog load(Integer id) {
		return sysLogDAO.load(id);
	}

	public SysLog get(Integer id) {
		return sysLogDAO.get(id);
	}

	public List<SysLog> findAll() {
		return sysLogDAO.finaAll();
	}

	public void persist(SysLog entity) {
		sysLogDAO.persist(entity);		
	}

	public Integer save(SysLog entity) {
		return (Integer) sysLogDAO.save(entity);
	}

	public void saveOrUpdate(SysLog entity) {
		SysLog old = sysLogDAO.get(entity.getId());
		try {
			BeanUtil.copyProperties(entity, old);
			sysLogDAO.update(old);	
		} catch (Exception e) {
			e.printStackTrace();
		}		
	}

	public void delete(Integer id) {
		sysLogDAO.delete(id);
	}

	public void flush() {
		sysLogDAO.flush();
	}

	public List<SysLog> getListToUserId(int userId) {
		return sysLogDAO.getListToUserId(userId);
	}

}
