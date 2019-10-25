package com.cinema.sys.model;

import java.io.Serializable;

import com.cinema.sys.model.base.TUser;

public class User extends TUser implements Serializable {

	private static final long serialVersionUID = 1L;
    
	private String companyName;

	private String creatorName;
	
    private String updatorName;

	public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}
	
	public String getCreatorName() {
		return creatorName;
	}

	public void setCreatorName(String creatorName) {
		this.creatorName = creatorName;
	}

	public String getUpdatorName() {
		return updatorName;
	}

	public void setUpdatorName(String updatorName) {
		this.updatorName = updatorName;
	}
}