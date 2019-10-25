package com.cinema.biz.service;

import java.util.List;
import java.util.Map;

import com.cinema.biz.model.SimType;
import com.cinema.biz.model.base.TSimType;

public interface SimTypeService {

	/**列表*/
	List<SimType> getList(Map<String, Object> paraMap);
	
    /**详情*/
    SimType getDetail(Map<String, Object> paraMap);

	/**添加*/
	int insert(TSimType t);

	/**更新*/
	int update(TSimType t) ;

	/**删除*/
	int delete(String simTypeId);
}
