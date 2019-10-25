package com.cinema.biz.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cinema.biz.dao.SimOperateMapper;
import com.cinema.biz.model.SimOperate;
import com.cinema.biz.model.base.TSimOperate;
import com.cinema.biz.service.SimOperateService;

@Service
public class SimOperateServiceImpl implements SimOperateService {

	@Autowired
    private SimOperateMapper simOperateDao;

	/**列表*/
	@Override
	public List<SimOperate> getList(Map<String, Object> paraMap) {
		return simOperateDao.getList(paraMap);
	}

	/**添加*/
	@Override
	public int insert(TSimOperate t) {
		return simOperateDao.insertSelective(t);
	}

	/**更新*/
	@Override
	public int update(TSimOperate t) {
		return simOperateDao.updateByPrimaryKeySelective(t);
	}

	/**删除*/
	@Override
	public int delete(String operateId) {
		return simOperateDao.deleteByPrimaryKey(operateId);
	}
}
