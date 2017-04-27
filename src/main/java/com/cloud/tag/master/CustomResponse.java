package com.cloud.tag.master;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.StringWriter;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletResponseWrapper;

public class CustomResponse extends HttpServletResponseWrapper{
	private StringWriter strWritter = new StringWriter();
	private PrintWriter out = new PrintWriter(strWritter);
	
	public CustomResponse(HttpServletResponse response) {
		super(response);
	}
	
	public PrintWriter getWriter() throws IOException {
		return out;
	}
	
	public String getContent(){
		return strWritter.toString();
	}
	
}
