package com.cinema.biz.service;

import java.util.List;
import java.util.Map;

import com.cinema.biz.model.SimFault;
import com.cinema.biz.model.base.TSimFault;

public interface SimFaultService {

	/**列表*/
	List<SimFault> getList(Map<String, Object> paraMap);

	/**添加*/
	int insert(TSimFault t);

	/**更新*/
	int update(TSimFault t) ;

	/**删除*/
	int delete(String faultId);
}
