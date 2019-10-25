package com.cinema.common.service;

import java.util.List;
import java.util.Map;

import com.cinema.common.model.MapItem;

public interface MapService {
	//得到地图标题栏信息
	MapItem getMapTitle(Map<String, Object> paraMap);
	//得到地图标题栏影片总数
	int getMapTitleFilms(Map<String, Object> paraMap);
	//得到地图标题栏信息
	int getMapTitleExceptions(Map<String, Object> paraMap);
	// 获得地图的影院数据
	List<MapItem> getCinemaData(Map<String, Object> paraMap);
	// 获得地图的省份数据 
	List<MapItem> getProvinceData(Map<String, Object> paraMap);
	//获得地图的城市数据
	List<MapItem> getCityData(Map<String, Object> paraMap);
	
}
