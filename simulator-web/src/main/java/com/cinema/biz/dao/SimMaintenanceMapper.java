package com.cinema.biz.dao;

import java.util.List;
import java.util.Map;

import com.cinema.biz.model.SimMaintenance;
import com.cinema.biz.model.base.TSimMaintenance;

import tk.mybatis.mapper.common.Mapper;
import tk.mybatis.mapper.common.MySqlMapper;

public interface SimMaintenanceMapper   extends Mapper<TSimMaintenance>,MySqlMapper<TSimMaintenance>{
    /**列表*/
    List<SimMaintenance> getList(Map<String, Object> paraMap);
}