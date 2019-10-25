package com.cinema.sys.dao;



import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.cinema.sys.model.Role;
import com.cinema.sys.model.base.TRole;

import tk.mybatis.mapper.common.Mapper;
import tk.mybatis.mapper.common.MySqlMapper;

public interface RoleMapper   extends Mapper<TRole>,MySqlMapper<TRole>{
    Role getDetail(String id);

	List<Role> getList(Map<String, Object> paraMap);
	
	/**是否存在*/
	Boolean exist(@Param("id") String id,@Param("name") String name);
}