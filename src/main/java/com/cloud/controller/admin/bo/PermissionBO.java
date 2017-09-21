package com.cloud.controller.admin.bo;

import java.util.List;

import com.cloud.entity.Permission;

public class PermissionBO {
	private Permission permission;
	private List<Permission> pers;
	public Permission getPermission() {
		return permission;
	}
	public void setPermission(Permission permission) {
		this.permission = permission;
	}
	public List<Permission> getPers() {
		return pers;
	}
	public void setPers(List<Permission> pers) {
		this.pers = pers;
	}
}
