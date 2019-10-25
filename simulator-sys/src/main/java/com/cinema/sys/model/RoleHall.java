package com.cinema.sys.model;

import com.cinema.sys.model.base.TRoleHall;

public class RoleHall extends TRoleHall {

	private String id;
	private String name;
	private int hallNum;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getHallNum() {
		return hallNum;
	}
	public void setHallNum(int hallNum) {
		this.hallNum = hallNum;
	}
}