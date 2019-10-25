package com.cinema.sys.model;

import com.cinema.sys.model.base.TLog;

public class Log extends TLog {
	private String userName;
    public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}
}