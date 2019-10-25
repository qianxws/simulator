package com.cinema.biz.service;

import java.util.List;
import java.util.Map;

import com.cinema.biz.model.SimPcControl;
import com.cinema.biz.model.base.TSimPcControl;

public interface SimPcControlService {

	/**列表*/
	List<SimPcControl> getList(Map<String, Object> paraMap);

	/**添加*/
	int insert(TSimPcControl t);

	/**更新*/
	int update(TSimPcControl t) ;

	/**删除*/
	int delete(String deviceId);
}
