package com.cinema.sys.utils;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;

/**
 * 请求工具类
 * @author hanxu
 */
public class HttpUtil {
	/**
	 * 获取用户ip
	 * 
	 * @param request
	 * @return
	 */
	public static String getRemoteHost(HttpServletRequest request) {

		if (request == null) {
			return null;
		}

		String ip = request.getHeader("x-forwarded-for");
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("Proxy-Client-IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("WL-Proxy-Client-IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getRemoteAddr();
		}
		return ip.equals("0:0:0:0:0:0:0:1") ? "127.0.0.1" : ip;
	}

	/**
	 * 获取浏览器头信息内容
	 * 
	 * @param request
	 * @return
	 */
	public static JSONObject getHeader(HttpServletRequest request) {
		// 取出头信息内容
		String host = request.getHeader("host");
		String referer = request.getHeader("referer");
		String agent = request.getHeader("user-agent");
		String language = request.getHeader("accept-language");
		String encoding = request.getHeader("accept-encoding");
		JSONObject jb = new JSONObject();
		jb.put("host", host);
		jb.put("referer", referer);
		jb.put("agent", agent);
		jb.put("language", language);
		jb.put("encoding", encoding);
		return jb;
	}
	
	/**
	 * 将对象转换成JSON字符串
	 * 
	 * @param object
	 * @throws IOException
	 */
	public static String getJson(Object object) {
		String json = "";
		try {
			if (object instanceof String) {
				json = object.toString();
			} else {
				json = JSON.toJSONStringWithDateFormat(object, "yyyy-MM-dd HH:mm:ss");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return json;
	}

	//返回对象
	public static void print(Object object, HttpServletResponse response) {
		print(object, "utf-8", response);
	}
	
	//返回对象
	public static void print(Object object, String charSet, HttpServletResponse response) {
		try {
			String json = getJson(object);
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
