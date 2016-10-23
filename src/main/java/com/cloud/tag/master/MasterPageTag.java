package com.cloud.tag.master;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.BodyContent;
import javax.servlet.jsp.tagext.BodyTagSupport;
/**
 * JAVA MASTER PAGE
 * @author zhangshenwu
 *
 */
public class MasterPageTag extends BodyTagSupport{

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
		JspWriter out = pageContext.getOut();
		if(bodyContent != null){
			if(out instanceof BodyContent){
				out = ((BodyContent)out).getEnclosingWriter();
			}
		}
		String content = this.bodyContent.getString();
		try{
			this.bodyContent.clear();
			out.write(content);
		}catch(Exception e){
			e.printStackTrace();
		}
		return SKIP_PAGE; //不执行标签之后的内容
	}
	
}
