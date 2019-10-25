package com.cinema.biz.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cinema.biz.dao.SimTypeFieldMapper;
import com.cinema.biz.model.SimTypeField;
import com.cinema.biz.model.base.TSimTypeField;
import com.cinema.biz.service.SimTypeFieldService;

@Service
public class SimTypeFieldServiceImpl implements SimTypeFieldService {

	@Autowired
    private SimTypeFieldMapper simTypeFieldDao;

	/**列表*/
	@Override
	public List<SimTypeField> getList(Map<String, Object> paraMap) {
		return simTypeFieldDao.getList(paraMap);
	}

	/**添加*/
	@Override
	public int insert(TSimTypeField t) {
		return simTypeFieldDao.insertSelective(t);
	}

	/**更新*/
	@Override
	public int update(TSimTypeField t) {
		return simTypeFieldDao.updateByPrimaryKeySelective(t);
	}

	/**删除*/
	@Override
	public int delete(String typeFieldId) {
		return simTypeFieldDao.deleteByPrimaryKey(typeFieldId);
	}
}
