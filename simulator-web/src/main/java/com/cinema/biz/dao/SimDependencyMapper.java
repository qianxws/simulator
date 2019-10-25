package com.cinema.biz.dao;

import java.util.List;
import java.util.Map;

import com.cinema.biz.model.SimDependency;
import com.cinema.biz.model.base.TSimDependency;

import tk.mybatis.mapper.common.Mapper;
import tk.mybatis.mapper.common.MySqlMapper;

public interface SimDependencyMapper   extends Mapper<TSimDependency>,MySqlMapper<TSimDependency>{
    /**列表*/
    List<SimDependency> getList(Map<String, Object> paraMap);

    /**详情*/
    SimDependency getDetail(Map<String, Object> paraMap);
}