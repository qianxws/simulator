package com.cinema.sys.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cinema.sys.dao.UserMapper;
import com.cinema.sys.model.User;
import com.cinema.sys.model.base.TUser;
import com.cinema.sys.service.LogService;
import com.cinema.sys.service.RoleUserService;
import com.cinema.sys.service.UserService;
import com.cinema.sys.utils.MapUtil;
import com.cinema.sys.utils.MyTools;

@Service
public class UserServiceImpl implements UserService {
	@Autowired  
    private UserMapper userDao;  
	@Autowired  
    private RoleUserService roleUserService;  
	@Autowired
	private LogService logService;
	
	@Override
    public User getDetail(String id) {  
		User m=userDao.getDetail(MapUtil.getMap("id",id));
		if(m!=null) {
			TUser updatorUser=userDao.selectByPrimaryKey(m.getUpdator());
			if(updatorUser!=null)
				m.setUpdatorName(updatorUser.getName());
			TUser creatorUser=userDao.selectByPrimaryKey(m.getCreator());
			if(creatorUser!=null)
				m.setCreatorName(creatorUser.getName());
		}
        return m;
    }

	@Override
	public User getDetail(String id, String password) {
		Map<String,Object> paraMap=new HashMap<String,Object>();
		paraMap.put("id",id);
		paraMap.put("password",MyTools.password(password));
		return userDao.getDetail(paraMap);
	}
	
	@Override
	public List<User> getList(Map<String, Object> paraMap) {
		List<User> list=userDao.getList(paraMap);
		for(User m:list){
			TUser updatorUser=userDao.selectByPrimaryKey(m.getUpdator());
			if(updatorUser!=null)
				m.setUpdatorName(updatorUser.getName());
			TUser creatorUser=userDao.selectByPrimaryKey(m.getCreator());
			if(creatorUser!=null)
				m.setCreatorName(creatorUser.getName());
		}
		return list;
	}

	@Override
	public List<User> getAllList() {
		return getList(MapUtil.getMap("enabled",1));
	}


	@Override
	public int delete(String id) {
		roleUserService.deleteByUserId(id);
		return userDao.deleteByPrimaryKey(id);
	}
	
	@Override
	public int insert(TUser t) {
		return userDao.insertSelective(t);
	}

	@Override
	public int update(TUser t) {
		return userDao.updateByPrimaryKeySelective(t);
	}

	
	@Override
	public Boolean exist(String id) {
		return userDao.exist(id);
	}

}
