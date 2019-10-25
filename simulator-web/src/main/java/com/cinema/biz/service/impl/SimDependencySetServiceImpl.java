package com.cinema.biz.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cinema.biz.dao.SimDependencySetMapper;
import com.cinema.biz.model.SimDependencySet;
import com.cinema.biz.model.base.TSimDependencySet;
import com.cinema.biz.service.SimDependencySetService;

@Service
public class SimDependencySetServiceImpl implements SimDependencySetService {

	@Autowired
    private SimDependencySetMapper simDependencySetDao;

	/**列表*/
	@Override
	public List<SimDependencySet> getList(Map<String, Object> paraMap) {
		return simDependencySetDao.getList(paraMap);
	}

	/**详情*/
	@Override
	public SimDependencySet getDetail(Map<String, Object> paraMap) {
		return simDependencySetDao.getDetail(paraMap);
	}

	/**添加*/
	@Override
	public int insert(TSimDependencySet t) {
		return simDependencySetDao.insertSelective(t);
	}

	/**更新*/
	@Override
	public int update(TSimDependencySet t) {
		return simDependencySetDao.updateByPrimaryKeySelective(t);
	}

	/**删除*/
	@Override
	public int delete(String deviceId) {
		return simDependencySetDao.deleteByPrimaryKey(deviceId);
	}
}
