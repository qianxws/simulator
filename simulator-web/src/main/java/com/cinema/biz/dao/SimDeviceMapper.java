package com.cinema.biz.dao;

import java.util.List;
import java.util.Map;

import com.cinema.biz.model.SimDevice;
import com.cinema.biz.model.base.TSimDevice;

import tk.mybatis.mapper.common.Mapper;
import tk.mybatis.mapper.common.MySqlMapper;

public interface SimDeviceMapper   extends Mapper<TSimDevice>,MySqlMapper<TSimDevice>{
    /**列表*/
    List<SimDevice> getList(Map<String, Object> paraMap);
}