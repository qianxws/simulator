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
import com.cinema.sys.utils.MyTools;
import com.cinema.sys.utils.MyUUID;
import com.cinema.sys.utils.ResourceUtil;


/**我的密码模块Action层*/
@Component
@Service(name = "myChangePasswordAction")
public class MyChangePasswordAction {

	@Autowired
	private UserService userService;
	@Autowired
	private LogService logService;
	
	public JSONObject getUserId(ActionContext cxt) {
		JSONObject json = new JSONObject();
		json.put("userId",String.valueOf(cxt.getHttpRequest().getAttribute("userId")));
		return json;
	}
	
	/**更新*/
	public void checkPassword(ActionContext cxt) {
		String userId=String.valueOf(cxt.getHttpRequest().getAttribute("userId"));
		String password=cxt.getHttpRequest().getParameter("currentPassword");
		ResourceUtil.print(!(null==userService.getDetail(userId,password)), cxt.getHttpResponse());
	}
	
	/**更新*/
	public JSONObject changePassword(ActionContext cxt) {
		JSONObject json = new JSONObject();
		try {
			String userId=MyParam.getString(cxt, "userId");
			String password=MyParam.getString(cxt, "currentPassword");
			String newPassword=MyParam.getString(cxt, "newPassword");
			if(!(null==userService.getDetail(userId,password))){
				TUser t=new TUser();
				t.setId(userId);
				t.setPassword(MyTools.password(newPassword));
				userService.update(t);
			}
			json.put("success", true);
			json.put("message","修改密码成功");
		} catch (Exception e) {
			e.printStackTrace();
			json.put("message", ExceptionUtil.getUpdateMessage(e, "修改密码失败"));
			json.put("success", false);
		}
		logService.addLog("修改密码", cxt, json);
		return json;
	}
}
