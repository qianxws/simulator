package com.cinema.common.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.cinema.common.model.Layout;
import com.cinema.common.model.base.TLayout;

import tk.mybatis.mapper.common.Mapper;
import tk.mybatis.mapper.common.MySqlMapper;

public interface LayoutMapper   extends Mapper<TLayout>,MySqlMapper<TLayout>{
	
    Layout getDetail(@Param("layoutId") String layoutId);
    
	void deleteByUserId(@Param("userId") String userId,@Param("page") String page);
	/**
	 * 获取布局列表
	 * @param userId
	 * @return
	 */
	List<Layout> getList(@Param("userId") String userId,@Param("page") String page);



}