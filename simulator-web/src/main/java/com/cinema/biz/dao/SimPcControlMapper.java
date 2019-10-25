package com.cinema.biz.dao;

import java.util.List;
import java.util.Map;

import com.cinema.biz.model.SimPcControl;
import com.cinema.biz.model.base.TSimPcControl;

import tk.mybatis.mapper.common.Mapper;
import tk.mybatis.mapper.common.MySqlMapper;

public interface SimPcControlMapper   extends Mapper<TSimPcControl>,MySqlMapper<TSimPcControl>{
    /**列表*/
    List<SimPcControl> getList(Map<String, Object> paraMap);
}