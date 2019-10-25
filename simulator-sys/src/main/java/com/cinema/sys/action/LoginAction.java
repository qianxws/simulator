package com.cinema.sys.action;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.cinema.sys.service.LogService;
import com.cinema.sys.service.LoginService;
import com.cinema.sys.utils.HttpUtil;
import com.cinema.sys.utils.RedisUtil;

@Component("loginAction")
public class LoginAction {
	private static final Logger logger = LoggerFactory.getLogger(LoginAction.class);

	@Autowired 
    private LoginService loginService;  
	@Autowired
	private LogService logService;
	
	/**
	 * 登录系统
	 * 
	 * @param request
	 * @param loginId
	 * @param password
	 * @param ValidateCode
	 * @return
	 * */
	@ResponseBody
	@RequestMapping("/login")
	public Object login(HttpServletRequest request, String login, String password) {
		JSONObject json = new JSONObject();
		try {
			//判断用户名、密码、验证码不能为空
			if (StringUtils.isEmpty(login)) {
				throw new Exception("用户名不能为空！");
			}
			if (StringUtils.isEmpty(password)) {
				throw new Exception("密码不能为空！");
			}
			//调用登录接口
			json = loginService.login(request,HttpUtil.getRemoteHost(request), login, password);
		} catch (Exception e) {
			logger.error(e.getMessage());
			json.put("success", false);
			json.put("message", e.getMessage());
		}
		return json;
	}
	
	
	
	/**
	 * 用户退出操作
	 * 
	 * @param request
	 * @throws Exception
	 */
	@RequestMapping("/logout")
	@ResponseBody
	public void logout(String token) throws Exception {
		String userId=null;
		Map<String, String> result=RedisUtil.hget(token);
		if(!result.isEmpty()){
			userId=result.get("userId");
		}
		RedisUtil.delInfo("token"+token);
		logService.addLog("用户退出", "用户：退出成功！", userId, true);
	}
}
