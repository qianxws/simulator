package com.cinema.biz.service;

import java.util.List;
import java.util.Map;

import com.cinema.biz.model.SimMaintenance;
import com.cinema.biz.model.base.TSimMaintenance;

public interface SimMaintenanceService {

	/**列表*/
	List<SimMaintenance> getList(Map<String, Object> paraMap);

	/**添加*/
	int insert(TSimMaintenance t);

	/**更新*/
	int update(TSimMaintenance t) ;

	/**删除*/
	int delete(String maintenanceId);
}
