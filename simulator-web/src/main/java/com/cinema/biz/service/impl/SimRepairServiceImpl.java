package com.cinema.biz.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cinema.biz.dao.SimRepairMapper;
import com.cinema.biz.model.SimRepair;
import com.cinema.biz.model.base.TSimRepair;
import com.cinema.biz.service.SimRepairService;

@Service
public class SimRepairServiceImpl implements SimRepairService {

	@Autowired
    private SimRepairMapper simRepairDao;

	/**列表*/
	@Override
	public List<SimRepair> getList(Map<String, Object> paraMap) {
		return simRepairDao.getList(paraMap);
	}

	/**添加*/
	@Override
	public int insert(TSimRepair t) {
		return simRepairDao.insertSelective(t);
	}

	/**更新*/
	@Override
	public int update(TSimRepair t) {
		return simRepairDao.updateByPrimaryKeySelective(t);
	}

	/**删除*/
	@Override
	public int delete(String repairId) {
		return simRepairDao.deleteByPrimaryKey(repairId);
	}
}
