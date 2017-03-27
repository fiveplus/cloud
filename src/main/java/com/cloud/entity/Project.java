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
@Table(name = "TBL_PROJECT")
public class Project implements Serializable{
	private Integer id;
	private String name;
	private User leader;
	private Long createTime;
	private int index;
	private String info;
	private String status;
	
	
	private User user;
	
	private List<User> users;
	
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "ID", unique = true, nullable = false)
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	
	@Column(name = "NAME")
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	@Column(name = "CREATE_TIME")
	public Long getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Long createTime) {
		this.createTime = createTime;
	}
	
	@Column(name = "PROJECT_INDEX")
	public int getIndex() {
		return index;
	}
	public void setIndex(int index) {
		this.index = index;
	}
	
	public void setInfo(String info) {
		this.info = info;
	}
	
	@Column(name = "INFO")
	public String getInfo() {
		return info;
	}
	
	public void setLeader(User leader) {
		this.leader = leader;
	}
	
	@OneToOne
	@JoinColumn(name="LEADER")
	public User getLeader() {
		return leader;
	}
	
	public void setUser(User user) {
		this.user = user;
	}
	
	@OneToOne
	@JoinColumn(name="USER_ID")
	public User getUser() {
		return user;
	}
	
	@Column(name = "STATUS")
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
	@Transient
	public List<User> getUsers() {
		return users;
	}
	public void setUsers(List<User> users) {
		this.users = users;
	}
	
	
	
}
