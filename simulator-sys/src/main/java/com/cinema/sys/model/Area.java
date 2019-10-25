package com.cinema.sys.model;

import com.cinema.sys.model.base.TArea;

public class Area extends TArea {
	private Area parentArea;

	public Area getParentArea() {
		return parentArea;
	}

	public void setParentArea(Area parentArea) {
		this.parentArea = parentArea;
	}

}
