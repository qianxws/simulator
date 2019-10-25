package com.cinema.biz.service;

import java.util.List;
import java.util.Map;

import com.cinema.biz.model.SimDevice;
import com.cinema.biz.model.base.TSimDevice;

public interface SimDeviceService {

	/**列表*/
	List<SimDevice> getList(Map<String, Object> paraMap);

	/**添加*/
	int insert(TSimDevice t);

	/**更新*/
	int update(TSimDevice t) ;

	/**删除*/
	int delete(String deviceId);
}
