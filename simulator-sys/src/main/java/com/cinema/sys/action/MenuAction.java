package com.cinema.sys.action;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.cinema.sys.action.util.ActionContext;
import com.cinema.sys.action.util.Service;
import com.cinema.sys.model.Menu;
import com.cinema.sys.model.base.TAuth;
import com.cinema.sys.model.base.TMenu;
import com.cinema.sys.service.AuthService;
import com.cinema.sys.service.LogService;
import com.cinema.sys.service.MenuService;
import com.cinema.sys.utils.MyParam;
import com.cinema.sys.utils.MyUUID;
import com.cinema.sys.utils.ResourceUtil;

@Component
@Service(name = "menuAction")
public class MenuAction {
	@Autowired
	private MenuService menuService;
	@Autowired
	private AuthService authService;
	@Autowired
	private LogService logService;

	/**
	 * 获得所有菜单
	 * @return
	 */
	public List<Menu> getAllMenu(ActionContext cxt) {
		return menuService.getTreeList();
	
	}
	
	public List<Menu> getAllMenus(ActionContext cxt) {
		return menuService.getTreeLists();
	}
	
	// 根据pid,查询子节点
	public List<Menu> getMenusBypid(ActionContext cxt){
		String id = cxt.getMenuid();
		// id判断
		if(id=="" || id==null) {
			id = "0";
		}
		List<Menu> menuList = menuService.getMenuByPid(id);
		
		return menuList;
	}
	
	// 根据id,查询节点
	public List<Menu> getMenusByid(ActionContext cxt){
		String id = MyParam.getString(cxt, "menuid");
		Menu m = menuService.getMenuByid(id);
		List<Menu> menuList = new ArrayList<Menu>();
		menuList.add(m);
		return menuList;
	}
	
	/**
	 * 修改菜单
	 * @return
	 */
	public JSONObject editMenu(ActionContext cxt) {
		TMenu t = JSON.toJavaObject(MyParam.getDataItem(cxt, "dataItem"), TMenu.class);
		String userId = String.valueOf(cxt.getHttpRequest().getAttribute("userId"));
		
		menuService.update(t);

		logService.addLog("修改菜单", "修改菜单:" + t.getName(), userId, true);
		return new JSONObject();
	}
	
	/**
	 * 创建菜单
	 * @return
	 */
	public JSONObject addMenu(ActionContext cxt) {
		TMenu t = JSON.toJavaObject(MyParam.getDataItem(cxt, "dataItem"), TMenu.class);
		String userId = String.valueOf(cxt.getHttpRequest().getAttribute("userId"));
		
		Integer cseq = menuService.getMaxCseq(t.getPid()) + 1;
		
		t.setMenuid(MyUUID.getUUID());
		t.setCseq(cseq.shortValue());
		t.setCreatetime(new Date());
		t.setCreator(userId);
		t.setUpdatetime(new Date());
		t.setUpdator(userId);
		
		menuService.insert(t);
		
		//同时将Menu添加到Auth
		TAuth tauth =new TAuth();
		tauth.setName(t.getName());
		tauth.setCode(t.getCode());
		tauth.setParentId("0");
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
	 * @return
	 */
	public JSONObject updateMenus(ActionContext cxt) {
		
		String id = MyParam.getString(cxt, "id");
		String pid = MyParam.getString(cxt, "pid");
		
		
		//更新pid
		TMenu t = menuService.getMenuByid(id);
		t.setPid(pid);
		menuService.update(t);
		
		return new JSONObject();
	}
	
	/**
	 * 更新排序
	 * @return
	 */
	public JSONObject updateCseq(ActionContext cxt) {
		
		String id = MyParam.getString(cxt, "id");
		String pid = MyParam.getString(cxt, "pid");
		String nodeIdList = MyParam.getString(cxt, "nodeIdList");
		
		String nodes = nodeIdList.replaceAll("\"", "").replaceAll("\\[", "").replaceAll("\\]", "");
		String[] nodearr = nodes.split(",");
		for (short i=0;i<nodearr.length;i++) {
			TMenu t = menuService.getMenuByid(nodearr[i]);
			
			t.setCseq(i);
			menuService.update(t);
		}
		
		//更新pid
		TMenu t = menuService.getMenuByid(id);
		t.setPid(pid);
		menuService.update(t);
		
		
		return new JSONObject();
	}
	
	/**
	 * 删除菜单
	 * @return
	 */
	public JSONObject deleteMenu(ActionContext cxt) {
		String menuid = MyParam.getString(cxt, "menuid");
		menuService.delete(menuid);
		return new JSONObject();
	}
	
	// 校验菜单是否存在
	public void isNotExist(ActionContext cxt){
		String name =cxt.getName();
		String menuid=cxt.getHttpRequest().getParameter("menuid");
		ResourceUtil.print(!menuService.exist(menuid,name), cxt.getHttpResponse());
	}
}
