package com.cloud.interceptor;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.cloud.entity.Permission;
import com.cloud.entity.User;
import com.cloud.service.PermissionService;

public class SecurityFilter implements Filter{

	private String[] url;
	private String encoding;
	
	private PermissionService permissionService;
	
	public void init(FilterConfig config) throws ServletException {
		encoding = config.getInitParameter("encoding");
		url = config.getInitParameter("url").split(",");
		
		//TODO 初始化加载spring bean
		ServletContext context = config.getServletContext();
		ApplicationContext ac = WebApplicationContextUtils.getWebApplicationContext(context);
		permissionService = (PermissionService)ac.getBean("permissionService");
	}

	public void doFilter(ServletRequest req, ServletResponse res,
			FilterChain chain) throws IOException, ServletException {
		req.setCharacterEncoding(encoding);
		res.setCharacterEncoding(encoding);
		
		HttpServletRequest request = (HttpServletRequest)req;
		HttpServletResponse response = (HttpServletResponse)res;
		
		HttpSession session = request.getSession();
		
		User user = (User)session.getAttribute("user");
		
		String uri = request.getRequestURI();
		String request_uri = uri.substring(uri.lastIndexOf("/")+1);
		request_uri = request_uri.toLowerCase();
		
		for(String u:url){
			if(request_uri.endsWith(u)){
				chain.doFilter(request, response);
				return;
			}
		}
		
		
		//String path = request.getContextPath();
		//String path = PropertiesUtil.getValue("domain");
		if(user == null){
			request.getRequestDispatcher("/login").forward(request, response);
			return;
		}else{
			//验证通过
			//后台参数
			String menuId = request.getParameter("menuId");
			if(menuId != null){
				Permission p = permissionService.get(menuId);
				if(p.getIsMenu().equals("Y")){
					String parentId = p.getParentId();
					session.setAttribute("parentId", parentId);
				}
			}
			//前台参数
			String rightMenuId = request.getParameter("rightMenuId");
			if(rightMenuId != null){
				session.setAttribute("rightMenuId", rightMenuId);
			}
			String dataid = request.getParameter("dataid");
			if(dataid != null){
				session.setAttribute("dataid", dataid);
			}
			chain.doFilter(req, res);
		}
		
	}

	public void destroy() {
		
	}

}
