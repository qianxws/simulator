package com.cinema.sys.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cinema.sys.dao.RoleMapper;
import com.cinema.sys.model.Role;
import com.cinema.sys.model.User;
import com.cinema.sys.model.base.TRole;
import com.cinema.sys.service.RoleAuthService;
import com.cinema.sys.service.RoleService;
import com.cinema.sys.service.RoleUserService;
import com.cinema.sys.service.UserService;
import com.cinema.sys.utils.MapUtil;

@Service
public class RoleServiceImpl implements RoleService {

	@Autowired  
    private RoleMapper roleDao;
	@Autowired  
    private UserService userService;
	@Autowired  
    private RoleUserService roleUserService;
	@Autowired  
    private RoleAuthService roleAuthService;
	
	
	@Override
	public List<Role> getList(Map<String, Object> paraMap) {
		List<Role> list=roleDao.getList(paraMap);
		for(Role m:list){
			User user=userService.getDetail(m.getCreator());
			if(user !=null){
				m.setCreatorName(user.getName());
			}
		}
		return list;
	}
	
	@Override
	public List<Role> getAllList() {
		return  getList(MapUtil.getMap("state",1));
	}

	@Override
    public Role getDetail(String id) {  
		Role m=roleDao.getDetail(id);
		User user=userService.getDetail(m.getCreator());
		if(user !=null){
			m.setCreatorName(user.getName());
		}
        return m;
    }
	
	@Override
	public int insert(TRole t) {
		return roleDao.insertSelective(t);
	}
	
	@Override
	public int update(TRole t) {
		return roleDao.updateByPrimaryKeySelective(t);
	}
	
	@Override
	public int delete(String id) {
		//先删除角色权限，再删除角色
		roleAuthService.deleteByRoleId(id);
		roleUserService.deleteByRoleId(id);
		return roleDao.deleteByPrimaryKey(id);
	}

	@Override
	public boolean exist(String id,String name) {
		return roleDao.exist(id, name);
	}
}
