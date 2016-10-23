package com.cloud.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name = "SYS_PERMISSION")
public class Permission implements Serializable{
	private String id;
	private String name;
	private String parentId;
	private String status;
	private int menuIndex;
	private String imageURL;
	private String url;
	private Long createTime;
	private String className;
	
	private String isMenu;
	
	private int flag = -1;
	
	@Id
	@Column(name = "ID", unique = true, nullable = false)
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
	@Column(name = "NAME")
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	@Column(name = "PARENT_ID")
	public String getParentId() {
		return parentId;
	}
	public void setParentId(String parentId) {
		this.parentId = parentId;
	}
	
	@Column(name = "STATUS")
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
	@Column(name = "MENU_INDEX")
	public int getMenuIndex() {
		return menuIndex;
	}
	public void setMenuIndex(int menuIndex) {
		this.menuIndex = menuIndex;
	}
	
	@Column(name = "IMAGE_URL")
	public String getImageURL() {
		return imageURL;
	}
	public void setImageURL(String imageURL) {
		this.imageURL = imageURL;
	}
	
	@Column(name = "URL")
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public void setCreateTime(Long createTime) {
		this.createTime = createTime;
	}
	
	@Column(name = "CREATE_TIME")
	public Long getCreateTime() {
		return createTime;
	}
	public void setIsMenu(String isMenu) {
		this.isMenu = isMenu;
	}
	
	@Column(name = "IS_MENU")
	public String getIsMenu() {
		return isMenu;
	}
	public void setFlag(int flag) {
		this.flag = flag;
	}
	@Transient
	public int getFlag() {
		return flag;
	}
	public void setClassName(String className) {
		this.className = className;
	}
	
	@Column(name = "CLASS_NAME")
	public String getClassName() {
		return className;
	}
}
