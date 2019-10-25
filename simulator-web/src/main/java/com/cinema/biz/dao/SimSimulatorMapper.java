package com.cinema.biz.dao;

import java.util.List;
import java.util.Map;

import com.cinema.biz.model.SimSimulator;
import com.cinema.biz.model.base.TSimSimulator;

import tk.mybatis.mapper.common.Mapper;
import tk.mybatis.mapper.common.MySqlMapper;

public interface SimSimulatorMapper   extends Mapper<TSimSimulator>,MySqlMapper<TSimSimulator>{
    /**列表*/
    List<SimSimulator> getList(Map<String, Object> paraMap);
    
    Boolean isParent(String simulatorId);
}