package com.cinema.sys.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.cinema.sys.model.Menu;
import com.cinema.sys.model.base.TMenu;

import tk.mybatis.mapper.common.Mapper;
import tk.mybatis.mapper.common.MySqlMapper;

public interface MenuMapper   extends Mapper<TMenu>,MySqlMapper<TMenu> {
		
    Menu getDetail(String menuId);
    
	List<Menu> getListByAuth(@Param("authLevel") String authLevel,@Param("authCodes") String authCodes);
	
	List<Menu> getTopList();
	
	List<Menu> getChildList(String pid);
	
	List<Menu> getAllMenus();

	Integer getMaxCseq(String pid);
	
	Boolean exist(@Param("menuid") String menuid,@Param("name") String name);
	
	Menu getMenuByid(String id);
	
	List<Menu> getMenuBypid(String pid);
}