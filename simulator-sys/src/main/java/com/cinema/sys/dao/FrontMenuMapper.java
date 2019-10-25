package com.cinema.sys.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.cinema.sys.model.FrontMenu;
import com.cinema.sys.model.base.TFrontMenu;

import tk.mybatis.mapper.common.Mapper;
import tk.mybatis.mapper.common.MySqlMapper;

public interface FrontMenuMapper extends Mapper<TFrontMenu>,MySqlMapper<TFrontMenu> {
		
    FrontMenu getDetail(String menuId);
    
	List<FrontMenu> getAllList(@Param("condition") String condition,@Param("authCodes") String authCodes);
	
	List<FrontMenu> getTopList();
	
	List<FrontMenu> getChildList(String pid);
	
	List<FrontMenu> getAllMenus();

	Integer getMaxCseq(String pid);
	
	/**
	 * 是否存在
	 * @return
	 */
	Boolean exist(@Param("menuid") String menuid,@Param("name") String name);
	
	FrontMenu getMenuByid(String id);
	List<FrontMenu> getMenuBypid(String pid);
}