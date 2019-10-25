package com.cinema.sys.service;

import java.util.List;

import com.alibaba.fastjson.JSONArray;
import com.cinema.sys.model.Menu;
import com.cinema.sys.model.base.TMenu;

public interface MenuService {
public int delete(String menuid);
	
	public int insert(TMenu t);
	
	public int update(TMenu t) ;
	
	public Menu getDetail(String menuid);
	
	List<Menu> getTreeList();
	List<Menu> getTreeLists();
	
	
	List<Menu> getAllMenu();
	
	/**
	 * 更新排序
	 * @param array
	 */
	void updateCseq(JSONArray array);
	
	int getMaxCseq(String pid);
	
	boolean exist(String menuId, String name);


	List<Menu> getListByAuth(String authLevel,String authCodes);

	Menu getMenuByid(String id);
	
	List<Menu> getMenuByPid(String pid);
}
