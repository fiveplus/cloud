package com.cloud.controller.bo;

import java.util.List;

import com.cloud.entity.User;


public class GroupBO {
	private Integer id;
	private String name;
	private List<User> users;
	private List<GroupBO> childs;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public List<User> getUsers() {
		return users;
	}
	public void setUsers(List<User> users) {
		this.users = users;
	}
	public void setChilds(List<GroupBO> childs) {
		this.childs = childs;
	}
	public List<GroupBO> getChilds() {
		return childs;
	}
	
	public GroupBO(Integer id,String name,List<User> users,List<GroupBO> childs){
		this.id = id;
		this.name = name;
		this.users = users;
		this.childs = childs;
	}
	public GroupBO(Integer id,String name,List<User> users){
		this.id = id;
		this.name = name;
		this.users = users;
	}
}
