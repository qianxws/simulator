package com.cinema.sys.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.cinema.sys.model.Log;
import com.cinema.sys.model.base.TLog;

import tk.mybatis.mapper.common.Mapper;
import tk.mybatis.mapper.common.MySqlMapper;

public interface LogMapper   extends Mapper<TLog>,MySqlMapper<TLog> {
    Log getDetail(String logId);

	List<Log> getList(@Param("paraMap") Map<String, Object> paraMap);
}