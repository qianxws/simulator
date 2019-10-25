package com.cinema.biz.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cinema.biz.dao.SimSimulatorMapper;
import com.cinema.biz.model.SimSimulator;
import com.cinema.biz.model.base.TSimSimulator;
import com.cinema.biz.service.SimSimulatorService;

@Service
public class SimSimulatorServiceImpl implements SimSimulatorService {

	@Autowired
    private SimSimulatorMapper simSimulatorDao;

	/**列表*/
	@Override
	public List<SimSimulator> getList(Map<String, Object> paraMap) {
		return simSimulatorDao.getList(paraMap);
	}

	/**添加*/
	@Override
	public int insert(TSimSimulator t) {
		return simSimulatorDao.insertSelective(t);
	}

	/**更新*/
	@Override
	public int update(TSimSimulator t) {
		return simSimulatorDao.updateByPrimaryKeySelective(t);
	}

	/**删除*/
	@Override
	public int delete(String simulatorId) {
		return simSimulatorDao.deleteByPrimaryKey(simulatorId);
	}
}
