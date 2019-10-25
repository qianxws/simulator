package com.cinema.biz.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cinema.biz.dao.SimThresholdMapper;
import com.cinema.biz.model.SimThreshold;
import com.cinema.biz.model.base.TSimThreshold;
import com.cinema.biz.service.SimThresholdService;

@Service
public class SimThresholdServiceImpl implements SimThresholdService {

	@Autowired
    private SimThresholdMapper simThresholdDao;

	/**列表*/
	@Override
	public List<SimThreshold> getList(Map<String, Object> paraMap) {
		return simThresholdDao.getList(paraMap);
	}

	/**详情*/
	@Override
	public SimThreshold getDetail(Map<String, Object> paraMap) {
		return simThresholdDao.getDetail(paraMap);
	}

	/**添加*/
	@Override
	public int insert(TSimThreshold t) {
		return simThresholdDao.insertSelective(t);
	}

	/**更新*/
	@Override
	public int update(TSimThreshold t) {
		return simThresholdDao.updateByPrimaryKeySelective(t);
	}

	/**删除*/
	@Override
	public int delete(String thresholdId) {
		return simThresholdDao.deleteByPrimaryKey(thresholdId);
	}
}
