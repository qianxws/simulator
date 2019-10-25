package com.cinema.sys.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.alibaba.fastjson.JSONObject;
import com.cinema.sys.action.util.ActionContext;
import com.cinema.sys.model.Log;

public interface LogService {
	
	List<Log> getList(Map<String, Object> paraMap);

	/**
	 * 添加日志信息
	 * 
	 * @param alias
	 * @param cxt
	 * @param model
	 */
	void addLog(String alias, ActionContext cxt, JSONObject logJson);

	/**
	 * 添加日志信息
	 * 
	 * @param alias
	 * @param request
	 * @param model
	 * @param method
	 */
	void addLog(String alias, HttpServletRequest request, JSONObject logJson, String method);

	/**
	 * 保存日志
	 * 
	 * @param alias
	 *            ：操作
	 * @param msg
	 *            ：信息
	 * @param userId
	 *            ：用户
	 * @param isSuccess
	 *            ：是否成功
	 */
	void addLog(String alias, String msg, String userId, Boolean isSuccess);

}
