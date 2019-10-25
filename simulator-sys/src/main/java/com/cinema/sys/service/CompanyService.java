package com.cinema.sys.service;

import java.util.List;
import java.util.Map;

import com.cinema.sys.model.Company;
import com.cinema.sys.model.base.TCompany;

public interface CompanyService {
	
    Company getDetail(Map<String, Object> paraMap);
    
    Company getDetailById(String id);
	
	/**列表*/
	List<Company> getList(Map<String, Object> paraMap);
	
	String getIds(Map<String, Object> paraMap);
	
	Integer getMaxNid();
	
	/**添加*/
	int insert(TCompany t);

	/**更新*/
	int update(TCompany t) ;

	/**删除*/
	int delete(String id);
}
