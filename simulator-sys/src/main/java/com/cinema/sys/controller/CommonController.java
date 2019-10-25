package com.cinema.sys.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.alibaba.fastjson.JSONObject;
import com.cinema.sys.action.LoginAction;
import com.cinema.sys.action.util.ActionCache;
import com.cinema.sys.action.util.ActionContext;
import com.cinema.sys.action.util.ActionProcessor;
import com.cinema.sys.action.util.Service;
import com.cinema.sys.model.UserSessionItems;


/**
 * 公共控制类
 */
@Controller
public class CommonController extends BaseController {

	
	/*
	 * web请求异步ajax业务处理
	 */
	@RequestMapping("/commMods/ajax")
	@ResponseBody
	public void ajax(ActionContext cxt, HttpServletRequest request, HttpServletResponse response) {
		init(request);
		
		
		ActionProcessor processor = new ActionProcessor(cxt, request, response);
		processor.execute();
	}

	void init(HttpServletRequest request) {
		if (ActionCache.getServiceMap() == null || ActionCache.getServiceMap().isEmpty()
				|| ActionCache.getServiceMap().entrySet() == null
				|| ActionCache.getServiceMap().entrySet().size() <= 0) {
			WebApplicationContext applicationContext = WebApplicationContextUtils
					.getWebApplicationContext(request.getServletContext());
			Map<String, Object> serviceBeansMap = applicationContext.getBeansWithAnnotation(Service.class);
			for (Object bean : serviceBeansMap.values()) {
				ActionCache.registerBean(bean);
			}
		}
	}

}
