package com.cinema.common.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSONObject;
import com.cinema.common.dao.DbConfigMapper;
import com.cinema.common.model.DbConfig;
import com.cinema.common.model.base.TDbConfig;
import com.cinema.common.service.DbConfigService;

@Service
public class DbConfigServiceImpl implements DbConfigService {
	
	@Autowired  
    private DbConfigMapper DbConfigDao;

	@Override
	public JSONObject getList(Map<String, Object> paraMap) {
		JSONObject json = new JSONObject();
		json.put("list",DbConfigDao.getList(paraMap));
		json.put("total", DbConfigDao.getTotal(paraMap));

		return json;
	}
	
	@Override
    public DbConfig getDetail(String DbConfigId) {  
        return DbConfigDao.getDetail(DbConfigId);
    }
	
	@Override
	public int update(TDbConfig t) {
		return DbConfigDao.updateByPrimaryKeySelective(t);
	}

	@Override
	public int insert(TDbConfig t) {
		return DbConfigDao.insertSelective(t);
	}

	@Override
	public int delete(String DbConfigId) {
		return DbConfigDao.deleteByPrimaryKey(DbConfigId);
	}

	@Override
	public List<DbConfig> getAllDbConfig() {
		return DbConfigDao.getAllDbConfigs();
	}

	@Override
	public List<DbConfig> getAll() {
		return DbConfigDao.getAll();
	}

	/**
	 * 判断是否有从数据库
	 */
	@Override
	public Boolean isNotExist() {
		//查询表中从数据库的个数
		if(DbConfigDao.countDbConfig()>0) {
			return true;
		}
		return false;
	}
	
	/*@Override
	public boolean isNotExist(String DbConfigId, String name) {
		Boolean isNotExist=DbConfigDao.isNotExist(DbConfigId, name);
		return isNotExist==null?true:isNotExist;
	}*/



}
