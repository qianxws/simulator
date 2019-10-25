package com.cinema.sys.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.alibaba.fastjson.JSONObject;
import com.cinema.sys.dao.RoleUserMapper;
import com.cinema.sys.model.UserSessionItems;
import com.cinema.sys.service.UserService;
import com.cinema.sys.utils.ConfigUtil;
import com.cinema.sys.utils.HttpUtil;
import com.cinema.sys.utils.RedisUtil;

public class SecurityInterceptor extends HandlerInterceptorAdapter {

	@Autowired
	private UserService userService;
	@Autowired  
    private RoleUserMapper roleUserDao;  
	private List<String> excludeUrls; // 直接通过路径
	private List<String> startsWithExcludeUrls; // 模糊过滤路径


	private List<String> authUrls; // 需要验证
	private List<String> startsWithAuthUrls; // 需要验证，模糊过滤路径

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object obj) throws Exception {
		//在业务处理器处理请求之前被调用
		response.setHeader("Access-Control-Allow-Origin", "*");
		response.setHeader("Access-Control-Allow-Methods", "POST,GET,OPTIONS,DELETE");
		response.setHeader("Access-Control-Max-Age", "3600");
		response.setHeader("Access-Control-Allow-Headers", "x-requested-with");
		
		String servletPath = request.getServletPath();
		if ((authUrls.contains(servletPath) || this.isContainsAuthUrls(servletPath))
			&& !(excludeUrls.contains(servletPath) || this.isContains(servletPath))){
		  try {
				String userId=null;
				Map<String, String> result=new HashMap<String,String>();
				if(ConfigUtil.ISTOKEN==1){
					//请求参数中是否有token
					String token = request.getParameter("token");
					if (StringUtils.isEmpty(token)) {
						throw new Exception("token is null");
					}
					result=RedisUtil.hget("token"+token);
				}
				else{
					UserSessionItems userSessionItems =(UserSessionItems)request.getSession().getAttribute("userSessionItems");
					result.put("userId", userSessionItems.getUser().getId());
					result.put("isAdmin", userSessionItems.getIsAdmin().toString());
					result.put("authCodes", userSessionItems.getAuthCodes());
				}

				if(!result.isEmpty()) {
					userId=result.get("userId");
					if(result.get("isAdmin").equals("1")) {
						request.setAttribute("isAdmin", true);
					}else {
						request.setAttribute("isAdmin", false);
					}
					request.setAttribute("userId",userId);
				}
				
				if (StringUtils.isEmpty(userId)) {
					throw new Exception("token is expired");
				}
				return true;
			}catch(Exception ex) {
				System.out.println("登录出错：" + ex.getMessage());
				if ("GET".equals(request.getMethod())) {
					//get请求，从定向到登录页面
					//response.sendRedirect(request.getContextPath() + "/front/view/login.html");
					String str=request.getContextPath() + "/login.html";
					response.sendRedirect(request.getContextPath() + "/login.html");
				}else {
					//post请求返回错误信息
					JSONObject json = new JSONObject();
					json.put("success", false);
					json.put("message", "重新登录");
					json.put("error", ex.getMessage());
					HttpUtil.print(json, response);
				}
				return false;
			}
		} else {
			return true;
		}
	}

	/**
	 * 模糊匹配路径是否能直接通过过滤器
	 * 
	 * @param path
	 * @return
	 */
	private boolean isContains(String path) {
		path+="/";
		for (String url : startsWithExcludeUrls) {
			if (path.startsWith(url)) {
				return true;
			}
		}
		return false;
	}
	
	private boolean isContainsAuthUrls(String path) {
		path+="/";
		for (String url : startsWithAuthUrls) {
			if (path.startsWith(url)) {
				return true;
			}
		}
		return false;
	}

	public List<String> getExcludeUrls() {
		return excludeUrls;
	}

	public void setExcludeUrls(List<String> excludeUrls) {
		this.excludeUrls = excludeUrls;
	}

	public List<String> getStartsWithExcludeUrls() {
		return startsWithExcludeUrls;
	}

	public void setStartsWithExcludeUrls(List<String> startsWithExcludeUrls) {
		this.startsWithExcludeUrls = startsWithExcludeUrls;
	}
	
	public List<String> getAuthUrls() {
		return authUrls;
	}

	public void setAuthUrls(List<String> authUrls) {
		this.authUrls = authUrls;
	}

	public List<String> getStartsWithAuthUrls() {
		return startsWithAuthUrls;
	}

	public void setStartsWithAuthUrls(List<String> startsWithAuthUrls) {
		this.startsWithAuthUrls = startsWithAuthUrls;
	}
}
