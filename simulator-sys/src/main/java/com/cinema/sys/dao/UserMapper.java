package com.cinema.sys.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.cinema.sys.model.User;
import com.cinema.sys.model.base.TUser;

import tk.mybatis.mapper.common.Mapper;
import tk.mybatis.mapper.common.MySqlMapper;

public interface UserMapper  extends Mapper<TUser>,MySqlMapper<TUser> {
	
	User getDetail(Map<String, Object> paraMap);
	    
	List<User> getList(Map<String, Object> paraMap);
	
	Boolean exist(String id);
}
