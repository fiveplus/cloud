package com.cloud.entity;

import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name="TBL_PRAISE")
public class Praise {
	private Integer id;
	private Integer contentId;
	private Integer userId;
	private Long createTime;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getContentId() {
		return contentId;
	}
	public void setContentId(Integer contentId) {
		this.contentId = contentId;
	}
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	public Long getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Long createTime) {
		this.createTime = createTime;
	}
	
}
