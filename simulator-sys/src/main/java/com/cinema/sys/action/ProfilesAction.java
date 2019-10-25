package com.cinema.sys.action;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.alibaba.fastjson.JSONObject;
import com.cinema.sys.action.util.ActionContext;
import com.cinema.sys.action.util.Service;
import com.cinema.sys.model.Menu;
import com.cinema.sys.model.User;
import com.cinema.sys.model.UserSessionItems;
import com.cinema.sys.service.LoginService;
import com.cinema.sys.service.MenuService;
import com.cinema.sys.service.UserService;

@Component
@Service(name = "profilesAction")
public class ProfilesAction {
	@Autowired
	private MenuService menuService;
	@Autowired 
    private UserService userService;  
	@Autowired 
    private LoginService loginService; 
	
	/**获取当前用户的权限*/
	public JSONObject getCurrentProfiles(ActionContext cxt) {
		JSONObject json = new JSONObject();
		//获取权限和 IsAdmin
		String userId=String.valueOf(cxt.getHttpRequest().getAttribute("userId"));
		User user=userService.getDetail(userId);
		UserSessionItems userSession=loginService.getUserSessionItems(user);
		List<Menu> list = menuService.getListByAuth(userSession.getAuthLevel(),userSession.getAuthCodes());
		json.put("services", list);
		json.put("success", true);
		json.put("userId", userId);
		json.put("userName", user.getName());
		json.put("authCodes", userSession.getAuthCodes());
		return json;
	}
}
