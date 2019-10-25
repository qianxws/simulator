package com.cinema.biz.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cinema.biz.dao.SimLogConfigMapper;
import com.cinema.biz.model.SimLogConfig;
import com.cinema.biz.model.base.TSimLogConfig;
import com.cinema.biz.service.SimLogConfigService;

@Service
public class SimLogConfigServiceImpl implements SimLogConfigService {

	@Autowired
    private SimLogConfigMapper simLogConfigDao;

	/**列表*/
	@Override
	public List<SimLogConfig> getList(Map<String, Object> paraMap) {
		return simLogConfigDao.getList(paraMap);
	}

	/**详情*/
	@Override
	public SimLogConfig getDetail(Map<String, Object> paraMap) {
		return simLogConfigDao.getDetail(paraMap);
	}

	/**添加*/
	@Override
	public int insert(TSimLogConfig t) {
		return simLogConfigDao.insertSelective(t);
	}

	/**更新*/
	@Override
	public int update(TSimLogConfig t) {
		return simLogConfigDao.updateByPrimaryKeySelective(t);
	}

	/**删除*/
	@Override
	public int delete(String typeFieldId) {
		return simLogConfigDao.deleteByPrimaryKey(typeFieldId);
	}
}
