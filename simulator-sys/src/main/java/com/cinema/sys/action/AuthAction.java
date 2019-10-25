package com.cinema.sys.action;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.cinema.sys.action.util.ActionContext;
import com.cinema.sys.action.util.Service;
import com.cinema.sys.model.TreeNode;
import com.cinema.sys.model.base.TAuth;
import com.cinema.sys.service.AuthService;
import com.cinema.sys.service.LogService;
import com.cinema.sys.utils.ExceptionUtil;
import com.cinema.sys.utils.MyParam;
import com.cinema.sys.utils.MyUUID;
import com.cinema.sys.utils.ResourceUtil;

@Component
@Service(name = "authAction")
public class AuthAction {
	@Autowired
	private AuthService authService;
	@Autowired
	private LogService logService;
	
	/**获取权限数据，填充treetable*/
	public List<TreeNode> getTreeList(ActionContext cxt) {
		Map<String, Object> paraMap = new HashMap<>();
		String parentId=cxt.getId();
		paraMap.put("parentId", parentId=parentId==null ||parentId.equals("")?"0":parentId);
		paraMap.put("name", cxt.getName());
		paraMap.put("code", cxt.getCode());
		if(StringUtils.isNotBlank(cxt.getState())) {
			paraMap.put("state", Integer.parseInt(cxt.getState()));
		}else {
			paraMap.put("state", cxt.getState());
		}
		return authService.getTreeList(paraMap);
	}
	
	/**获取下拉树数据，进行填充tree*/
	public JSONObject getZtreeWithTree(ActionContext cxt) {
		JSONObject model = new JSONObject();
		String parentId=cxt.getId();
		model.put("rows", authService.getZtreeWithTree(parentId));
		model.put("success", true);
		return model;
	}
	
	/**删除权限*/
	public JSONObject removeAuth(ActionContext cxt) throws Exception {
		JSONObject json = new JSONObject();
		try {
			JSONArray ids = JSON.parseArray(MyParam.getString(cxt, "ids"));
			if (ids.size() == 0)
				throw new Exception("ids不能为空");
			
			for (int i = 0; i < ids.size(); i++) { 
			    authService.delete(ids.getString(i));
				List<String> subIds=authService.getSubIds(ids.getString(i));
				for(String subId:subIds)
					authService.delete(subId);
			}
			
			json.put("success", true);
			json.put("message","删除权限成功");
		} catch (Exception e) {
			e.printStackTrace();
			json.put("success", false);
			json.put("message", ExceptionUtil.getDeleteMessage(e, "删除权限失败"));
		}
		logService.addLog("删除权限", cxt, json);
		return json;
	}
	
	/**
	 * 添加权限
	 * @return
	 */
	public JSONObject addAuth(ActionContext cxt) {
		JSONObject json = new JSONObject();
		try {
			TAuth t = JSON.toJavaObject(MyParam.getDataItem(cxt, "dataItem"), TAuth.class);
			t.setAuthId(MyUUID.getUUID());
			t.setCreateTime(new Date());
			t.setCreator(String.valueOf(cxt.getHttpRequest().getAttribute("userId")));
			authService.insert(t);
			
			json.put("success", true);
			json.put("message","添加权限成功");
		} catch (Exception e) {
			e.printStackTrace();
			json.put("success", false);
			json.put("message", ExceptionUtil.getInsertMessage(e, "添加权限失败"));
		}
		logService.addLog("添加权限", cxt, json);
		return json;
	}

	/**
	 * 更新权限
	 * @return
	 */
	public JSONObject updateAuth(ActionContext cxt) {
		JSONObject json = new JSONObject();
		try {
			TAuth t = JSON.toJavaObject(MyParam.getDataItem(cxt, "dataItem"), TAuth.class);
			t.setCreateTime(new Date());
			authService.update(t);
			
			json.put("success", true);
			json.put("message","修改权限成功");
		} catch (Exception e) {
			e.printStackTrace();
			json.put("success", false);
			json.put("message", ExceptionUtil.getUpdateMessage(e, "修改权限失败"));
		}
		logService.addLog("修改权限", cxt, json);
		return json;
	}
	
	// 校验权限是否存在
	public void isNotExist(ActionContext cxt) throws Exception {
		String name =cxt.getName();
		String authId=cxt.getHttpRequest().getParameter("authId");
		authId=authId.equals("")||authId.equals("undefined")?null:authId;
		ResourceUtil.print(!authService.exist(authId,name), cxt.getHttpResponse());
	}

}
