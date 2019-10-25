package com.cinema.biz.service;

import java.util.List;
import java.util.Map;

import com.cinema.biz.model.SimRepair;
import com.cinema.biz.model.base.TSimRepair;

public interface SimRepairService {

	/**列表*/
	List<SimRepair> getList(Map<String, Object> paraMap);

	/**添加*/
	int insert(TSimRepair t);

	/**更新*/
	int update(TSimRepair t) ;

	/**删除*/
	int delete(String repairId);
}
