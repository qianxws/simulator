package com.cinema.sys.dao;

import java.util.List;
import java.util.Map;

import com.cinema.sys.model.RoleAuth;
import com.cinema.sys.model.base.TRoleAuth;

import tk.mybatis.mapper.common.Mapper;
import tk.mybatis.mapper.common.MySqlMapper;

public interface RoleAuthMapper   extends Mapper<TRoleAuth>,MySqlMapper<TRoleAuth>{
	
	RoleAuth getDetail(String id);

	List<RoleAuth> getList(Map<String, Object> paraMap);

	void remove(Map<String, Object> paraMap);
}