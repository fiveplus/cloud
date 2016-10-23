package com.cloud.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cloud.dao.ThemeDAO;
import com.cloud.entity.Project;
import com.cloud.entity.Theme;
import com.cloud.service.ThemeService;
import com.cloud.util.BeanUtil;

@Service("themeService")  
public class ThemeServiceImpl implements ThemeService{
	@Autowired  
	private ThemeDAO themeDAO;

	public Theme load(Integer id) {
		return themeDAO.load(id);
	}

	public Theme get(Integer id) {
		return themeDAO.get(id);
	}

	public List<Theme> findAll() {
		return themeDAO.finaAll();
	}

	public void persist(Theme entity) {
		themeDAO.persist(entity);
	}

	public Integer save(Theme entity) {
		return (Integer) themeDAO.save(entity);
	}

	public void saveOrUpdate(Theme entity) {
		Theme old = themeDAO.get(entity.getId());
		try {
			BeanUtil.copyProperties(entity, old);
			themeDAO.update(old);	
		} catch (Exception e) {
			e.printStackTrace();
		}	
	}

	public void delete(Integer id) {
		themeDAO.delete(id);		
	}

	public void flush() {
		themeDAO.flush();
	}

	public List<Theme> getList(int page, int pageSize, String[] columns,
			Object[] objs) {
		return themeDAO.getList(page, pageSize, columns, objs);
	}

	public int getListCount(String[] columns, Object[] objs) {
		return themeDAO.getListCount(columns, objs);
	}
	
	
	
}
