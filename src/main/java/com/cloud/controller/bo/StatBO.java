package com.cloud.controller.bo;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name="bo_stat")
public class StatBO  {
	@Column
	private String column;
	@Column
	private Long count;
	public String getColumn() {
		return column;
	}
	public void setColumn(String column) {
		this.column = column;
	}
	public Long getCount() {
		return count;
	}
	public void setCount(Long count) {
		this.count = count;
	}
	public StatBO(){
		
	}
	public StatBO(String column,Long count){
		this.column = column;
		this.count = count;
	}
}
