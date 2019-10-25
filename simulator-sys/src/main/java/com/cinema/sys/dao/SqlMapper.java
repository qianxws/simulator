package com.cinema.sys.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

public interface SqlMapper{

	List<Map<String,Object>> getList(@Param("sql") String sql);

	/**
	 * 执行sql语句
	 * 
	 * @param sql
	 * @return
	 */
	void execSql(@Param("sql") String sql);
	
	

}