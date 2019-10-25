package com.cinema.sys.service;

import java.util.List;
import java.util.Map;

import com.cinema.sys.model.Role;
import com.cinema.sys.model.base.TRole;

public interface RoleService {
	Role getDetail(String id);
	
	List<Role> getList(Map<String, Object> paraMap);

	/**获得全部角色*/
	List<Role> getAllList();

	boolean exist(String id,String name);
	
	int delete(String id);
	
	int insert(TRole t);
	
	int update(TRole t);
}
