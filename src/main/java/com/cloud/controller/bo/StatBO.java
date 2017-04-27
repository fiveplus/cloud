package com.cloud.controller.bo;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

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
