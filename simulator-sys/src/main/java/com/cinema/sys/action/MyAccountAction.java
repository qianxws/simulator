package com.cinema.sys.action;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.cinema.sys.action.util.ActionContext;
import com.cinema.sys.action.util.Service;
import com.cinema.sys.model.User;
import com.cinema.sys.model.base.TUser;
import com.cinema.sys.service.LogService;
import com.cinema.sys.service.UserService;
import com.cinema.sys.utils.ExceptionUtil;
import com.cinema.sys.utils.MyParam;
import com.cinema.sys.utils.MyUUID;


/**我的账号模块Action层*/
@Component
@Service(name = "myAccountAction")
public class MyAccountAction {

	@Autowired
	private UserService userService;
	@Autowired
	private LogService logService;

	public JSONObject getDetail(ActionContext cxt) {
		String userId=String.valueOf(cxt.getHttpRequest().getAttribute("userId"));
		JSONObject json = new JSONObject();
		User user=userService.getDetail(userId);
		user.setPassword(null);
		json.put("model",user);
		return json;
	}
	
	/**更新*/
	public JSONObject update(ActionContext cxt) {
		JSONObject json = new JSONObject();
		try {
			TUser t = JSON.toJavaObject(MyParam.getDataItem(cxt, "dataItem"), TUser.class);
			userService.update(t);
			
			json.put("success", true);
			json.put("message","修改账号成功");
		} catch (Exception e) {
			e.printStackTrace();
			json.put("message", ExceptionUtil.getUpdateMessage(e, "修改账号失败"));
			json.put("success", false);
		}
		logService.addLog("修改账号", cxt, json);
		return json;
	}
}
