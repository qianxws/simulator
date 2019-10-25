package com.cinema.sys.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.cinema.sys.dao.MenuMapper;
import com.cinema.sys.model.Menu;
import com.cinema.sys.model.User;
import com.cinema.sys.model.base.TMenu;
import com.cinema.sys.service.MenuService;
import com.cinema.sys.utils.ConfigUtil;

@Service
public class MenuServiceImpl implements MenuService {
	@Autowired  
    private MenuMapper menuDao;

	@Override
	public int delete(String menuid) {
		return menuDao.deleteByPrimaryKey(menuid);
	}
	
	@Override
	public int insert(TMenu t) {
		return menuDao.insertSelective(t);
	}

	@Override
	public int update(TMenu t) {
		return menuDao.updateByPrimaryKeySelective(t);
	}
	
	@Override
    public Menu getDetail(String menuid) {  
        return menuDao.getDetail(menuid);
    }
	
	@Override
	public List<Menu> getTreeList() {
		//获得所有一级菜单
		List<Menu> pMenu = menuDao.getTopList();
		
		for (Menu menu : pMenu) 
			menu.setMenuList(menuDao.getChildList(menu.getMenuid()));
		
		return pMenu;
	}
	
	@Override
	public List<Menu> getTreeLists() {
		List<Menu> menus = getAllMenu();
		
		return menus;
	}
	
	// 根据登录用户权限获取相应的菜单
	@Override
	public List<Menu> getListByAuth(String authLevel,String authCodes) {
		return menuDao.getListByAuth(authLevel,"," + authCodes);
	}
	
	@Override
	public List<Menu> getAllMenu()
	{
		List<Menu> allMenus = menuDao.getAllMenus();
		return allMenus;
	}
	
	/**
	 * 更新排序
	 * @param array
	 */
	@Override
	public void updateCseq(JSONArray array) {
		if (array != null && array.size() > 0) {
			for (int i = 0; i < array.size(); i++) {
				JSONObject json = array.getJSONObject(i);
				TMenu t=new TMenu();
				t.setMenuid(json.getString("id"));
				t.setCseq(json.getInteger("cseq").shortValue());
				menuDao.updateByPrimaryKeySelective(t);
			}
		}
	}

	@Override
	public int getMaxCseq(String pid) {
		Integer cseq=menuDao.getMaxCseq(pid);
		return cseq==null?0:cseq;
	}
	
	@Override
	public boolean exist(String menuid, String name) {
		return menuDao.exist(menuid, name);
	}

	@Override
	public List<Menu> getMenuByPid(String pid) {
		// TODO Auto-generated method stub
		List<Menu> menuBypid = menuDao.getMenuBypid(pid);
		for (Menu menu : menuBypid) {
			
			// 判断是否有下一级
			if (getIsParent(menu.getMenuid())) {
				menu.setIsParent(true);
				// TODO 默认设置打开节点数量，待后期根据数据量进行设置
//				menu.setIsOpen(true);
			} else {
				menu.setIsParent(false);
//				menu.setIsOpen(false);
			}
		}
		
		return menuBypid;
	}
	
	// 判断是否有子节点
	private boolean getIsParent(String pid) {

		List<Menu> menuList = menuDao.getMenuBypid(pid);
		return menuList != null && menuList.size() > 0 ? true : false;
	}

	@Override
	public Menu getMenuByid(String id) {
		return menuDao.getMenuByid(id);
	}
}
