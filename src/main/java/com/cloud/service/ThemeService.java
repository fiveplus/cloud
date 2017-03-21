package com.cloud.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cloud.dao.ThemeDAO;
import com.cloud.entity.Theme;
import com.cloud.service.ThemeService;

@Service("themeService")  
public class ThemeService extends BaseService<Theme, Integer>{
	@Autowired  
	private ThemeDAO themeDAO;
	
	public List<Theme> getList(int page, int pageSize, String[] columns,
			Object[] objs) {
		return themeDAO.getList(page, pageSize, columns, objs);
	}

	public int getListCount(String[] columns, Object[] objs) {
		return themeDAO.getListCount(columns, objs);
	}
	
	
	
}
