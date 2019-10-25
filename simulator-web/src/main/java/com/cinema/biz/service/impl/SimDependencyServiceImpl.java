package com.cinema.biz.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cinema.biz.dao.SimDependencyMapper;
import com.cinema.biz.model.SimDependency;
import com.cinema.biz.model.base.TSimDependency;
import com.cinema.biz.service.SimDependencyService;

@Service
public class SimDependencyServiceImpl implements SimDependencyService {

	@Autowired
    private SimDependencyMapper simDependencyDao;

	/**列表*/
	@Override
	public List<SimDependency> getList(Map<String, Object> paraMap) {
		return simDependencyDao.getList(paraMap);
	}

	/**详情*/
	@Override
	public SimDependency getDetail(Map<String, Object> paraMap) {
		return simDependencyDao.getDetail(paraMap);
	}

	/**添加*/
	@Override
	public int insert(TSimDependency t) {
		return simDependencyDao.insertSelective(t);
	}

	/**更新*/
	@Override
	public int update(TSimDependency t) {
		return simDependencyDao.updateByPrimaryKeySelective(t);
	}

	/**删除*/
	@Override
	public int delete(String dependencyId) {
		return simDependencyDao.deleteByPrimaryKey(dependencyId);
	}
}
