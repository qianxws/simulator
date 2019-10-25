package com.cinema.biz.service;

import java.util.List;
import java.util.Map;

import com.cinema.biz.model.SimThreshold;
import com.cinema.biz.model.base.TSimThreshold;

public interface SimThresholdService {

	/**列表*/
	List<SimThreshold> getList(Map<String, Object> paraMap);

    /**详情*/
    SimThreshold getDetail(Map<String, Object> paraMap);

	/**添加*/
	int insert(TSimThreshold t);

	/**更新*/
	int update(TSimThreshold t) ;

	/**删除*/
	int delete(String thresholdId);
}
