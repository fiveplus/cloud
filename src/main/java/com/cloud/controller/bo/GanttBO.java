package com.cloud.controller.bo;

import java.io.Serializable;


public class GanttBO implements Serializable{
	private String name;
	private String desc;
	private Value values;
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDesc() {
		return desc;
	}
	public void setDesc(String desc) {
		this.desc = desc;
	}
	public Value getValues() {
		return values;
	}
	public void setValues(Value values) {
		this.values = values;
	}
	
	public GanttBO(String name,String desc,Value values){
		this.name = name;
		this.desc = desc;
		this.values = values;
	}
	
	@Override
	public String toString() {
		String value = "{" +
			"\"name\":\""+this.name+"\"," +
			"\"desc\":\""+this.desc+"\"," +
			"\"values\":"+this.values.toString() +
		"}";
		return value;
	}
}
