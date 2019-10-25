package com.cinema.sys.controller;

import java.util.Date;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.cinema.sys.action.AreaAction;
import com.cinema.sys.action.LoginAction;
import com.cinema.sys.action.util.ActionContext;
import com.cinema.sys.model.Company;
import com.cinema.sys.model.User;
import com.cinema.sys.model.UserSessionItems;
import com.cinema.sys.service.CompanyService;
import com.cinema.sys.service.LoginService;
import com.cinema.sys.service.UserService;
import com.cinema.sys.utils.MyParam;
import com.cinema.sys.utils.MyTools;
import com.cinema.sys.utils.MyUUID;
import com.cinema.sys.utils.RedisUtil;
import com.cinema.sys.utils.ResourceUtil;
import com.cinema.sys.utils.StrUtil;


/**
 * 公共控制类
 */
@Controller
@RequestMapping("/public")
public class PublicController extends BaseController {
	@Autowired
	private LoginService loginService;
	@Autowired
	private LoginAction loginAction;
	@Autowired
	private AreaAction areaAction;
	@Autowired 
    private UserService userService; 	
	@Autowired 
    private CompanyService companyService; 
	
	/** 用户登录*/
	@RequestMapping("/login")
	@ResponseBody
	public void login(HttpServletRequest request, HttpServletResponse response,String login, String password) {
		JSONObject msgJson = null;
		try {
			msgJson = (JSONObject) loginAction.login(request,  login,  password);
		} catch (Exception e) {
			e.printStackTrace();
		}
		writeJson(msgJson, response);
	}
	
	/** 获得用户权限*/
	@RequestMapping("/getUserAuth")
	@ResponseBody
	public void getUserAuth(HttpSession session, HttpServletResponse response,String token) {
		User user=null;
		Map<String, String> result=RedisUtil.hget("token"+token);
		user=new User();
		if(!result.isEmpty()) {
			user.setId(result.get("userId"));
		}
		if (user.getId() == null) {
			return;
		}
		JSONObject json = new JSONObject();
		json.put("authCodes", loginService.getUserSessionItems(user).getAuthCodes());
		writeJson(json, response);
	}

	@RequestMapping("/logout")
	@ResponseBody
	public void logout(String token, HttpServletRequest request,HttpServletResponse response, HttpSession session) {
		JSONObject json = new JSONObject();
		try {
			if(!StrUtil.isBlank(token))
			  loginAction.logout(token);
			logoutBySession(request);
			json.put("success", true);
		} catch (Exception e) {
			json.put("success", false);
			e.printStackTrace();
		}
		writeJson(json, response);
	}
	
	/**用户退出操作*/
	private void logoutBySession(HttpServletRequest request) throws Exception {
		UserSessionItems userSessionItems = (UserSessionItems) request.getSession().getAttribute("userSessionItems");
		if (userSessionItems != null) {
			JSONObject model = new JSONObject();
			model.put("success", true);
			model.put("message", "退出成功");
			request.getSession().removeAttribute("userSessionItems");
		}
	}

	/** 不存在用户名*/
	@RequestMapping("/notExistUserId")
	@ResponseBody
	public void notExistUserId(HttpServletRequest request,HttpServletResponse response) {
		String userId=request.getParameter("userId");
		ResourceUtil.print(!userService.exist(userId), response);
	}
	
	/** 用户注册*/
	@RequestMapping("/reg")
	@ResponseBody
	public void reg(ActionContext cxt,HttpServletResponse response) {
		JSONObject json = new JSONObject();
		try {
			String companyId=MyUUID.getUUID();
			User user = JSON.toJavaObject(MyParam.getDataItem(cxt, "dataItem"), User.class);
			// 如果前端传入新密码，则修改
			if (StringUtils.isNotBlank(user.getPassword())) 
				user.setPassword(MyTools.password(user.getPassword()));
			
			user.setCreatetime(new Date());
			user.setEnabled((short)1);
			user.setCompanyId(companyId);
			user.setUpdatetime(new Date());
			userService.insert(user);
			
			Company company=new Company();
			company.setId(companyId);
			company.setAreaId(user.getAreaId());
			company.setName(user.getCompanyName());
			company.setNid(companyService.getMaxNid());
			company.setCreateTime(new Date());
			company.setCreator(user.getId());
			company.setContact(user.getId());
			companyService.insert(company);
			
			
			String errMessage = "";
			json.put("msg", errMessage);
			json.put("success", true);
		} catch (Exception e) {
			json.put("success", false);
			e.printStackTrace();
		}
		writeJson(json, response);
	}
	
	/**省下拉菜单*/
	@RequestMapping("/getProvinceOptions")
	@ResponseBody
	public void getProvinceOptions(ActionContext cxt,HttpServletResponse response) {
		JSONObject msgJson = null;
		try {
			msgJson = (JSONObject) areaAction.getProvinceOptions(cxt);
		} catch (Exception e) {
			e.printStackTrace();
		}
		writeJson(msgJson, response);
	}
	
	/**市下拉菜单*/
	@RequestMapping("/getCityOptions")
	@ResponseBody
	public void getCityOptions(ActionContext cxt,HttpServletResponse response) {
		JSONObject msgJson = null;
		try {
			msgJson = (JSONObject) areaAction.getCityOptions(cxt);
		} catch (Exception e) {
			e.printStackTrace();
		}
		writeJson(msgJson, response);
	}
}
