package com.cinema.sys.action.util;

import java.lang.reflect.InvocationTargetException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.alibaba.fastjson.JSONObject;
import com.cinema.sys.model.UserSessionItems;
import com.cinema.sys.service.AuthService;
import com.cinema.sys.utils.ConfigUtil;
import com.cinema.sys.utils.RedisUtil;
import com.cinema.sys.utils.ServletUtil;
import com.cinema.sys.utils.SpringBeanUtil;



public class ActionProcessor {
	private static final Logger LOG = LoggerFactory.getLogger(ActionProcessor.class);
	private final AuthService authService = SpringBeanUtil.getBean(AuthService.class);
	
	private HttpServletRequest request;

	private ActionContext cxt;
	private HttpServletResponse response;
	

	public ActionProcessor(ActionContext cxt, HttpServletRequest request, HttpServletResponse response) {
		this.request = request;
		this.response = response;
		this.cxt = cxt;
	}

	public void execute() {
		String action = cxt.getAction();
		String verb = cxt.getVerb();
		
		
		JSONObject model = null;
		String msg = ""; // 原始异常
		try {
			cxt.setHttpRequest(request);
			cxt.setHttpResponse(response);

			String newAction=","+action.replace("Action", ",").toLowerCase();
			String auths=","+authService.getAllAuths().toLowerCase();
			//如果当前Action在权限列表中存在，则需要进行权限验证。
			if(auths.indexOf(newAction)>-1) {
				//这里获取到的是调用的ACTION类名
				
				UserSessionItems userSession = (UserSessionItems) request.getSession().getAttribute("userSessionItems");
				String authCodes="";
				if (userSession != null) {
					authCodes=userSession.getAuthCodes();
				}
				if(ConfigUtil.ISTOKEN==1){
					String token = request.getParameter("token");
					Map<String, String> result=RedisUtil.hget("token"+token);
					//这里判断 权限 和路径是否匹配，如果匹配则显示页面，如果不匹配则返回错误信息
					authCodes=result.get("authCodes_");
				}

				authCodes=","+authCodes.toLowerCase();
//				//截取掉action的后缀
//				String newaction=action.replace("Action", "");
//				//此处进行转换成小写
//				String newActionName=newaction.toLowerCase();
				//和路径进行比对,如果不存在就表示没有权限
				if(authCodes.indexOf(newAction)<=-1) {
					throw new Exception("对不起，您没有权限访问该页面！");
				}
			}
			
			//如果上面走完正常，表示有权限，则进行查询返回数据
			Object object = ActionCache.invoke(action, verb, cxt, request);

			if (object instanceof JSONObject) {
				model = (JSONObject) object;
			} else if (object instanceof List) {
				ServletUtil.print(object, response);
				return;
			} else {
				// void
				return;
			}
			
			if (model != null) {
				if (model.get("success") == null) {
					model.put("success", true);
				}
			}
			
			
		} catch (Exception e) {
			if (LOG.isDebugEnabled()) {
				e.printStackTrace();
			}
			LOG.error("execute err " + e.getMessage());

			if (model == null) {
				model = new JSONObject();
			}
			model.clear();
			model.put("success", false);

			if (e instanceof InvocationTargetException) {
				msg = ((InvocationTargetException) e).getTargetException().getMessage();
			} else {
				msg = e.getMessage();
				if (StringUtils.isBlank(msg)) {
					msg = String.valueOf(e);
				}
			}
			// 异常转译中文
			model.put("message", msg);
			LOG.error("execute err, Exception/" + action + "/" + verb);
		}
		ServletUtil.print(model, response);
	}
	
//	public void executePublic() {
//		String action = cxt.getAction();
//		String verb = cxt.getVerb();
//		
//		
//		JSONObject model = null;
//		String msg = ""; // 原始异常
//		try {
//			cxt.setHttpRequest(request);
//			cxt.setHttpResponse(response);
//			Object object = ActionCache.invoke(action, verb, cxt, request);
//
//			if (object instanceof JSONObject) {
//				model = (JSONObject) object;
//			} else if (object instanceof List) {
//				ServletUtil.print(object, response);
//				return;
//			} else {
//				// void
//				return;
//			}
//			
//			if (model != null) {
//				if (model.get("success") == null) {
//					model.put("success", true);
//				}
//			}
//			
//			
//		} catch (Exception e) {
//			if (LOG.isDebugEnabled()) {
//				e.printStackTrace();
//			}
//			LOG.error("execute err " + e.getMessage());
//
//			if (model == null) {
//				model = new JSONObject();
//			}
//			model.clear();
//			model.put("success", false);
//
//			if (e instanceof InvocationTargetException) {
//				msg = ((InvocationTargetException) e).getTargetException().getMessage();
//			} else {
//				msg = e.getMessage();
//				if (StringUtils.isBlank(msg)) {
//					msg = String.valueOf(e);
//				}
//			}
//			// 异常转译中文
//			model.put("message", msg);
//			LOG.error("execute err, Exception/" + action + "/" + verb);
//		}
//		ServletUtil.print(model, response);
//	}
}