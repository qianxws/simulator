package com.cinema.biz.service;

import java.util.List;
import java.util.Map;

import com.cinema.biz.model.SimOperate;
import com.cinema.biz.model.base.TSimOperate;

public interface SimOperateService {

	/**列表*/
	List<SimOperate> getList(Map<String, Object> paraMap);

	/**添加*/
	int insert(TSimOperate t);

	/**更新*/
	int update(TSimOperate t) ;

	/**删除*/
	int delete(String operateId);
}
