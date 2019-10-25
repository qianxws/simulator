package com.cinema.sys.service;

import java.util.List;

import com.cinema.sys.model.RoleUser;

public interface RoleUserService {
	
	RoleUser getDetail(String id);
	
	List<RoleUser> getListByUserId(String userId);
	
	List<RoleUser> getListByRoleId(String roleId);
	
	String getRoleIds(String userId);
	
	void insertRoleIds(String userId, String[] roleIds);
	
	void insertUserIds(String roleId, String[] userIds);
	
	void deleteByUserId(String userId);
	
	void deleteByRoleId(String roleId);
}
