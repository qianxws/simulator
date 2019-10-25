package com.cinema.biz.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cinema.biz.dao.SimDeviceMapper;
import com.cinema.biz.model.SimDevice;
import com.cinema.biz.model.base.TSimDevice;
import com.cinema.biz.service.SimDeviceService;

@Service
public class SimDeviceServiceImpl implements SimDeviceService {

	@Autowired
    private SimDeviceMapper simDeviceDao;

	/**列表*/
	@Override
	public List<SimDevice> getList(Map<String, Object> paraMap) {
		return simDeviceDao.getList(paraMap);
	}

	/**添加*/
	@Override
	public int insert(TSimDevice t) {
		return simDeviceDao.insertSelective(t);
	}

	/**更新*/
	@Override
	public int update(TSimDevice t) {
		return simDeviceDao.updateByPrimaryKeySelective(t);
	}

	/**删除*/
	@Override
	public int delete(String deviceId) {
		return simDeviceDao.deleteByPrimaryKey(deviceId);
	}
}
