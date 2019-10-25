package com.cinema.sys.action;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.cinema.sys.action.util.ActionContext;
import com.cinema.sys.action.util.Service;
import com.cinema.sys.model.FrontMenu;
import com.cinema.sys.model.base.TAuth;
import com.cinema.sys.model.base.TFrontMenu;
import com.cinema.sys.service.AuthService;
import com.cinema.sys.service.FrontMenuService;
import com.cinema.sys.service.LogService;
import com.cinema.sys.utils.MyParam;
import com.cinema.sys.utils.MyUUID;
import com.cinema.sys.utils.RedisUtil;
import com.cinema.sys.utils.ResourceUtil;

@Component
@Service(name = "frontMenuAction")
public class FrontMenuAction {

	@Autowired
	private FrontMenuService frontmenuService;
	@Autowired
	private AuthService authService;
	@Autowired
	private LogService logService;

	/**
	 * 获得所有菜单
	 * 
	 * @return
	 */
	public List<FrontMenu> getAllMenu(ActionContext cxt) {
		String token = cxt.getHttpRequest().getParameter("token");
		Map<String, String> result = RedisUtil.hget("token" + token);

		String authCodes = String.valueOf(result.get("authCodes_"));
		List<FrontMenu> list = frontmenuService.getTreeList(Arrays.asList(authCodes.split(",")));
		return list;
	}

	public List<FrontMenu> getAllMenus(ActionContext cxt) {
		return frontmenuService.getTreeLists();
	}

	// 根据pid,查询子节点
	public List<FrontMenu> getMenusBypid(ActionContext cxt) {
		String id = cxt.getMenuid();
		// id判断
		if (id == "" || id == null) {
			id = "0";
		}
		List<FrontMenu> menuList = frontmenuService.getMenuByPid(id);

		return menuList;
	}

	// 根据id,查询节点
	public List<FrontMenu> getMenusByid(ActionContext cxt) {
		String id = MyParam.getString(cxt, "menuid");
		FrontMenu m = frontmenuService.getMenuByid(id);
		List<FrontMenu> menuList = new ArrayList<FrontMenu>();
		menuList.add(m);
		return menuList;
	}

	/**
	 * 修改菜单
	 * 
	 * @return
	 */
	public JSONObject editMenu(ActionContext cxt) {
		TFrontMenu t = JSON.toJavaObject(MyParam.getDataItem(cxt, "dataItem"), TFrontMenu.class);
		String userId = String.valueOf(cxt.getHttpRequest().getAttribute("userId"));

		TFrontMenu frontMenu = frontmenuService.getMenuByid(t.getMenuid());
		t.setIsopen(frontMenu.getIsopen());
		t.setUpdatetime(new Date());
		t.setUpdator(userId);

		frontmenuService.update(t);

		logService.addLog("修改菜单", "修改菜单:" + t.getName(), userId, true);
		return new JSONObject();
	}

	/**
	 * 创建菜单
	 * 
	 * @return
	 */
	public JSONObject addMenu(ActionContext cxt) {
		TFrontMenu t = JSON.toJavaObject(MyParam.getDataItem(cxt, "dataItem"), TFrontMenu.class);
		String userId = String.valueOf(cxt.getHttpRequest().getAttribute("userId"));

		Integer cseq = frontmenuService.getMaxCseq(t.getPid()) + 1;

		t.setMenuid(MyUUID.getUUID());
		t.setCseq(cseq.shortValue());
		t.setCreatetime(new Date());
		t.setCreator(userId);
		t.setUpdatetime(new Date());
		t.setUpdator(userId);
		t.setIsopen((short) 0);

		// 设置图标
		if (t.getPid().equals("0")) {
			String[] iconCls = { "glyphicon glyphicon-align-justify", "fa fa-cogs", "fa fa-book", "fa fa-gavel",
					"fa fa-desktop", "fa fa-tag", "fa fa-picture-o", "fa fa-folder", "fa fa-list", "fa fa-briefcase",
					"glyphicon glyphicon-book", "glyphicon glyphicon-inbox" };
			int index = (int) (Math.random() * iconCls.length);
			String icon = iconCls[index];
			t.setIcon(icon);
		}
		frontmenuService.insert(t);

		// 同时将Menu添加到Auth
		TAuth tauth = new TAuth();
		tauth.setName(t.getName());
		tauth.setCode(t.getCode());
		if (t.getPid().equals("0")) {
			tauth.setParentId("35");
		} else {
			tauth.setParentId(t.getPid());
		}
		tauth.setState(t.getEnabled());
		tauth.setAuthId(t.getMenuid());
		tauth.setCreateTime(t.getCreatetime());
		tauth.setCreator(t.getCreator());
		authService.insert(tauth);

		logService.addLog("新增菜单", "新增菜单:" + t.getName(), userId, true);
		return new JSONObject();
	}

	/**
	 * 更新pid，排序
	 * 
	 * @return
	 */
	public JSONObject updateMenus(ActionContext cxt) {

		String id = MyParam.getString(cxt, "id");
		String pid = MyParam.getString(cxt, "pid");

		// 更新pid
		TFrontMenu t = frontmenuService.getMenuByid(id);
		t.setPid(pid);
		frontmenuService.update(t);

		return new JSONObject();
	}

	/**
	 * 更新排序
	 * 
	 * @return
	 */
	public JSONObject updateCseq(ActionContext cxt) {

		String id = MyParam.getString(cxt, "id");
		String pid = MyParam.getString(cxt, "pid");
		String nodeIdList = MyParam.getString(cxt, "nodeIdList");

		String nodes = nodeIdList.replaceAll("\"", "").replaceAll("\\[", "").replaceAll("\\]", "");
		String[] nodearr = nodes.split(",");
		for (short i = 0; i < nodearr.length; i++) {
			TFrontMenu t = frontmenuService.getMenuByid(nodearr[i]);

			t.setCseq(i);
			frontmenuService.update(t);
		}

		// 更新pid
		TFrontMenu t = frontmenuService.getMenuByid(id);
		t.setPid(pid);
		frontmenuService.update(t);

		return new JSONObject();
	}

	/**
	 * 删除菜单
	 * 
	 * @return
	 */
	public JSONObject deleteMenu(ActionContext cxt) {
		String menuid = MyParam.getString(cxt, "menuid");
		frontmenuService.delete(menuid);
		return new JSONObject();
	}

	// 校验菜单是否存在
	public void isNotExist(ActionContext cxt) {
		String name = cxt.getName();
		String menuid = cxt.getHttpRequest().getParameter("menuid");
		ResourceUtil.print(!frontmenuService.exist(menuid, name), cxt.getHttpResponse());
	}
}
