package com.cinema.biz.service;

import java.util.List;
import java.util.Map;

import com.cinema.biz.model.SimFaultLib;
import com.cinema.biz.model.base.TSimFaultLib;

public interface SimFaultLibService {

	/**列表*/
	List<SimFaultLib> getList(Map<String, Object> paraMap);

    /**详情*/
    SimFaultLib getDetail(Map<String, Object> paraMap);

	/**添加*/
	int insert(TSimFaultLib t);

	/**更新*/
	int update(TSimFaultLib t) ;

	/**删除*/
	int delete(String faultLibId);
}
