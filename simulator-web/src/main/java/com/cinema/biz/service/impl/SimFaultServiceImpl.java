package com.cinema.biz.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cinema.biz.dao.SimFaultMapper;
import com.cinema.biz.model.SimFault;
import com.cinema.biz.model.base.TSimFault;
import com.cinema.biz.service.SimFaultService;

@Service
public class SimFaultServiceImpl implements SimFaultService {

	@Autowired
    private SimFaultMapper simFaultDao;

	/**列表*/
	@Override
	public List<SimFault> getList(Map<String, Object> paraMap) {
		return simFaultDao.getList(paraMap);
	}

	/**添加*/
	@Override
	public int insert(TSimFault t) {
		return simFaultDao.insertSelective(t);
	}

	/**更新*/
	@Override
	public int update(TSimFault t) {
		return simFaultDao.updateByPrimaryKeySelective(t);
	}

	/**删除*/
	@Override
	public int delete(String faultId) {
		return simFaultDao.deleteByPrimaryKey(faultId);
	}
}
