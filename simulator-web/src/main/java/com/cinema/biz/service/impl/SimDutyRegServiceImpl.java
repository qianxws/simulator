package com.cinema.biz.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cinema.biz.dao.SimDutyRegMapper;
import com.cinema.biz.model.SimDutyReg;
import com.cinema.biz.model.base.TSimDutyReg;
import com.cinema.biz.service.SimDutyRegService;

@Service
public class SimDutyRegServiceImpl implements SimDutyRegService {

	@Autowired
    private SimDutyRegMapper simDutyRegDao;

	/**列表*/
	@Override
	public List<SimDutyReg> getList(Map<String, Object> paraMap) {
		return simDutyRegDao.getList(paraMap);
	}

	/**详情*/
	@Override
	public SimDutyReg getDetail(Map<String, Object> paraMap) {
		return simDutyRegDao.getDetail(paraMap);
	}

	/**添加*/
	@Override
	public int insert(TSimDutyReg t) {
		return simDutyRegDao.insertSelective(t);
	}

	/**更新*/
	@Override
	public int update(TSimDutyReg t) {
		return simDutyRegDao.updateByPrimaryKeySelective(t);
	}

	/**删除*/
	@Override
	public int delete(String dutyRegId) {
		return simDutyRegDao.deleteByPrimaryKey(dutyRegId);
	}
}
