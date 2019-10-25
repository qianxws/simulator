package com.cinema.biz.dao;

import java.util.List;
import java.util.Map;

import com.cinema.biz.model.SimDependencySet;
import com.cinema.biz.model.base.TSimDependencySet;

import tk.mybatis.mapper.common.Mapper;
import tk.mybatis.mapper.common.MySqlMapper;

public interface SimDependencySetMapper   extends Mapper<TSimDependencySet>,MySqlMapper<TSimDependencySet>{
    /**列表*/
    List<SimDependencySet> getList(Map<String, Object> paraMap);

    /**详情*/
    SimDependencySet getDetail(Map<String, Object> paraMap);
}