package com.cloud.entity;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Transient;


@Entity
@Table(name = "TBL_USER")
public class User implements Serializable{
	private Integer id;
	private String loginName;
	private String username;
	private String password;
	private String portrait;
	
	private String post;
	
	private Long createTime;
	
	private String mobile;
	
	private Department dept;
	
	private List<Permission> pers;
	
	private Group group;
	
	private int messageCount;
	
	private Level level;
	
	private String status;
	
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "ID", unique = true, nullable = false)
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	
	@Column(name = "LOGIN_NAME")
	public String getLoginName() {
		return loginName;
	}
	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}
	
	
	@Column(name = "PASSWORD")
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	@Column(name = "PORTRAIT")
	public String getPortrait() {
		if(portrait == null || "".equals(portrait)) portrait = "images/default.jpg";
		return portrait;
	}
	
	public void setPortrait(String portrait) {
		this.portrait = portrait;
	}
	
	@Column(name = "CREATE_TIME")
	public Long getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Long createTime) {
		this.createTime = createTime;
	}
	
	@Column(name = "MOBILE")
	public String getMobile() {
		return mobile;
	}
	
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	
	public void setUsername(String username) {
		this.username = username;
	}
	
	@Column(name = "USER_NAME")
	public String getUsername() {
		return username;
	}
	
	
	public void setDept(Department dept) {
		this.dept = dept;
	}
	
	@OneToOne
	@JoinColumn(name="DEPT_ID")
	public Department getDept() {
		return dept;
	}
	
	@Transient
	public List<Permission> getPers() {
		return pers;
	}
	public void setPers(List<Permission> pers) {
		this.pers = pers;
	}
	public void setGroup(Group group) {
		this.group = group;
	}
	
	@OneToOne
	@JoinColumn(name="GROUP_ID")
	public Group getGroup() {
		return group;
	}
	
	public void setPost(String post) {
		this.post = post;
	}
	
	@Column(name = "POST")
	public String getPost() {
		return post;
	}
	
	@Transient
	public int getMessageCount() {
		return messageCount;
	}
	public void setMessageCount(int messageCount) {
		this.messageCount = messageCount;
	}
	
	@OneToOne
	@JoinColumn(name="LEVEL_ID")
	public Level getLevel() {
		return level;
	}
	public void setLevel(Level level) {
		this.level = level;
	}
	
	@Column(name = "STATUS")
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
	
}	
