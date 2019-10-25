package com.cinema.biz.service;

import java.util.List;
import java.util.Map;

import com.cinema.biz.model.SimDeviceDependency;
import com.cinema.biz.model.base.TSimDeviceDependency;

public interface SimDeviceDependencyService {

	/**列表*/
	List<SimDeviceDependency> getList(Map<String, Object> paraMap);

    /**详情*/
    SimDeviceDependency getDetail(Map<String, Object> paraMap);

	/**添加*/
	int insert(TSimDeviceDependency t);

	/**更新*/
	int update(TSimDeviceDependency t) ;

	/**删除*/
	int delete(String deviceDependencyId);
}
