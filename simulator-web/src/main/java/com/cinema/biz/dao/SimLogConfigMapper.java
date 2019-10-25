package com.cinema.biz.dao;

import java.util.List;
import java.util.Map;

import com.cinema.biz.model.SimLogConfig;
import com.cinema.biz.model.base.TSimLogConfig;

import tk.mybatis.mapper.common.Mapper;
import tk.mybatis.mapper.common.MySqlMapper;

public interface SimLogConfigMapper   extends Mapper<TSimLogConfig>,MySqlMapper<TSimLogConfig>{
    /**列表*/
    List<SimLogConfig> getList(Map<String, Object> paraMap);

    /**详情*/
    SimLogConfig getDetail(Map<String, Object> paraMap);
}