package com.cinema.biz.service;

import java.util.List;
import java.util.Map;

import com.cinema.biz.model.SimTypeField;
import com.cinema.biz.model.base.TSimTypeField;

public interface SimTypeFieldService {

	/**列表*/
	List<SimTypeField> getList(Map<String, Object> paraMap);

	/**添加*/
	int insert(TSimTypeField t);

	/**更新*/
	int update(TSimTypeField t) ;

	/**删除*/
	int delete(String typeFieldId);
}
