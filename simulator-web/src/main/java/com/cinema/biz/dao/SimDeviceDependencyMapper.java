package com.cinema.biz.dao;

import java.util.List;
import java.util.Map;

import com.cinema.biz.model.SimDeviceDependency;
import com.cinema.biz.model.base.TSimDeviceDependency;

import tk.mybatis.mapper.common.Mapper;
import tk.mybatis.mapper.common.MySqlMapper;

public interface SimDeviceDependencyMapper   extends Mapper<TSimDeviceDependency>,MySqlMapper<TSimDeviceDependency>{
    /**列表*/
    List<SimDeviceDependency> getList(Map<String, Object> paraMap);

    /**详情*/
    SimDeviceDependency getDetail(Map<String, Object> paraMap);

}