package com.cinema.biz.service;

import java.util.List;
import java.util.Map;

import com.cinema.biz.model.SimAddLog;
import com.cinema.biz.model.base.TSimAddLog;

public interface SimAddLogService {

	/**列表*/
	List<SimAddLog> getList(Map<String, Object> paraMap);

	/**添加*/
	int insert(TSimAddLog t);

	/**更新*/
	int update(TSimAddLog t) ;

	/**删除*/
	int delete(String deviceId);
}
