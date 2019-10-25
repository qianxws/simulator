package com.cinema.sys.model;

public class UserSessionItems implements java.io.Serializable {

	private static final long serialVersionUID = -2664497757926794819L;

	// 登录信息
	private User user;
	// 所有权限字符串
	private String authCodes;
	// 是否为超级管理员
	private Boolean isAdmin = false;

	private String authLevel;

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
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
