package com.cinema.biz.dao;

import java.util.List;
import java.util.Map;

import com.cinema.biz.model.SimDutyReg;
import com.cinema.biz.model.base.TSimDutyReg;

import tk.mybatis.mapper.common.Mapper;
import tk.mybatis.mapper.common.MySqlMapper;

public interface SimDutyRegMapper   extends Mapper<TSimDutyReg>,MySqlMapper<TSimDutyReg>{
    /**列表*/
    List<SimDutyReg> getList(Map<String, Object> paraMap);

    /**详情*/
    SimDutyReg getDetail(Map<String, Object> paraMap);
}