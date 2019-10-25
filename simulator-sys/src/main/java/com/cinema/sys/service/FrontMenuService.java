package com.cinema.sys.service;

import java.util.List;

import com.alibaba.fastjson.JSONArray;
import com.cinema.sys.model.FrontMenu;
import com.cinema.sys.model.base.TFrontMenu;

public interface FrontMenuService {
	public int delete(String menuid);
	
	public int insert(TFrontMenu t);
	
	public int update(TFrontMenu t) ;
	
	public FrontMenu getDetail(String menuid);
	
	List<FrontMenu> getTreeList(List<String> authCodeArray);
	
	List<FrontMenu> getTreeLists();
		
	List<FrontMenu> getAllMenu();
	
	/**
	 * 更新排序
	 * @param array
	 */
	void updateCseq(JSONArray array);
	
	int getMaxCseq(String pid);
	
	boolean exist(String menuId, String name);


	List<FrontMenu> getListByUserAuth(String userId, boolean isAdmin, String authCodes);

	FrontMenu getMenuByid(String id);
	
	List<FrontMenu> getMenuByPid(String pid);
}
