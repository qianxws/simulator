package com.cinema.biz.service;

import java.util.List;
import java.util.Map;

import com.cinema.biz.model.SimSimulator;
import com.cinema.biz.model.base.TSimSimulator;

public interface SimSimulatorService {

	/**列表*/
	List<SimSimulator> getList(Map<String, Object> paraMap);

	/**添加*/
	int insert(TSimSimulator t);

	/**更新*/
	int update(TSimSimulator t) ;

	/**删除*/
	int delete(String simulatorId);
}
