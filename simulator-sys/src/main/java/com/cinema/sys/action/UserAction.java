package com.cinema.sys.action;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.cinema.sys.action.util.ActionContext;
import com.cinema.sys.action.util.Service;
import com.cinema.sys.model.User;
import com.cinema.sys.model.base.TUser;
import com.cinema.sys.service.LogService;
import com.cinema.sys.service.RoleAuthService;
import com.cinema.sys.service.RoleUserService;
import com.cinema.sys.service.UserService;
import com.cinema.sys.utils.ConfigUtil;
import com.cinema.sys.utils.ExceptionUtil;
import com.cinema.sys.utils.JsonUtil;
import com.cinema.sys.utils.MyParam;
import com.cinema.sys.utils.MyTools;
import com.cinema.sys.utils.ResourceUtil;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;



@Component
@Service(name = "userAction")
public class UserAction {

	@Autowired 
    private UserService userService;  
	@Autowired 
    private RoleUserService roleUserService; 
	@Autowired
	private LogService logService;
	
	public JSONObject getUser(ActionContext cxt) {
		JSONObject model = new JSONObject();
		User t = userService.getDetail(MyParam.getString(cxt, "userId"));
		model.put("userInfo", t);
		return model;
	}

	/**
	 * @Description : 获取户管理界面信息
	 * @author : 
	 * @time : 
	 */
	public JSONObject getAllUsers(ActionContext cxt)  {
		Map<String, Object> paraMap = new HashMap<> ();
		paraMap.put("id", MyParam.getString(cxt, "id").trim());
		paraMap.put("name", MyParam.getString(cxt, "name").trim());
		paraMap.put("enabled", MyParam.getInteger(cxt, "repStatus"));
		
		//分页查询
		PageHelper.startPage(MyParam.getInt(cxt, "page", 1),MyParam.getInt(cxt, "rows", 15));
		Page<User> p=(Page<User>)userService.getList(paraMap);
		JSONObject json = new JSONObject();
		json.put("rows",p.getResult());
		json.put("total", p.getTotal());
		return json;
	}
	
	/**
	 * @Description : 对用户管理界面进行删除操作
	 * @author :
	 * @time : 
	 */
	public JSONObject delUser(ActionContext cxt) {
		JSONObject json = new JSONObject();
		try {
			JSONArray ids = JSON.parseArray(MyParam.getString(cxt, "ids"));
			if (ids.indexOf(ConfigUtil.ROOT_ID) != -1) 
				throw new Exception("不能删除" + ConfigUtil.ROOT_ID + "用户");
			if (ids.size() == 0) 
				throw new Exception("ids不能为空");
			
			for (int i = 0; i < ids.size(); i++) 
			  userService.delete(ids.getString(i));
			
			json.put("success", true);
			json.put("message","删除用户成功");
		} catch (Exception e) {
			e.printStackTrace();
			json.put("success", false);
			json.put("message", ExceptionUtil.getDeleteMessage(e, "删除用户失败"));
		}
		logService.addLog("删除用户", cxt, json);
		return json;
	}

	/**
	 * 新增用户
	 */
	public JSONObject addUser(ActionContext cxt) {
		JSONObject json = new JSONObject();
		try {
			String userId=String.valueOf(cxt.getHttpRequest().getAttribute("userId"));
			TUser t = JSON.toJavaObject(MyParam.getDataItem(cxt, "dataItem"), TUser.class);
			// 如果前端传入新密码，则修改
			if (StringUtils.isNotBlank(t.getPassword())) 
				t.setPassword(MyTools.password(t.getPassword()));
			
			t.setCreatetime(new Date());
			t.setCreator(userId);
			t.setUpdator(userId);
			t.setUpdatetime(new Date());
			userService.insert(t);
			
			//添加用户角色
			String[] roleIds=JsonUtil.toArray(MyParam.getJSONObject(cxt).getJSONArray("role"));
			roleUserService.insertRoleIds(t.getId(), roleIds);
			
			json.put("success", true);
			json.put("message","添加用户成功");
		} catch (Exception e) {
			e.printStackTrace();
			json.put("success", false);
			json.put("message", ExceptionUtil.getInsertMessage(e, "添加用户失败"));
		}
		logService.addLog("添加用户", cxt, json);
		return json;
	}

	/**
	 * @Description : 对用户管理界面进行修改操作
	 * @author : 
	 * @time : 
	 */
	public JSONObject updateUser(ActionContext cxt) {
		JSONObject json = new JSONObject();
		try {
			String userId=String.valueOf(cxt.getHttpRequest().getAttribute("userId"));
			TUser t = JSON.toJavaObject(MyParam.getDataItem(cxt, "dataItem"), TUser.class);
			
			// 如果前端传入新密码，则修改
			if (StringUtils.isNotBlank(t.getPassword())) 
				t.setPassword(MyTools.password(t.getPassword()));
			else
				t.setPassword(null);
			
			t.setUpdator(userId);
			t.setCreatetime(new Date());
			userService.update(t);
			
			//添加用户角色
			String[] roleIds =JsonUtil.toArray(MyParam.getJSONObject(cxt).getJSONArray("role"));
			roleUserService.insertRoleIds(t.getId(), roleIds);
			
			json.put("success", true);
			json.put("message","修改用户成功");
		} catch (Exception e) {
			e.printStackTrace();
			json.put("success", false);
			json.put("message", ExceptionUtil.getUpdateMessage(e, "修改用户失败"));
		}
		logService.addLog("修改用户", cxt, json);
		return json;
	}
	
	// 校验角色是否存在
	public void isNotExist(ActionContext cxt) throws Exception {
		String userId =cxt.getId();
		boolean isNotExist=!userService.exist(userId);
		ResourceUtil.print(isNotExist, cxt.getHttpResponse());
	}
}
