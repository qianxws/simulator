package com.cinema.biz.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cinema.biz.dao.SimFieldMapper;
import com.cinema.biz.model.SimField;
import com.cinema.biz.model.base.TSimField;
import com.cinema.biz.service.SimFieldService;

@Service
public class SimFieldServiceImpl implements SimFieldService {

	@Autowired
    private SimFieldMapper simFieldDao;

	/**列表*/
	@Override
	public List<SimField> getList(Map<String, Object> paraMap) {
		return simFieldDao.getList(paraMap);
	}

	/**添加*/
	@Override
	public int insert(TSimField t) {
		return simFieldDao.insertSelective(t);
	}

	/**更新*/
	@Override
	public int update(TSimField t) {
		return simFieldDao.updateByPrimaryKeySelective(t);
	}

	/**删除*/
	@Override
	public int delete(String fieldId) {
		return simFieldDao.deleteByPrimaryKey(fieldId);
	}
}
