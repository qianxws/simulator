package com.cinema.common.service;

import java.util.List;
import java.util.Map;

import com.alibaba.fastjson.JSONArray;
import com.cinema.common.model.Layout;

public interface LayoutService {
	
	/**
	 * 删除用户默认布局
	 * 
	 * @param userId
	 *            ：用户id
	 * @param page
	 *            ：页面
	 */
	void deleteByUserId(String userId, String page);
	

	/**
	 * 保存首页布局
	 * 
	 * @param jsonArray
	 *            :布局
	 * @param userId
	 *            ：用户id
	 */
	void saveHomeLayout(JSONArray jsonArray, String userId);

	/**
	 * 保存票房信息页面布局
	 * 
	 * @param jsonArray
	 * @param userId
	 */
	void saveTicketInfoLayout(JSONArray jsonArray, String userId);
	
	/**
	 * 获得首页页面布局
	 * @param userId
	 * @return
	 */
	List<Layout> getHomeLayout(String userId);

	/**
	 * 获得票房信息页面布局
	 * 
	 * @param userId
	 * @return
	 */
	List<Map<String, List<Layout>>> getTicketInfoLayout(String userId);



}
