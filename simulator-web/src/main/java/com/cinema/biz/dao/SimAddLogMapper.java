package com.cinema.biz.dao;

import java.util.List;
import java.util.Map;

import com.cinema.biz.model.SimAddLog;
import com.cinema.biz.model.base.TSimAddLog;

import tk.mybatis.mapper.common.Mapper;
import tk.mybatis.mapper.common.MySqlMapper;

public interface SimAddLogMapper   extends Mapper<TSimAddLog>,MySqlMapper<TSimAddLog>{
    /**列表*/
    List<SimAddLog> getList(Map<String, Object> paraMap);
}