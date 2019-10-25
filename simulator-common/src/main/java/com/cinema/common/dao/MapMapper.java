package com.cinema.common.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.cinema.common.model.MapItem;

public interface MapMapper{
    //得到地图标题栏信息
	MapItem getMapTitle(@Param("paraMap") Map<String, Object> paraMap);
	//得到地图标题栏影片总数
	int getMapTitleFilms(@Param("paraMap") Map<String, Object> paraMap);
    //得到地图标题栏异常数
	Integer getMapTitleExceptions(@Param("paraMap") Map<String, Object> paraMap);
	// 获得地图的省份数据 
	List<MapItem> getProvinceData(@Param("paraMap") Map<String, Object> paraMap);
	//获得地图的城市数据
	List<MapItem> getCityData(@Param("paraMap") Map<String, Object> paraMap);
	// 获得地图的影院数据
	List<MapItem> getCinemaData(@Param("paraMap") Map<String, Object> paraMap);

}