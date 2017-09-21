package com.cloud.service;

import java.io.Serializable;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.cloud.dao.BaseDAO;
import com.cloud.util.BeanUtil;

public class BaseService<T,PK extends Serializable>{
	
	@Autowired
	private BaseDAO<T, Serializable> baseDAO;
	
	public T load(PK id) {
		return baseDAO.load(id);
	}

	public T get(PK id) {
		return baseDAO.get(id);
	}

	public List<T> findAll() {
		return baseDAO.findAll();
	}

	public void persist(T entity) {
		baseDAO.persist(entity);		
	}

	@SuppressWarnings("unchecked")
	public PK save(T entity) {
		return (PK) baseDAO.save(entity);
	}

	/**
	 * 更新非空字段
	 * @param entity 实体类
	 * @param id 主键id
	 */
	public void update(T entity,PK id) {
		T old = baseDAO.get(id);
		try {
			BeanUtil.copyProperties(entity, old);
			baseDAO.update(old);	
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void delete(PK id) {
		baseDAO.delete(id);		
	}

	public void flush() {
		baseDAO.flush();		
	}

}
