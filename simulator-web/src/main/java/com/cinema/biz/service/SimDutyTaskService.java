package com.cinema.biz.service;

import java.util.List;
import java.util.Map;

import com.cinema.biz.model.SimDutyTask;
import com.cinema.biz.model.base.TSimDutyTask;

public interface SimDutyTaskService {

	/**列表*/
	List<SimDutyTask> getList(Map<String, Object> paraMap);

    /**详情*/
    SimDutyTask getDetail(Map<String, Object> paraMap);

	/**添加*/
	int insert(TSimDutyTask t);

	/**更新*/
	int update(TSimDutyTask t) ;

	/**删除*/
	int delete(String dutyTaskId);
}
