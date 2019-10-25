package com.cinema.common.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.cinema.common.model.DbConfig;
import com.cinema.common.model.base.TDbConfig;

import tk.mybatis.mapper.common.Mapper;
import tk.mybatis.mapper.common.MySqlMapper;

public interface DbConfigMapper  extends Mapper<TDbConfig>,MySqlMapper<TDbConfig> {
	
    DbConfig getDetail(String DbConfigId);
    
	public List<DbConfig> getList(@Param("paraMap") Map<String, Object> paraMap);
	public int getTotal(@Param("paraMap") Map<String, Object> paraMap);

	public List<DbConfig>  getAll();
	
	/**
	 * 通过院线名称获得院线id
	 * @return
	 */
	
	String getDbConfigIdByName(String name);
	
	/**
	 * 获取所有院线
	 */
	public  List<DbConfig> getAllDbConfigs();
	/**
	 * 判断name不存在
	 * 
	 * @param 
	 */
	Boolean isNotExist(@Param("DbConfigId") String DbConfigId,@Param("name") String name);
	/**
	 * 查询表中是否有数据
	 */
	int countDbConfig();

}