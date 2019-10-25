package com.cinema.biz.service;

import java.util.List;
import java.util.Map;

import com.cinema.biz.model.SimDependency;
import com.cinema.biz.model.base.TSimDependency;

public interface SimDependencyService {

	/**列表*/
	List<SimDependency> getList(Map<String, Object> paraMap);

    /**详情*/
    SimDependency getDetail(Map<String, Object> paraMap);

	/**添加*/
	int insert(TSimDependency t);

	/**更新*/
	int update(TSimDependency t) ;

	/**删除*/
	int delete(String dependencyId);
}
