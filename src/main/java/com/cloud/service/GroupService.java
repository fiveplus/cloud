package com.cloud.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cloud.dao.GroupDAO;
import com.cloud.entity.Group;

@Service("groupService")  
public class GroupService extends BaseService<Group, Integer>{
	@Autowired  
	private GroupDAO groupDAO;

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
	
	public void delete(Integer id){
		Group g = get(id);
		g.setStatus("N");
		update(g, id);
	}
	
}
