package com.cinema.common.action;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.util.HtmlUtils;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.cinema.common.model.Layout;
import com.cinema.common.service.LayoutService;
import com.cinema.sys.action.util.ActionContext;
import com.cinema.sys.action.util.Service;
import com.cinema.sys.service.LogService;
import com.cinema.sys.utils.MyParam;

@Component
@Service(name = "layoutAction")
public class LayoutAction {
	@Autowired
	private LayoutService layoutService;
	@Autowired
	private LogService logService;
	
	/**
	 * 保存首页布局
	 * @return
	 */
	public JSONObject saveHomeLayout(ActionContext cxt) {
		
		String userId = String.valueOf(cxt.getHttpRequest().getAttribute("userId"));
		layoutService.deleteByUserId(userId, "home");
		JSONArray jsonArray = JSONArray.parseArray(HtmlUtils.htmlUnescape(cxt.getAjaxParams()));
		layoutService.saveHomeLayout(jsonArray, userId);
		
		return new JSONObject();
	}
	
	/**
	 * 获得首页布局
	 * @return
	 */
	public List<Layout> getHomeLayout(ActionContext cxt) {
		return layoutService.getHomeLayout(String.valueOf(cxt.getHttpRequest().getAttribute("userId")));
	}
	
	/**
	 * 保存票房信息页面布局
	 * @return
	 */
	public JSONObject saveTicketInfoLayout(ActionContext cxt) {
		
		String userId = String.valueOf(cxt.getHttpRequest().getAttribute("userId"));
		layoutService.deleteByUserId(userId, "ticketInfo");
		JSONArray jsonArray = JSONArray.parseArray(HtmlUtils.htmlUnescape(cxt.getAjaxParams()));
		layoutService.saveTicketInfoLayout(jsonArray, userId);
		
		return new JSONObject();
	}
	
	/**
	 * 获得票房信息页面布局
	 * @return
	 */
	public List<Map<String, List<Layout>>> getTicketInfoLayout(ActionContext cxt) {
		return layoutService.getTicketInfoLayout(String.valueOf(cxt.getHttpRequest().getAttribute("userId")));
	}
	
	/**
	 * 删除用户自定义布局
	 * @param cxt
	 * @return
	 */
	public JSONObject deleteUserLayout(ActionContext cxt) {
		String page = MyParam.getString(cxt, "page");
		String userId = String.valueOf(cxt.getHttpRequest().getAttribute("userId"));
		layoutService.deleteByUserId(userId, page);
		
		return new JSONObject();
	}
}
