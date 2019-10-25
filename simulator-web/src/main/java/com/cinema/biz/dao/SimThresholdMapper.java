package com.cinema.biz.dao;

import java.util.List;
import java.util.Map;

import com.cinema.biz.model.SimThreshold;
import com.cinema.biz.model.base.TSimThreshold;

import tk.mybatis.mapper.common.Mapper;
import tk.mybatis.mapper.common.MySqlMapper;

public interface SimThresholdMapper   extends Mapper<TSimThreshold>,MySqlMapper<TSimThreshold>{
    /**列表*/
    List<SimThreshold> getList(Map<String, Object> paraMap);

    /**详情*/
    SimThreshold getDetail(Map<String, Object> paraMap);
}