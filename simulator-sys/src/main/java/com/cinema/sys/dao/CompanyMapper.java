package com.cinema.sys.dao;

import java.util.List;
import java.util.Map;

import com.cinema.sys.model.Company;
import com.cinema.sys.model.base.TCompany;

import tk.mybatis.mapper.common.Mapper;
import tk.mybatis.mapper.common.MySqlMapper;

public interface CompanyMapper  extends Mapper<TCompany>,MySqlMapper<TCompany>{

	/**详情*/
    Company getDetail(Map<String, Object> paraMap);
    
    /**列表*/
    List<Company> getList(Map<String, Object> paraMap);
    
    Integer getMaxNid();
}