package com.cloud.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cloud.dao.LevelDAO;
import com.cloud.entity.Level;

@Service("levelService") 
public class LevelService extends BaseService<Level, Integer>{
	
	@Autowired
	private LevelDAO levelDAO;

	public int getListCount(String[] columns, Object[] objs) {
		return levelDAO.getListCount(columns,objs);
	}

	public List<Level> getList(int page, int pageSize, String[] columns,
			Object[] objs) {
		return levelDAO.getList(page,pageSize,columns,objs);
	}

	public List<Level> getParentList() {
		return levelDAO.getParentList();
	}

	public List<Level> getChildList(int parentId) {
		return levelDAO.getChildList(parentId);
	}
	
	
	
}
