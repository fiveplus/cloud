package com.cloud.tag.master;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.BodyTagSupport;

public class ContentTag extends BodyTagSupport{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public int doAfterBody() throws JspException {
		return SKIP_BODY;
	}
	
	public int doStartTag() throws JspException {
		return EVAL_BODY_BUFFERED;
	}
	
	public int doEndTag() throws JspException {
		String content = this.bodyContent.getString();
		try{
			this.pageContext.getRequest().setAttribute(this.getContentPlaceHolderId(), content);
			this.bodyContent.clear();
		}catch(Exception e){
			e.printStackTrace();
		}
		return EVAL_PAGE;
	}
	
	private String contentPlaceHolderId;
	public String getContentPlaceHolderId(){
		return contentPlaceHolderId;
	}
	
	public void setContentPlaceHolderId(String contentPlaceHolderId){
		this.contentPlaceHolderId = contentPlaceHolderId;
	}
	
	
}
