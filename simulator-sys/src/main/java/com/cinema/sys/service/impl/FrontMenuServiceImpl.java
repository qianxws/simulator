package com.cinema.sys.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.cinema.sys.dao.FrontMenuMapper;
import com.cinema.sys.model.FrontMenu;
import com.cinema.sys.model.User;
import com.cinema.sys.model.base.TFrontMenu;
import com.cinema.sys.service.FrontMenuService;
import com.cinema.sys.utils.ConfigUtil;

@Service
public class FrontMenuServiceImpl implements FrontMenuService {
	@Autowired  
    private FrontMenuMapper frontmenuDao;

	@Override
	public int delete(String menuid) {
		return frontmenuDao.deleteByPrimaryKey(menuid);
	}
	
	@Override
	public int insert(TFrontMenu t) {
		return frontmenuDao.insertSelective(t);
	}

	@Override
	public int update(TFrontMenu t) {
		return frontmenuDao.updateByPrimaryKeySelective(t);
	}
	
	@Override
    public FrontMenu getDetail(String menuid) {  
        return frontmenuDao.getDetail(menuid);
    }
	
	@Override
	public List<FrontMenu> getTreeList(List<String> authCodeArray) {
		//获得所有一级菜单
		List<FrontMenu> pMenu = frontmenuDao.getTopList();
		List<FrontMenu> menuList = new ArrayList<>();
		for (FrontMenu frontMenu : pMenu) {
			if (authCodeArray.contains(frontMenu.getCode())) {
				frontMenu.setMenuList(frontmenuDao.getChildList(frontMenu.getMenuid()));
				menuList.add(frontMenu);
			}
		}
		return menuList;
	}
	
	@Override
	public List<FrontMenu> getTreeLists() {
		List<FrontMenu> menus = getAllMenu();
		
		return menus;
	}
	
	// 根据登录用户权限获取相应的菜单
	@Override
	public List<FrontMenu> getListByUserAuth(String userId,boolean isAdmin,String authCodes) {
		
		String condition="";
		if(userId.equalsIgnoreCase(ConfigUtil.ROOT_ID))
			condition="isRoot";
		else if(isAdmin)
			condition="isAdmin";
		else
			authCodes = "," + authCodes+ ",";
		return frontmenuDao.getAllList(condition, authCodes);
	}
	
	@Override
	public List<FrontMenu> getAllMenu()
	{
		List<FrontMenu> allMenus = frontmenuDao.getAllMenus();
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
				TFrontMenu t=new TFrontMenu();
				t.setMenuid(json.getString("id"));
				t.setCseq(json.getInteger("cseq").shortValue());
				frontmenuDao.updateByPrimaryKeySelective(t);
			}
		}
	}

	@Override
	public int getMaxCseq(String pid) {
		Integer cseq=frontmenuDao.getMaxCseq(pid);
		return cseq==null?0:cseq;
	}
	
	@Override
	public boolean exist(String menuid, String name) {
		return frontmenuDao.exist(menuid, name);
	}

	@Override
	public List<FrontMenu> getMenuByPid(String pid) {
		// TODO Auto-generated method stub
		List<FrontMenu> menuBypid = frontmenuDao.getMenuBypid(pid);
		for (FrontMenu FrontMenu : menuBypid) {
			
			// 判断是否有下一级
			if (getIsParent(FrontMenu.getMenuid())) {
				FrontMenu.setIsParent(true);
				// TODO 默认设置打开节点数量，待后期根据数据量进行设置
//				FrontMenu.setIsOpen(true);
			} else {
				FrontMenu.setIsParent(false);
//				FrontMenu.setIsOpen(false);
			}
		}
		
		return menuBypid;
	}
	
	// 判断是否有子节点
	private boolean getIsParent(String pid) {

		List<FrontMenu> menuList = frontmenuDao.getMenuBypid(pid);
		return menuList != null && menuList.size() > 0 ? true : false;
	}

	@Override
	public FrontMenu getMenuByid(String id) {
		return frontmenuDao.getMenuByid(id);
	}
}
