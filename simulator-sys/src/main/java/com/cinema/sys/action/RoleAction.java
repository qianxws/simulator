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
import com.cinema.sys.model.Role;
import com.cinema.sys.model.TreeNode;
import com.cinema.sys.model.base.TRole;
import com.cinema.sys.service.AuthService;
import com.cinema.sys.service.LogService;
import com.cinema.sys.service.RoleAuthService;
import com.cinema.sys.service.RoleService;
import com.cinema.sys.service.RoleUserService;
import com.cinema.sys.service.UserService;
import com.cinema.sys.utils.ExceptionUtil;
import com.cinema.sys.utils.JsonUtil;
import com.cinema.sys.utils.MyParam;
import com.cinema.sys.utils.MyUUID;
import com.cinema.sys.utils.ResourceUtil;
import com.cinema.sys.utils.TimeUtil;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;

/**
 * 角色管理控制层Action
 * 
 * @author ysw
 *
 */
@Component
@Service(name = "roleAction")
public class RoleAction {

	@Autowired
	private RoleService roleService;
	@Autowired 
    private RoleUserService roleUserService; 
	@Autowired
	private RoleAuthService roleAuthService;
	@Autowired
	private AuthService authService;
	@Autowired
	private UserService userService;
	@Autowired
	private LogService logService;
	
	/**
	 * 分页获得角色列表
	 * @param cxt
	 * @return
	 */
	public JSONObject getRolePage(ActionContext cxt) {
		String startTime = MyParam.getString(cxt, "startTime");
		  startTime="".equals(startTime)?"":startTime+" 00:00:00";
		String endTime= MyParam.getString(cxt, "endTime");
		  endTime="".equals(endTime)?"":endTime+" 23:59:59";
		  
		Map<String, Object> paraMap = new HashMap<> ();
		paraMap.put("startTime", TimeUtil.stringToDate(startTime));
		paraMap.put("endTime", TimeUtil.stringToDate(endTime));
		paraMap.put("name", MyParam.getString(cxt, "name").trim());
		paraMap.put("state", MyParam.getInteger(cxt, "repStatus"));

		//分页查询
		PageHelper.startPage(MyParam.getInt(cxt, "page", 1),MyParam.getInt(cxt, "rows", 15));
		Page<Role> p=(Page<Role>)roleService.getList(paraMap);
		JSONObject json = new JSONObject();
		json.put("rows",p.getResult());
		json.put("total", p.getTotal());
		return json;
	}

	
	/**
	 * 保存新增角色
	 * @param cxt
	 * @return
	 */
	public JSONObject saveRole(ActionContext cxt) {
		JSONObject json = new JSONObject();
		
		JSONObject param = MyParam.getJSONObject(cxt);
		String[] authIds =JsonUtil.toArray(param.getJSONArray("menu_role"));
		String[] userIds= JsonUtil.toArray(param.getJSONArray("user_array"));
		
		String userId =String.valueOf(cxt.getHttpRequest().getAttribute("userId"));
		String id = MyParam.getString(cxt, "id");
		if (StringUtils.isEmpty(id)) {
			//新增角色
			TRole role = new TRole();
			role.setId(MyUUID.getUUID());
			role.setName(MyParam.getString(cxt, "name"));
			role.setDescription(MyParam.getString(cxt, "des"));
			role.setState((short)1);
			role.setCreateTime(new Date());
			role.setCreator(userId);
			roleService.insert(role);
			roleUserService.insertUserIds(role.getId(),userIds);
			roleAuthService.insertAuthIds(role.getId(),authIds);
			logService.addLog("新增角色", "新增角色:" + param.getString("name"), userId, true);
		}else {
			//修改角色
			TRole role = roleService.getDetail(id);
			role.setName(MyParam.getString(cxt, "name"));
			role.setDescription(MyParam.getString(cxt, "des"));
			role.setCreateTime(new Date());
			roleService.update(role);
			roleUserService.insertUserIds(role.getId(),userIds);
			roleAuthService.insertAuthIds(role.getId(),authIds);
			logService.addLog("修改角色", "修改角色:" + param.getString("name"), userId, true);
		}
		return json;
	}
	
	
	/**
	 * 删除角色
	 * @param cxt
	 * @return
	 */
	public JSONObject deleteRole(ActionContext cxt) {
		JSONObject json = new JSONObject();
		try {
			JSONArray ids = JSON.parseArray(MyParam.getString(cxt, "ids"));
			if (ids.size() == 0)
				throw new Exception("ids不能为空");
			
			for (int i = 0; i < ids.size(); i++) 
			  roleService.delete(ids.getString(i));
			
			json.put("success", true);
			json.put("message","删除角色成功");
		} catch (Exception e) {
			e.printStackTrace();
			json.put("success", false);
			json.put("message", ExceptionUtil.getDeleteMessage(e, "删除角色失败"));
		}
		logService.addLog("删除角色", cxt, json);
		return json;
	}
	
	/**
	 * 获得角色信息
	 * @param cxt
	 * @return
	 */
	public JSONObject getRoleInfo(ActionContext cxt) {
		JSONObject json = new JSONObject();
		String id = MyParam.getString(cxt, "id");
		json.put("roleInfo", roleService.getDetail(id));
		return json;
	}

	/**
	 * 获得所有用户和角色选择用户
	 * @param cxt
	 * @return
	 */
	public JSONObject getAllUser(ActionContext cxt) {
		JSONObject json = new JSONObject();
		String id = MyParam.getString(cxt, "id");
		json.put("allUser", userService.getAllList());
		if (StringUtils.isNotEmpty(id)) {
			json.put("roleUser", roleUserService.getListByRoleId(id));
		}
		return json;
	}
	

	/**
	 * 获得全部角色以及用户角色
	 * @param cxt
	 * @return
	 */
	public JSONObject getAllRole(ActionContext cxt) {
		JSONObject json = new JSONObject();
		String userId = MyParam.getString(cxt, "userId");
		
		json.put("roleList", roleService.getAllList());
		json.put("userRole", roleUserService.getListByUserId(userId));
		return json;
	}
	
	/**
	 * 获得所有权限树
	 * @return
	 */
	public List<TreeNode> getAllAuthTree(ActionContext cxt) {
		String id = MyParam.getString(cxt, "id");
		List<TreeNode> list=authService.getAuthTree(id);
		return authService.getAuthTree(id);
	}

	
	// 校验角色是否存在
	public void isNotExist(ActionContext cxt){
		String name =cxt.getName();
		String id=cxt.getHttpRequest().getParameter("id");
		ResourceUtil.print(!roleService.exist(id,name), cxt.getHttpResponse());
	}
}
