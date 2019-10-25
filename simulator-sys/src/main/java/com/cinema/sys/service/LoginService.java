package com.cinema.sys.service;

import javax.servlet.http.HttpServletRequest;

import com.alibaba.fastjson.JSONObject;
import com.cinema.sys.model.User;
import com.cinema.sys.model.UserSessionItems;

public interface LoginService {
	
	UserSessionItems getUserSessionItems(User user);
	
	/**登录系统*/
	JSONObject login(HttpServletRequest request,String ip, String loginName, String password) throws Exception;
}
