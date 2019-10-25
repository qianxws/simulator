package com.cinema.biz.dao;

import java.util.List;
import java.util.Map;

import com.cinema.biz.model.SimType;
import com.cinema.biz.model.base.TSimType;

import tk.mybatis.mapper.common.Mapper;
import tk.mybatis.mapper.common.MySqlMapper;

public interface SimTypeMapper   extends Mapper<TSimType>,MySqlMapper<TSimType>{
    /**列表*/
    List<SimType> getList(Map<String, Object> paraMap);
    
    /**详情*/
    SimType getDetail(Map<String, Object> paraMap);
}