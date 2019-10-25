package com.cinema.biz.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cinema.biz.dao.SimDutyTaskMapper;
import com.cinema.biz.model.SimDutyTask;
import com.cinema.biz.model.base.TSimDutyTask;
import com.cinema.biz.service.SimDutyTaskService;

@Service
public class SimDutyTaskServiceImpl implements SimDutyTaskService {

	@Autowired
    private SimDutyTaskMapper simDutyTaskDao;

	/**列表*/
	@Override
	public List<SimDutyTask> getList(Map<String, Object> paraMap) {
		return simDutyTaskDao.getList(paraMap);
	}

	/**详情*/
	@Override
	public SimDutyTask getDetail(Map<String, Object> paraMap) {
		return simDutyTaskDao.getDetail(paraMap);
	}

	/**添加*/
	@Override
	public int insert(TSimDutyTask t) {
		return simDutyTaskDao.insertSelective(t);
	}

	/**更新*/
	@Override
	public int update(TSimDutyTask t) {
		return simDutyTaskDao.updateByPrimaryKeySelective(t);
	}

	/**删除*/
	@Override
	public int delete(String dutyTaskId) {
		return simDutyTaskDao.deleteByPrimaryKey(dutyTaskId);
	}
}
