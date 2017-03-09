package com.cloud.controller.bo;

public class CalendarBO {
	private int id;
	private String start;
	private String end;
	private String title;
	
	public int getId() {
		return id;
	}
	
	public void setId(int id) {
		this.id = id;
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
	
	public CalendarBO(){
		
	}
	
	public CalendarBO(int id,String start,String end,String title){
		this.id = id;
		this.start = start;
		this.end = end;
		this.title = title;
	}
	
}
