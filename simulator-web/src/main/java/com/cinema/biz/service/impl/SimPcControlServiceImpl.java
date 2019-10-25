package com.cinema.biz.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cinema.biz.dao.SimPcControlMapper;
import com.cinema.biz.model.SimPcControl;
import com.cinema.biz.model.base.TSimPcControl;
import com.cinema.biz.service.SimPcControlService;

@Service
public class SimPcControlServiceImpl implements SimPcControlService {

	@Autowired
    private SimPcControlMapper simPcControlDao;

	/**列表*/
	@Override
	public List<SimPcControl> getList(Map<String, Object> paraMap) {
		return simPcControlDao.getList(paraMap);
	}

	/**添加*/
	@Override
	public int insert(TSimPcControl t) {
		return simPcControlDao.insertSelective(t);
	}

	/**更新*/
	@Override
	public int update(TSimPcControl t) {
		return simPcControlDao.updateByPrimaryKeySelective(t);
	}

	/**删除*/
	@Override
	public int delete(String deviceId) {
		return simPcControlDao.deleteByPrimaryKey(deviceId);
	}
}
