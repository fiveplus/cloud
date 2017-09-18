package com.cloud.spring;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import com.cloud.util.PropertiesUtil;

public class SystemConfigListener implements ServletContextListener{
	/** 当前应用上下文 */
	private static ServletContext context;
	public void contextInitialized(ServletContextEvent sce) {
		context = sce.getServletContext();
		//contextPath = context.getContextPath();
		//contextPath = PropertiesUtil.getValue("domain");
		//全站注入
		String contextPath = context.getContextPath();
		System.out.println(contextPath);
		context.setAttribute("contextPath", contextPath);
	}

	public void contextDestroyed(ServletContextEvent sce) {
		
	}

}
