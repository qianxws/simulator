package com.cinema.sys.service;

import java.util.List;
import java.util.Map;

import com.cinema.sys.model.RoleAuth;

public interface RoleAuthService {
	
	RoleAuth getDetail(String id);

	List<RoleAuth> getList(Map<String, Object> paraMap);

	void insertAuthIds(String roleId, String[] authIds);
	
	void deleteByRoleId(String roleId);
	
	void deleteByAuthId(String authId);
}
