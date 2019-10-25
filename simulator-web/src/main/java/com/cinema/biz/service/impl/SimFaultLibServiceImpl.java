package com.cinema.biz.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cinema.biz.dao.SimFaultLibMapper;
import com.cinema.biz.model.SimFaultLib;
import com.cinema.biz.model.base.TSimFaultLib;
import com.cinema.biz.service.SimFaultLibService;

@Service
public class SimFaultLibServiceImpl implements SimFaultLibService {

	@Autowired
    private SimFaultLibMapper simFaultLibDao;

	/**列表*/
	@Override
	public List<SimFaultLib> getList(Map<String, Object> paraMap) {
		return simFaultLibDao.getList(paraMap);
	}

	/**详情*/
	@Override
	public SimFaultLib getDetail(Map<String, Object> paraMap) {
		return simFaultLibDao.getDetail(paraMap);
	}

	/**添加*/
	@Override
	public int insert(TSimFaultLib t) {
		return simFaultLibDao.insertSelective(t);
	}

	/**更新*/
	@Override
	public int update(TSimFaultLib t) {
		return simFaultLibDao.updateByPrimaryKeySelective(t);
	}

	/**删除*/
	@Override
	public int delete(String faultLibId) {
		return simFaultLibDao.deleteByPrimaryKey(faultLibId);
	}
}
