package com.cinema.sys.dao;

import java.util.List;
import java.util.Map;

import com.cinema.sys.model.RoleUser;
import com.cinema.sys.model.base.TRoleUser;

import tk.mybatis.mapper.common.Mapper;
import tk.mybatis.mapper.common.MySqlMapper;

public interface RoleUserMapper   extends Mapper<TRoleUser>,MySqlMapper<TRoleUser> {
	
	RoleUser getDetail(String id);
	
	List<RoleUser> getList(Map<String, Object> paraMap);
	
	void remove(Map<String, Object> paraMap);
}