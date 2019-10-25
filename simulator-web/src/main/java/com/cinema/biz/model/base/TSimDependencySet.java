package com.cinema.biz.model.base;

import com.cinema.biz.model.SimDependency;

public class TSimDependencySet extends SimDependency {
    private String dependencyName;

	public String getDependencyName() {
		return dependencyName;
	}

	public void setDependencyName(String dependencyName) {
		this.dependencyName = dependencyName;
	}


}