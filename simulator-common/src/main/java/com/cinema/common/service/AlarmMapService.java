package com.cinema.common.service;

import java.util.List;

import com.alibaba.fastjson.JSONObject;
import com.cinema.common.model.MapItem;

public interface AlarmMapService {
	
	/**
	 * 获得影院的统计数量
	 * 
	 * @return
	 */
	JSONObject getMapTitle();
	
	/**
	 * 获得全部省的地图数据
	 * 
	 * @return
	 */
	List<MapItem> getProvinceData();
	
	/**
	 * 获得全部市的地图数据
	 * 
	 * @return
	 */
	List<MapItem> getCityData(String provinceId);

	/**
	 * 获得全部影院信息
	 * 
	 * @return
	 */
	List<MapItem> getCinemaData(String provinceId);

}
