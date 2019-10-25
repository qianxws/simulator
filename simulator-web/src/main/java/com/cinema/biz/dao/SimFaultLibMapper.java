package com.cinema.biz.dao;

import java.util.List;
import java.util.Map;

import com.cinema.biz.model.SimFaultLib;
import com.cinema.biz.model.base.TSimFaultLib;

import tk.mybatis.mapper.common.Mapper;
import tk.mybatis.mapper.common.MySqlMapper;

public interface SimFaultLibMapper   extends Mapper<TSimFaultLib>,MySqlMapper<TSimFaultLib>{
    /**列表*/
    List<SimFaultLib> getList(Map<String, Object> paraMap);

    /**详情*/
    SimFaultLib getDetail(Map<String, Object> paraMap);
}