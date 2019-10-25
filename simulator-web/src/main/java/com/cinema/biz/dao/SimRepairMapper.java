package com.cinema.biz.dao;

import java.util.List;
import java.util.Map;

import com.cinema.biz.model.SimRepair;
import com.cinema.biz.model.base.TSimRepair;

import tk.mybatis.mapper.common.Mapper;
import tk.mybatis.mapper.common.MySqlMapper;

public interface SimRepairMapper   extends Mapper<TSimRepair>,MySqlMapper<TSimRepair>{
    /**列表*/
    List<SimRepair> getList(Map<String, Object> paraMap);
}