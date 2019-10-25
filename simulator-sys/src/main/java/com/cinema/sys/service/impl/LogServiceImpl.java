package com.cinema.sys.service.impl;

import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSONObject;
import com.cinema.sys.action.util.ActionContext;
import com.cinema.sys.dao.LogMapper;
import com.cinema.sys.model.Log;
import com.cinema.sys.model.UserSessionItems;
import com.cinema.sys.model.base.TLog;
import com.cinema.sys.service.LogService;
import com.cinema.sys.utils.MyUUID;

@Service
public class LogServiceImpl implements LogService {

	@Autowired  
    private LogMapper logDao;

	/**
	 * 查询所有日志
	 */
	@Override
	public List<Log> getList(Map<String, Object> paraMap) {
//		JSONObject json = new JSONObject();
//		json.put("rows",logDao.getList(paraMap));
//		json.put("total", logDao.getTotal(paraMap));
//
//		return json;
		return logDao.getList(paraMap);
	}

	/**
	 * 添加日志
	 * 
	 * @param alias
	 *            操作方式
	 * @param cxt
	 * @param model
	 *            结果参数
	 */
	@Override
	public void addLog(String alias, ActionContext cxt, JSONObject logJson) {
		addLog(alias, cxt.getHttpRequest(), logJson, cxt.getVerb());
	}

	@Override
	public void addLog(String alias, HttpServletRequest request, JSONObject logJson, String method) {
		TLog t= new TLog();
		t.setLogId(MyUUID.getUUID());
		t.setAlias(alias);// 操作方式
		String userId = "";
		if (request.getSession().getAttribute("userSessionItems") == null) {
			userId = request.getParameter("userId");
			
			//test
			userId=userId==null?"admin":userId;
		} else {
			userId = ((UserSessionItems) request.getSession().getAttribute("userSessionItems")).getUser().getId();
		}
		t.setUserId(userId);
		JSONObject model_ = new JSONObject();
		model_.put("success", logJson.getBoolean("success"));
		if (logJson.containsKey("success") && logJson.getBoolean("success")) {
			t.setRep("正常");
			t.setRemark("成功");
		} else {
			t.setRep("失败");
			String message =logJson.getString("message");
			if(StringUtils.isNotEmpty(message) && message.indexOf(";") != -1) {
				message = message.split(";")[0];
			}
			t.setRemark(message);
		}
		t.setLogtime(new Date());
		logDao.insert(t);
		
	}
	
	/**
	 * 保存日志
	 * @param alias	：操作
	 * @param msg	：信息
	 * @param userId	：用户
	 * @param isSuccess	：是否成功
	 */
	@Override
	public void addLog(String alias,String msg, String userId, Boolean isSuccess) {
		TLog t = new TLog();
		t.setLogId(MyUUID.getUUID());
		t.setAlias(alias);
		t.setRep(isSuccess ? "正常" : "异常");
		t.setRemark(msg.length() > 490 ? msg.substring(0, 490) + "..." : msg);
		t.setUserId(userId);
		t.setLogtime(new Date());
		logDao.insert(t);
	}
}
