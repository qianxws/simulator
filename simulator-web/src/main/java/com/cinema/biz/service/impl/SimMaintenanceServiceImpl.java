package com.cinema.biz.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cinema.biz.dao.SimMaintenanceMapper;
import com.cinema.biz.model.SimMaintenance;
import com.cinema.biz.model.base.TSimMaintenance;
import com.cinema.biz.service.SimMaintenanceService;

@Service
public class SimMaintenanceServiceImpl implements SimMaintenanceService {

	@Autowired
    private SimMaintenanceMapper simMaintenanceDao;

	/**列表*/
	@Override
	public List<SimMaintenance> getList(Map<String, Object> paraMap) {
		return simMaintenanceDao.getList(paraMap);
	}

	/**添加*/
	@Override
	public int insert(TSimMaintenance t) {
		return simMaintenanceDao.insertSelective(t);
	}

	/**更新*/
	@Override
	public int update(TSimMaintenance t) {
		return simMaintenanceDao.updateByPrimaryKeySelective(t);
	}

	/**删除*/
	@Override
	public int delete(String maintenanceId) {
		return simMaintenanceDao.deleteByPrimaryKey(maintenanceId);
	}
}
