package com.cinema.biz.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cinema.biz.dao.SimAddLogMapper;
import com.cinema.biz.model.SimAddLog;
import com.cinema.biz.model.base.TSimAddLog;
import com.cinema.biz.service.SimAddLogService;

@Service
public class SimAddLogServiceImpl implements SimAddLogService {

	@Autowired
    private SimAddLogMapper simAddLogDao;

	/**列表*/
	@Override
	public List<SimAddLog> getList(Map<String, Object> paraMap) {
		return simAddLogDao.getList(paraMap);
	}

	/**添加*/
	@Override
	public int insert(TSimAddLog t) {
		return simAddLogDao.insertSelective(t);
	}

	/**更新*/
	@Override
	public int update(TSimAddLog t) {
		return simAddLogDao.updateByPrimaryKeySelective(t);
	}

	/**删除*/
	@Override
	public int delete(String deviceId) {
		return simAddLogDao.deleteByPrimaryKey(deviceId);
	}
}
