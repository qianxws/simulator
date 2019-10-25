package com.cinema.common.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

public interface DataExportMapper {
	
    /** 获得影片总数*/
	int getFilmTotal();
	
	/** 分页查询所有影片信息*/
	List<Map<String,Object>> getFilmExcel( @Param("rows")int rows,@Param("offset")int offset);
}
