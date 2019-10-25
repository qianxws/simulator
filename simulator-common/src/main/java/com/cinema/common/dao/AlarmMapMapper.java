package com.cinema.common.dao;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.cinema.common.model.MapItem;

public interface AlarmMapMapper {

	/**
	 *后台管理  获得影院的统计数量
	 * @return
	 */
	MapItem getMapTitle();
	
	/**
	 * 后台管理 获得全部省的地图数据
	 * @return
	 */
	List<MapItem> getProvinceData(@Param("date")Date date);
	
	/**
	 * 后台管理 获得全部市的地图数据
	 * @return
	 */
	List<MapItem> getCityData(@Param("provinceId")String provinceId,@Param("beforDate") Date beforDate);
	
	/**
	 * 后台管理 获得全部影院信息
	 * @return
	 */
	List<MapItem> getCinemaData(@Param("provinceId")String provinceId);


}