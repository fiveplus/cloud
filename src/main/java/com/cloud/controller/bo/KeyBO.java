package com.cloud.controller.bo;

public class KeyBO {
	private String name;
	private Long count;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Long getCount() {
		return count;
	}
	public void setCount(Long count) {
		this.count = count;
	}
	
	public KeyBO(){
	}
	
	public KeyBO(String name,Long count){
		this.name = name;
		this.count = count;
	}
	
}
