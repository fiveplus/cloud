package com.cloud.tag.master;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.BodyTagSupport;

public class ContentPageTag extends BodyTagSupport{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private final String masterFolderPath = "/admin/common/";
	private final String masetrPageSuffix = ".jsp";

	public void doInitBody() throws JspException {
		try{
			this.pageContext.getRequest().setCharacterEncoding("UTF-8");
		}catch(Exception e){
			e.printStackTrace();
		}
		super.doInitBody();
	}
	
	public int doAfterBody() throws JspException {
		return SKIP_BODY;
	}
	
	public int doStartTag() throws JspException {
		return EVAL_BODY_BUFFERED;
	}
	
	public int doEndTag() throws JspException {
		JspWriter out = pageContext.getOut();
		CustomResponse bufferedResponse = new CustomResponse((HttpServletResponse)this.pageContext.getResponse());
		try{
			//System.out.println("master url : "+this.getMasterPageUrl());
			//TODO 页面渲染
			this.pageContext.getServletContext().getRequestDispatcher(this.getMasterPageUrl()).include(this.pageContext.getRequest(), bufferedResponse);
			//System.out.println("master page content : "+bufferedResponse.getContent());
			out.write(bufferedResponse.getContent());
		}catch(ServletException e){
			e.printStackTrace();
		}catch(IOException e){
			e.printStackTrace();
		}
		return SKIP_PAGE;
	}
	
	/**
	 * 获取母版
	 * @return
	 */
	private String getMasterPageUrl(){
		return this.masterFolderPath+this.masterPageId+this.masetrPageSuffix;
	}
	
	private String masterPageId;
	public String getMasterPageId(){
		return masterPageId;
	}
	public void setMasterPageId(String masterPageId){
		this.masterPageId = masterPageId;
	}
	
	
	
}
