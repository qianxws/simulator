package com.cinema.biz.service;

import java.util.List;
import java.util.Map;

import com.cinema.biz.model.SimDutyReg;
import com.cinema.biz.model.base.TSimDutyReg;

public interface SimDutyRegService {

	/**列表*/
	List<SimDutyReg> getList(Map<String, Object> paraMap);

    /**详情*/
    SimDutyReg getDetail(Map<String, Object> paraMap);

	/**添加*/
	int insert(TSimDutyReg t);

	/**更新*/
	int update(TSimDutyReg t) ;

	/**删除*/
	int delete(String dutyRegId);
}
