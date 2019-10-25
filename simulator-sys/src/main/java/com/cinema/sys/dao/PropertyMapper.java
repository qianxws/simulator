package com.cinema.sys.dao;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.alibaba.fastjson.JSONObject;
import com.cinema.sys.model.Property;

public interface PropertyMapper{
   
	/**
	 * 获取属性
	 */
	public List<Property> getAllList(@Param("type")String type);
	
	/**
	 * 获取属性
	 */
	public List<Property> getDeviceProperties(@Param("type")String type);
	
	 /**
	 * 查询属性列表分页
	 */
    public List<Property> getList(@Param("paraMap") Map<String, Object> paraMap);
	public int getTotal(@Param("paraMap") Map<String, Object> paraMap);
	
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
	public   List<Property> checkProerty(@Param("paraMap") Map<String, Object> paraMap);

	/**
	 * 保存任意类型tmode
	 * 
	 * @param o
	 * @return
	 */
	void insert(Property m);
	
	
	/**
	 * 更新数据库对象
	 * 
	 * @param obj
	 */
	void update(Property m);

	/**
	 * 删除指定对象
	 * 
	 * @param o
	 */
	void delete(@Param("type") String type,@Param("id") String id);
	
	
	/**
	 * 判断name不存在
	 * 
	 * @param o
	 */
	Boolean isNotExist(@Param("type") String type,@Param("id") String id,@Param("name") String name);
	
	/**
	 * 通过主键获得对象
	 * 
	 * @param c
	 *            类名.class
	 * @param id
	 *            主键
	 * @return 对象
	 */
	@SuppressWarnings("hiding")
	public <T> T get(Class<T> c, Serializable id);
}