package com.cloud.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cloud.dao.GroupDAO;
import com.cloud.entity.DeptPermission;
import com.cloud.entity.Group;
import com.cloud.entity.Permission;
import com.cloud.service.GroupService;
import com.cloud.util.BeanUtil;

@Service("groupService")  
public class GroupServiceImpl implements GroupService{
	@Autowired  
	private GroupDAO groupDAO;

	public Group load(Integer id) {
		return groupDAO.load(id);
	}

	public Group get(Integer id) {
		return groupDAO.get(id);
	}

	public List<Group> findAll() {
		return groupDAO.finaAll();
	}

	public void persist(Group entity) {
		groupDAO.persist(entity);		
	}

	public Integer save(Group entity) {
		return (Integer) groupDAO.save(entity);
	}

	public void saveOrUpdate(Group entity) {
		Group old = groupDAO.get(entity.getId());
		try {
			BeanUtil.copyProperties(entity, old);
			groupDAO.update(old);	
		} catch (Exception e) {
			e.printStackTrace();
		}		
	}

	public void delete(Integer id) {
		groupDAO.delete(id);		
	}

	public void flush() {
		groupDAO.flush();		
	}

	public List<Group> getList(int page, int pageSize, String[] columns,
			Object[] objs) {
		return groupDAO.getList(page, pageSize, columns, objs);
	}

	public int getListCount(String[] columns, Object[] objs) {
		return groupDAO.getListCount(columns, objs);
	}

	public List<Group> getParentList() {
		return groupDAO.getParentList();
	}

	public List<Group> getChildList(int parentId) {
		return groupDAO.getChildList(parentId);
	}

	public List<Group> getChildList() {
		return groupDAO.getChildList();
	}
	
	
	
}
