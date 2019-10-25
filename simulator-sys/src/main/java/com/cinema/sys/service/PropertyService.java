package com.cinema.sys.service;

import java.util.List;
import java.util.Map;

import com.alibaba.fastjson.JSONObject;
import com.cinema.sys.model.Property;

public interface PropertyService {
	
	/**
	 * 获取所有属性
	 * @return
	 */
	public List<Property> getAllList(String type);
	
	/**
	 * 获取所有属性
	 * @return
	 */
	public JSONObject getDeviceProperties(String type);
	
	
	/**
	 * 分页获得属性
	 * 
	 * @param type
	 *            ：属性类型
	 * @param name
	 *            ：属性名称
	 * @param startTime
	 *            ：时间范围开始时间
	 * @param endTime
	 *            ：时间范围结束时间
	 * @param page
	 *            ：页码
	 * @param rows
	 *            ：每页显示数量
	 * @return
	 */
	JSONObject queryProperty(Map<String, Object> paraMap);
	
	/**
	 * 保存影片属性
	 * 
	 * @param type
	 *            ：属性类型
	 * @param name
	 *            ：属性名称
	 * @throws Exception
	 */
	void insert(Property m);

	/**
	 * 修改属性
	 * 
	 * @param id
	 *            ：属性id
	 * @param type
	 *            ：类型
	 * @param name
	 *            ：名称
	 * @throws Exception
	 */
	void update(Property m);

	/**
	 * 删除属性
	 * 
	 * @param id
	 *            ：属性id
	 * @param type
	 *            ：属性
	 * @throws Exception
	 */
	void delete(String type, String id);
	
	boolean isNotExist(String type, String id, String name);
	
	/**
	 * 验证设备属性是否重名(true:存在重名)
	 * 
	 * @param type
	 *            ：属性类型
	 * @param id
	 *            ：属性id
	 * @param name
	 *            ：属性名称
	 * @return
	 */
	Boolean checkProerty(Map<String, Object> paraMap);
}
