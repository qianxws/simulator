package com.cinema.sys.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.alibaba.fastjson.JSONObject;
import com.cinema.sys.model.User;
import com.cinema.sys.model.base.TUser;

public interface UserService {
	
	User getDetail(String id);  
	
	User getDetail(String id,String password); 
	
	List<User> getList(Map<String, Object> paraMap);
	
	List<User> getAllList();
	
	int delete(String id);
	
	int insert(TUser t);
	
	int update(TUser t) ;

	Boolean exist(String id);
}
