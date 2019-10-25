package com.cinema.biz.service;

import java.util.List;
import java.util.Map;

import com.cinema.biz.model.SimDependencySet;
import com.cinema.biz.model.base.TSimDependencySet;

public interface SimDependencySetService {

	/**列表*/
	List<SimDependencySet> getList(Map<String, Object> paraMap);

    /**详情*/
    SimDependencySet getDetail(Map<String, Object> paraMap);

	/**添加*/
	int insert(TSimDependencySet t);

	/**更新*/
	int update(TSimDependencySet t) ;

	/**删除*/
	int delete(String deviceId);
}
