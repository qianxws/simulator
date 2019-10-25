package com.cinema.sys.model;

import java.util.List;

import com.cinema.sys.model.base.TMenu;

public class Menu extends TMenu{
	
	private String creatorName;
    
    private boolean isIsParent ;

	private List<Menu> menuList;
	
	public String getCreatorName() {
		return creatorName;
	}

	public void setCreatorName(String creatorName) {
		this.creatorName = creatorName;
	}
	
    public boolean isIsParent() {
		return isIsParent;
	}

	public void setIsParent(boolean isIsParent) {
		this.isIsParent = isIsParent;
	}
	
	public List<Menu> getMenuList() {
		return menuList;
	}

	public void setMenuList(List<Menu> menuList) {
		this.menuList = menuList;
	}

}