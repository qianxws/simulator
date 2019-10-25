package com.cinema.sys.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cinema.sys.dao.RoleUserMapper;
import com.cinema.sys.model.RoleUser;
import com.cinema.sys.model.base.TRoleUser;
import com.cinema.sys.service.RoleUserService;
import com.cinema.sys.utils.MapUtil;
import com.cinema.sys.utils.MyUUID;

@Service
public class RoleUserServiceImpl implements RoleUserService {
	@Autowired  
    private RoleUserMapper roleUserDao;

	@Override
	public RoleUser getDetail(String id) {
		return roleUserDao.getDetail(id);
	}

	@Override
	public List<RoleUser> getListByUserId(String userId) {
		return roleUserDao.getList(MapUtil.getMap("userId",userId));
	}

	@Override
	public List<RoleUser> getListByRoleId(String roleId) {
		return roleUserDao.getList(MapUtil.getMap("roleId",roleId));
	}
	
	@Override
	public String getRoleIds(String userId) {
		StringBuffer roleIds = new StringBuffer();
		List<RoleUser> list=this.getListByUserId(userId);
		for(RoleUser roleUser:list)
			roleIds.append(roleUser.getRoleId() + ",");
		return roleIds.toString();
	}
	
	@Override
	public void insertRoleIds(String userId, String[] roleIds) {
		this.deleteByUserId(userId);
		for(String roleId:roleIds){
			TRoleUser roleUser = new TRoleUser();
			roleUser.setId(MyUUID.getUUID());
			roleUser.setUserId(userId);
			roleUser.setRoleId(roleId);
			roleUserDao.insert(roleUser);
		}
	}
	
	@Override
	public void insertUserIds(String roleId, String[] userIds) {
		this.deleteByRoleId(roleId);
		for(String userId:userIds){
			TRoleUser roleUser = new TRoleUser();
			roleUser.setId(MyUUID.getUUID());
			roleUser.setUserId(userId);
			roleUser.setRoleId(roleId);
			roleUserDao.insert(roleUser);
		}
	}
	
	@Override
	public void deleteByUserId(String userId) {
		roleUserDao.remove(MapUtil.getMap("userId",userId));
	}

	@Override
	public void deleteByRoleId(String roleId) {
		roleUserDao.remove(MapUtil.getMap("roleId",roleId));
	}
}
