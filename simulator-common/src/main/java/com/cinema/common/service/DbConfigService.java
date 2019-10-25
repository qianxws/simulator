package com.cinema.common.service;

import java.util.List;
import java.util.Map;

import com.alibaba.fastjson.JSONObject;
import com.cinema.common.model.DbConfig;
import com.cinema.common.model.base.TDbConfig;

public interface DbConfigService {
	
	public JSONObject getList(Map<String, Object> paraMap);
	
	public DbConfig getDetail(String companyId);
	
	public List<DbConfig> getAll();
	
	public int update(TDbConfig t) ;
	
	public int insert(TDbConfig t);
	
	public int delete(String DbConfigId);
	
	/**
	 * 获取所有院线
	 */
	public  List<DbConfig> getAllDbConfig();
	
	//boolean isNotExist(String companyId, String name);
	
	/**
	 * 判断是否有从数据库
	 */
	Boolean isNotExist();
}
