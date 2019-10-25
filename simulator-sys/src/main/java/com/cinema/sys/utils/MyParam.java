package com.cinema.sys.utils;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.util.HtmlUtils;

import com.alibaba.fastjson.JSONObject;
import com.cinema.sys.action.util.ActionContext;


public class MyParam {


	/**
	 * 获取ajaxParams
	 * 
	 * @param cxt
	 * @return
	 */
	public static String getAjaxParams(ActionContext cxt) {
		if (cxt.getAjaxParams() == null) {
			return "";
		}
		return HtmlUtils.htmlUnescape(cxt.getAjaxParams());
	}

	/**
	 * 获取ajaxParams
	 * 
	 * @param request
	 * @return
	 */
	public static String getAjaxParams(HttpServletRequest request) {
		if (request.getParameter("ajaxParams") == null) {
			return "";
		}
		return HtmlUtils.htmlUnescape(request.getParameter("ajaxParams"));
	}

	/**
	 * 根据ajaxParams获取dataItem
	 * 
	 * @param request
	 * @param key
	 * @return
	 */
	public static JSONObject getDataItem(ActionContext cxt, String dataItem) {
		return JSONObject.parseObject(getAjaxParams(cxt)).getJSONObject(dataItem);
		
	}

	/**
	 * 根据ajaxParams获取dataItem
	 * 
	 * @param request
	 * @param key
	 * @return
	 */
	public static JSONObject getDataItem(HttpServletRequest request, String dataItem) {
		return JSONObject.parseObject(getAjaxParams(request)).getJSONObject(dataItem);
	}

	/**
	 * getJSONObject
	 * 
	 * @param cxt
	 * @param key
	 * @return
	 */
	public static JSONObject getJSONObject(ActionContext cxt) {
		return JSONObject.parseObject(getAjaxParams(cxt));
	}

	/**
	 * getJSONObject
	 * 
	 * @param request
	 * @param key
	 * @return
	 */
	public static JSONObject getJSONObject(HttpServletRequest request) {
		return JSONObject.parseObject(getAjaxParams(request));
	}

	/**
	 * 根据ajaxParams获取String
	 * 
	 * @param request
	 * @param key
	 * @return
	 */
	public static String getString(ActionContext cxt, String key, String default_) {
		try {
			return JSONObject.parseObject(getAjaxParams(cxt)).getString(key);
		} catch (Exception ex) {
			return default_;
		}
	}

	/**
	 * 根据ajaxParams获取String
	 * 
	 * @param request
	 * @param key
	 * @return
	 */
	public static String getString(ActionContext cxt, String key) {
		String res=getString(cxt, key, "");
		return res==null?"":res.trim();
	}

	/**
	 * 根据ajaxParams获取int
	 * 
	 * @param request
	 * @param key
	 * @return
	 */
	public static Integer getInteger(ActionContext cxt, String key, Integer default_) {
		try {
			if(key==null ||key.equals(""))
				return null;
			return new Integer(getString(cxt, key));
		} catch (Exception ex) {
			return default_;
		}
	}

	/**
	 * 根据ajaxParams获取int
	 * 
	 * @param request
	 * @param key
	 * @return
	 */
	public static Integer getInteger(ActionContext cxt, String key) {
		return ConvertUtil.getInteger(getString(cxt, key));
	}
	
	public static Long getLong(ActionContext cxt, String key) {
		return ConvertUtil.getLong(getString(cxt, key));
	}
	/**
	 * 根据ajaxParams获取int
	 * 
	 * @param request
	 * @param key
	 * @return
	 */
	public static int getInt(ActionContext cxt, String key, int default_) {
		try {
			return ConvertUtil.getInt(getString(cxt, key));
		} catch (Exception ex) {
			return default_;
		}
	}

	/**
	 * 根据ajaxParams获取int
	 * 
	 * @param request
	 * @param key
	 * @return
	 */
	public static int getInt(ActionContext cxt, String key) {
		return getInt(cxt, key, 0);
	}

	/**
	 * 根据ajaxParams获取String
	 * 
	 * @param request
	 * @param key
	 * @return
	 */
	public static String getString(HttpServletRequest request, String key, String default_) {
		try {
			return JSONObject.parseObject(getAjaxParams(request)).getString(key);
		} catch (Exception ex) {
			return default_;
		}
	}

	/**
	 * 根据ajaxParams获取String
	 * 
	 * @param request
	 * @param key
	 * @return
	 */
	public static String getString(HttpServletRequest request, String key) {
		return getString(request, key, "");
	}
	/**
	 * 根据ajaxParams获取int
	 * 
	 * @param request
	 * @param key
	 * @return
	 */
	public static Integer getInteger(HttpServletRequest request, String key, int default_) {
		try {
			return new Integer(getString(request, key));
		} catch (Exception ex) {
			return default_;
		}
	}

	/**
	 * 根据ajaxParams获取int
	 * 
	 * @param request
	 * @param key
	 * @return
	 */
	public static Integer getInteger(HttpServletRequest request, String key) {
		return getInteger(request, key, 0);
	}
	/**
	 * 根据ajaxParams获取int
	 * 
	 * @param request
	 * @param key
	 * @return
	 */
	public static int getInt(HttpServletRequest request, String key, int default_) {
		try {
			return new Integer(getString(request, key));
		} catch (Exception ex) {
			return default_;
		}
	}

	/**
	 * 根据ajaxParams获取int
	 * 
	 * @param request
	 * @param key
	 * @return
	 */
	public static int getInt(HttpServletRequest request, String key) {
		return getInt(request, key, 0);
	}

	/**
	 * 根据dataItem获取String
	 * 
	 * @param request
	 * @param dataItem
	 * @return
	 */
	public static String getDataItemString(ActionContext cxt, String dataItem) {
		JSONObject json = getDataItem(cxt, "dataItem");
		return json.getString(dataItem);
	}

	/**
	 * 根据dataItem获取String
	 * 
	 * @param request
	 * @param dataItem
	 * @return
	 */
	public static String getDataItemString(HttpServletRequest request, String dataItem) {
		JSONObject json = getDataItem(request, "dataItem");
		return json.getString(dataItem);
	}

	/**
	 * 根据dataItem获取int
	 * 
	 * @param request
	 * @param key
	 * @return
	 */
	public static int getDataItemInt(ActionContext cxt, String dataItem) {
		try {
			return new Integer(getDataItemString(cxt, dataItem));
		} catch (Exception ex) {
			return 0;
		}
	}

	/**
	 * 根据dataItem获取int
	 * 
	 * @param request
	 * @param key
	 * @return
	 */
	public static int getDataItemInt(HttpServletRequest request, String dataItem) {
		try {
			return new Integer(getDataItemString(request, dataItem));
		} catch (Exception ex) {
			return 0;
		}
	}
}