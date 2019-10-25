package com.cinema.biz.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cinema.biz.dao.SimTypeMapper;
import com.cinema.biz.model.SimType;
import com.cinema.biz.model.base.TSimType;
import com.cinema.biz.service.SimTypeService;

@Service
public class SimTypeServiceImpl implements SimTypeService {

	@Autowired
    private SimTypeMapper simTypeDao;

	/**列表*/
	@Override
	public List<SimType> getList(Map<String, Object> paraMap) {
		return simTypeDao.getList(paraMap);
	}

	/**详情*/
	@Override
	public SimType getDetail(Map<String, Object> paraMap) {
		return simTypeDao.getDetail(paraMap);
	}

	/**添加*/
	@Override
	public int insert(TSimType t) {
		return simTypeDao.insertSelective(t);
	}

	/**更新*/
	@Override
	public int update(TSimType t) {
		return simTypeDao.updateByPrimaryKeySelective(t);
	}

	/**删除*/
	@Override
	public int delete(String simTypeId) {
		return simTypeDao.deleteByPrimaryKey(simTypeId);
	}

}
