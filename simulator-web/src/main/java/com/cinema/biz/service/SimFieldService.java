package com.cinema.biz.service;

import java.util.List;
import java.util.Map;

import com.cinema.biz.model.SimField;
import com.cinema.biz.model.base.TSimField;

public interface SimFieldService {

	/**列表*/
	List<SimField> getList(Map<String, Object> paraMap);

	/**添加*/
	int insert(TSimField t);

	/**更新*/
	int update(TSimField t) ;

	/**删除*/
	int delete(String fieldId);
}
