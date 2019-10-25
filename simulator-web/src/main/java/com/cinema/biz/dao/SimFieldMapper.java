package com.cinema.biz.dao;

import java.util.List;
import java.util.Map;

import com.cinema.biz.model.SimField;
import com.cinema.biz.model.base.TSimField;

import tk.mybatis.mapper.common.Mapper;
import tk.mybatis.mapper.common.MySqlMapper;

public interface SimFieldMapper   extends Mapper<TSimField>,MySqlMapper<TSimField>{
    /**列表*/
    List<SimField> getList(Map<String, Object> paraMap);
}