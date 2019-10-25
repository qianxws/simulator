package com.cinema.sys.dao;


import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.cinema.sys.model.Dictionary;
import com.cinema.sys.model.Option;
import com.cinema.sys.model.base.TDictionary;

import tk.mybatis.mapper.common.Mapper;
import tk.mybatis.mapper.common.MySqlMapper;


public interface DictionaryMapper  extends Mapper<TDictionary>,MySqlMapper<TDictionary> {
	
	/**得到子项*/
	List<Option>  getOptions(@Param("id") String id);
	
	List<Dictionary> getList(@Param("paraMap") Map<String, Object> paraMap);
	
	List<Dictionary> find(@Param("paraMap") Map<String, Object> paraMap);
	
	List<Dictionary> getTopList(@Param("paraMap") Map<String, Object> paraMap);
	
	List<Dictionary> getAllTopList();
	
    int deleteByPid(@Param("parentId") String parentId);
    
    Dictionary getDetail(@Param("id") String id);
	
}
