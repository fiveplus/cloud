package com.cloud.controller.bo;

import java.util.Date;


public class StatBO  {
	private Date name;
	private Long count;
	public Date getName() {
		return name;
	}
	public void setName(Date name) {
		this.name = name;
	}
	public Long getCount() {
		return count;
	}
	public void setCount(Long count) {
		this.count = count;
	}
	public StatBO(){
		
	}
	public StatBO(Date name,Long count){
		this.name = name;
		this.count = count;
	}
}
