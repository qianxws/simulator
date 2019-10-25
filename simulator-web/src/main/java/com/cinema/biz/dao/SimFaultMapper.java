package com.cinema.biz.dao;

import java.util.List;
import java.util.Map;

import com.cinema.biz.model.SimFault;
import com.cinema.biz.model.base.TSimFault;

import tk.mybatis.mapper.common.Mapper;
import tk.mybatis.mapper.common.MySqlMapper;

public interface SimFaultMapper   extends Mapper<TSimFault>,MySqlMapper<TSimFault>{
    /**列表*/
    List<SimFault> getList(Map<String, Object> paraMap);
}