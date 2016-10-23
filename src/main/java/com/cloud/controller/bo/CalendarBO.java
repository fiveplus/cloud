package com.cloud.controller.bo;

public class CalendarBO {
	private int id;
	private String userName;
	private String start;
	private String end;
	private String title;
	private String body;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getStart() {
		return start;
	}
	public void setStart(String start) {
		this.start = start;
	}
	public String getEnd() {
		return end;
	}
	public void setEnd(String end) {
		this.end = end;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getBody() {
		return body;
	}
	public void setBody(String body) {
		this.body = body;
	}
	
	public CalendarBO(){
		
	}
	
	public CalendarBO(int id,String userName,String start,String end,String title,String body){
		this.id = id;
		this.userName = userName;
		this.start = start;
		this.end = end;
		this.title = title;
		this.body = body;
	}
	
}
