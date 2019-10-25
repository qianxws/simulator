package com.cinema.sys.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cinema.sys.dao.RoleAuthMapper;
import com.cinema.sys.model.RoleAuth;
import com.cinema.sys.model.base.TRoleAuth;
import com.cinema.sys.service.RoleAuthService;
import com.cinema.sys.utils.MapUtil;
import com.cinema.sys.utils.MyUUID;

@Service
public class RoleAuthServiceImpl implements RoleAuthService {
	@Autowired  
    private RoleAuthMapper roleAuthDao;

	@Override
	public RoleAuth getDetail(String id) {
		return roleAuthDao.getDetail(id);
	}

	@Override
	public List<RoleAuth> getList(Map<String, Object> paraMap) {
		return roleAuthDao.getList(paraMap);
	}
	
	@Override
	public void insertAuthIds(String roleId, String[] authIds) {
		this.deleteByRoleId(roleId);
		for(String authId:authIds){
			TRoleAuth roleAuth = new TRoleAuth();
			roleAuth.setId(MyUUID.getUUID());
			roleAuth.setRoleId(roleId);
			roleAuth.setAuthId(authId);
			roleAuthDao.insertSelective(roleAuth);
		}
	}

	@Override
	public void deleteByRoleId(String roleId) {
		roleAuthDao.remove(MapUtil.getMap("roleId",roleId));
	}

	@Override
	public void deleteByAuthId(String authId) {
		roleAuthDao.remove(MapUtil.getMap("authId",authId));
	}
}
