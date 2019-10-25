package com.cinema.sys.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.cinema.sys.model.Auth;
import com.cinema.sys.model.base.TAuth;

import tk.mybatis.mapper.common.Mapper;
import tk.mybatis.mapper.common.MySqlMapper;

public interface AuthMapper  extends Mapper<TAuth>,MySqlMapper<TAuth> {

    Auth getDetail(String authId);
    
    List<Auth> getList(Map<String, Object> paraMap);
    //根据Id获取Name
    String getNameById(@Param("authId")String authId);
	
	//查询权限树
	List<Auth> getAuthTree(String roleId);
	
	List<Auth> getAllList(@Param("roleId") String roleId,@Param("id") String id,@Param("level") Integer level);
	
	int hasChildAuth(String id);
	Boolean exist(@Param("authId") String authId,@Param("name") String name);
	
    /**得到下级和下下级id
     * 适用于三级树*/
    List<String> getSubIds(String parentId);
}