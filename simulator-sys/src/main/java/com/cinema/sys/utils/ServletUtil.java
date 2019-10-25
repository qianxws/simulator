package com.cinema.sys.utils;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ServletUtil {
	
	/**
	 * 获取参数
	 * 
	 * @param request
	 * @param key
	 * @return
	 */
	public static Object getParam(HttpServletRequest request, String key) {
		Map<String, String[]> param = request.getParameterMap();
		return param.get(key)[0];
	}

	/**
	 * get获取参数
	 * 
	 * @param request
	 * @param key
	 * @return
	 */
	public static String get(HttpServletRequest request, String key) {
		if (getParam(request, key) == null) {
			return null;
		}
		return getParam(request, key).toString();
	}

	public static void print(Object object, HttpServletResponse response) {
		print(object, "utf-8", response);
	}
	
	public static void print(Object object, String charSet, HttpServletResponse response) {
		try {
			String json = JsonUtil.toJsonStr(object);
			response.setContentType("text/html;charset=" + charSet);
			PrintWriter out = response.getWriter();
			out.write(json);
			out.flush();
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
}
