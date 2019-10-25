package com.cinema.sys.model;

import java.util.List;

import com.cinema.sys.model.base.TFrontMenu;

public class FrontMenu extends TFrontMenu{
	
	private String icon;
    
    public String getIcon() {
        return icon;
    }

    public void setIcon(String icon) {
        this.icon = icon == null ? null : icon.trim();
    }
    
	private boolean isIsParent ;
	
    public boolean isIsParent() {
		return isIsParent;
	}

	public void setIsParent(boolean isIsParent) {
		this.isIsParent = isIsParent;
	}
	private String creatorName;
	
	private List<FrontMenu> menuList;
	
	public String getCreatorName() {
		return creatorName;
	}

	public void setCreatorName(String creatorName) {
		this.creatorName = creatorName;
	}

	public List<FrontMenu> getMenuList() {
		return menuList;
	}

	public void setMenuList(List<FrontMenu> menuList) {
		this.menuList = menuList;
	}

}