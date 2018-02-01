package com.cloud.tag.master;

import org.apache.log4j.Logger;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

public class ContentPlaceHolderTag extends TagSupport{

	private static final Logger LOGGER = Logger.getLogger(ContentPlaceHolderTag.class);

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	
	public int doEndTag() throws JspException {
		JspWriter out = pageContext.getOut();
		Object obj = this.pageContext.getRequest().getAttribute(this.getId());
		try{
			if(obj != null){
				out.write(obj.toString());
			}
		}catch(Exception e){
			LOGGER.error(e);
		}
		return EVAL_PAGE;
	}
	
}
