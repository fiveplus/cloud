package com.cloud.controller.bo;

public class TreeBO {
	private int id;
	private int pid;
	private String name;
	private boolean parent;
	private String portrait;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getPid() {
		return pid;
	}
	public void setPid(int pid) {
		this.pid = pid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public boolean getParent() {
		return parent;
	}
	public void setParent(boolean parent) {
		this.parent = parent;
	}
	public void setPortrait(String portrait) {
		this.portrait = portrait;
	}
	public String getPortrait() {
		return portrait;
	} 

	
	public TreeBO(int id,int pid,String name,boolean parent,String portrait){
		this.id = id;
		this.pid = pid;
		this.name = name;
		this.parent = parent;
		this.portrait = portrait;
	}
}
