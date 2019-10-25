package com.cinema.sys.model;

import java.util.List;

import com.cinema.sys.model.base.TAuth;

public class Auth extends TAuth {
	private List<Auth> childAuth;
    private String roleId;

	// 所有权限字符串
	private String authCodes;
	// 是否为超级管理员
	private Boolean isAdmin;

	private String authLevel;
	
	public String getRoleId() {
		return roleId;
	}

	public void setRoleId(String roleId) {
		this.roleId = roleId;
	}
	public List<Auth> getChildAuth() {
		return childAuth;
	}

	public void setChildAuth(List<Auth> childAuth) {
		this.childAuth = childAuth;
	}
    
	public String getAuthCodes() {
		return authCodes;
	}

	public void setAuthCodes(String authCodes) {
		this.authCodes = authCodes;
	}

	public Boolean getIsAdmin() {
		return isAdmin;
	}

	public void setIsAdmin(Boolean isAdmin) {
		this.isAdmin = isAdmin;
	}

	public String getAuthLevel() {
		return authLevel;
	}

	public void setAuthLevel(String authLevel) {
		this.authLevel = authLevel;
	}
}