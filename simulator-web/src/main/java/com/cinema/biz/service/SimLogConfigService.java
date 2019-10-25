package com.cinema.biz.service;

import java.util.List;
import java.util.Map;

import com.cinema.biz.model.SimLogConfig;
import com.cinema.biz.model.base.TSimLogConfig;

public interface SimLogConfigService {

	/**列表*/
	List<SimLogConfig> getList(Map<String, Object> paraMap);

    /**详情*/
    SimLogConfig getDetail(Map<String, Object> paraMap);

	/**添加*/
	int insert(TSimLogConfig t);

	/**更新*/
	int update(TSimLogConfig t) ;

	/**删除*/
	int delete(String typeFieldId);
}
