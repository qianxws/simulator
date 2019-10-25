package com.cinema.sys.model;


import java.util.List;

import com.cinema.sys.model.base.TDictionary;

public class Dictionary extends TDictionary{
	
	
	private List<Dictionary> childDic;

	public List<Dictionary> getChildDic() {
		return childDic;
	}

	public void setChildDic(List<Dictionary> childDic) {
		this.childDic = childDic;
	}

	
}