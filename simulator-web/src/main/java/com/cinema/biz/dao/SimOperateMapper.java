package com.cinema.biz.dao;

import java.util.List;
import java.util.Map;

import com.cinema.biz.model.SimOperate;
import com.cinema.biz.model.base.TSimOperate;

import tk.mybatis.mapper.common.Mapper;
import tk.mybatis.mapper.common.MySqlMapper;

public interface SimOperateMapper   extends Mapper<TSimOperate>,MySqlMapper<TSimOperate>{
    /**列表*/
    List<SimOperate> getList(Map<String, Object> paraMap);
}