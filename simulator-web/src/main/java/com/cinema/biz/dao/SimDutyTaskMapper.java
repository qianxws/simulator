package com.cinema.biz.dao;

import java.util.List;
import java.util.Map;

import com.cinema.biz.model.SimDutyTask;
import com.cinema.biz.model.base.TSimDutyTask;

import tk.mybatis.mapper.common.Mapper;
import tk.mybatis.mapper.common.MySqlMapper;

public interface SimDutyTaskMapper   extends Mapper<TSimDutyTask>,MySqlMapper<TSimDutyTask>{
    /**列表*/
    List<SimDutyTask> getList(Map<String, Object> paraMap);

    /**详情*/
    SimDutyTask getDetail(Map<String, Object> paraMap);
}