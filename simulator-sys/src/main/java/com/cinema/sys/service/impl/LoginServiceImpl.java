package com.cinema.sys.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSONObject;
import com.cinema.sys.dao.LoginMapper;
import com.cinema.sys.model.User;
import com.cinema.sys.model.UserSessionItems;
import com.cinema.sys.service.LogService;
import com.cinema.sys.service.LoginService;
import com.cinema.sys.service.RoleUserService;
import com.cinema.sys.service.UserService;
import com.cinema.sys.utils.ConfigUtil;
import com.cinema.sys.utils.MyUUID;
import com.cinema.sys.utils.RedisUtil;

@Service
public class LoginServiceImpl implements LoginService {
	
	@Autowired  
    private LoginMapper loginDao;  
	@Autowired  
    private UserService userService;  
	@Autowired  
    private RoleUserService roleUserService;  
	@Autowired
	private LogService logService;

	@Override
	public UserSessionItems getUserSessionItems(User user) {
		UserSessionItems userSession=new UserSessionItems();
		
		//得到authLevel
		String userId=user.getId();
		String roleIds=roleUserService.getRoleIds(userId);
		String authLevel="";
		Boolean isAdmin=false;
		if(userId.equals(ConfigUtil.ROOT_ID)){
			authLevel="isRoot";
			isAdmin=true;
		}
		else if((","+roleIds).indexOf(","+ConfigUtil.SUPADMIN_ID+",")>-1){
			authLevel="isSupAdmin";
			isAdmin=true;
		}
		else if (StringUtils.isBlank(roleIds)) 
			authLevel="isDefault";

		//得到authCodes
		Map<String,Object> paraMap=new HashMap<String, Object>();
		paraMap.put("userId", userId);
		paraMap.put("authLevel", authLevel);
		StringBuffer authCodes = new StringBuffer();
		List<String> list=loginDao.getLoginAuths(paraMap);
		for(String code:list)
			authCodes.append(code + ",");
		
		userSession.setUser(user);
		userSession.setAuthLevel(authLevel);
		userSession.setIsAdmin(isAdmin);
		userSession.setAuthCodes(authCodes.toString());
		return userSession;
	}
	
	/**
	 * 登录系统
	 * @param ip
	 * @param loginName
	 * @param password
	 * @param verification
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings({ "unlikely-arg-type", "null" })
	@Override
	public JSONObject login(HttpServletRequest request,String ip, String loginName, String password) 
			throws Exception {
		JSONObject json = new JSONObject();
		User user = userService.getDetail(loginName,password);
		if (user == null) {
			throw new Exception("用户名和密码不匹配!");
		}
		if ("0".equals(user.getEnabled())) {
			throw new Exception("该用户已被禁用！");
		}
		
		//登录成功，保存token
		String token = "false";
		UserSessionItems userSession=this.getUserSessionItems(user);
		request.getSession().setAttribute("userSessionItems", userSession);
		//判断是否使用token
		if(ConfigUtil.ISTOKEN==1) {
			token = MyUUID.getUUID();
			//保存token 到redis中 
			Map<String,String> data=new HashMap<String, String>();
			data.put("token" ,token);
			data.put("userId",user.getId());
			data.put("isAdmin",userSession.getIsAdmin().toString());
			data.put("authCodes_",userSession.getAuthCodes());
			RedisUtil.hmset("token"+token,data);

		}
		json.put("success", true);
		json.put("token", token);
		json.put("isAdmin", userSession.getIsAdmin());
		json.put("authCodes",userSession.getAuthCodes());
		logService.addLog("用户登录", "用户：登录成功！", user.getId(), true);
		return json;
	}
}
