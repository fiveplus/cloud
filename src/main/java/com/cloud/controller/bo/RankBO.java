package com.cloud.controller.bo;

public class RankBO {
	private String deptName;
	private String themeName;
	private Long count;
	public String getDeptName() {
		return deptName;
	}
	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}
	public String getThemeName() {
		return themeName;
	}
	public void setThemeName(String themeName) {
		this.themeName = themeName;
	}
	public Long getCount() {
		return count;
	}
	public void setCount(Long count) {
		this.count = count;
	}
	
	public RankBO(){
	}

	public RankBO(String deptName,String themeName,Long count){
		this.deptName = deptName;
		this.themeName = themeName;
		this.count = count;
	}
	
}
