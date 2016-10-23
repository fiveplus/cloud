package com.cloud.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cloud.dao.LevelDAO;
import com.cloud.entity.DeptPermission;
import com.cloud.entity.Level;
import com.cloud.service.LevelService;
import com.cloud.util.BeanUtil;

@Service("levelService") 
public class LevelServiceImpl implements LevelService{
	
	@Autowired
	private LevelDAO levelDAO;

	public int getListCount(String[] columns, Object[] objs) {
		return levelDAO.getListCount(columns,objs);
	}

	public List<Level> getList(int page, int pageSize, String[] columns,
			Object[] objs) {
		return levelDAO.getList(page,pageSize,columns,objs);
	}

	public void update(Level level) {
		Level old = levelDAO.get(level.getId());
		try {
			BeanUtil.copyProperties(level, old);
			levelDAO.update(old);	
		} catch (Exception e) {
			e.printStackTrace();
		}	
	}

	public Integer save(Level level) {
		return (Integer) levelDAO.save(level);
	}

	public Level get(Integer id) {
		return levelDAO.get(id);
	}

	public List<Level> getParentList() {
		return levelDAO.getParentList();
	}

	public List<Level> getChildList(int parentId) {
		return levelDAO.getChildList(parentId);
	}
	
	
	
}
