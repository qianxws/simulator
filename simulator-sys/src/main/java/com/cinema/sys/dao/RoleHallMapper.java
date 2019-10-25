package com.cinema.sys.dao;



import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.cinema.sys.model.RoleHall;
import com.cinema.sys.model.base.TRoleHall;

import tk.mybatis.mapper.common.Mapper;
import tk.mybatis.mapper.common.MySqlMapper;

public interface RoleHallMapper   extends Mapper<TRoleHall>,MySqlMapper<TRoleHall>{
	RoleHall getDetail(String refId);
	
	/**
	 * 获得所有影院的树型列表
	 * @param roleId
	 * @return
	 */
	List<RoleHall> getAllList(@Param("roleId") String roleId,@Param("id") String id,@Param("level") Integer level);
	
}