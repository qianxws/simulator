package com.cinema.biz.dao;

import java.util.List;
import java.util.Map;

import com.cinema.biz.model.SimTypeField;
import com.cinema.biz.model.base.TSimTypeField;

import tk.mybatis.mapper.common.Mapper;
import tk.mybatis.mapper.common.MySqlMapper;

public interface SimTypeFieldMapper   extends Mapper<TSimTypeField>,MySqlMapper<TSimTypeField>{
    /**列表*/
    List<SimTypeField> getList(Map<String, Object> paraMap);
}