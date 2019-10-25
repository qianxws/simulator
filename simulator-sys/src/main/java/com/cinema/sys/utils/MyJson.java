package com.cinema.sys.utils;

import com.alibaba.fastjson.JSONObject;

/**
 * json信息封装 json转换xml
 * 
 * @author tianxiuheng
 *
 */
public class MyJson {
	
	public static JSONObject setJson(String comments, Object data) {
		JSONObject json = new JSONObject();
		json.put("@comments", comments);
		json.put("data", data);
		return json;
	}

	public static JSONObject setJson(String comments, String text) {
		JSONObject json = new JSONObject();
		json.put("@comments", comments);
		json.put("#text", text);
		return json;
	}
	
	public static JSONObject setJson(String comments, int text) {
		JSONObject json = new JSONObject();
		json.put("@comments", comments);
		json.put("#text", text);
		return json;
	}
	
	public static JSONObject setJson(String comments, double text) {
		JSONObject json = new JSONObject();
		json.put("@comments", comments);
		json.put("#text", text);
		return json;
	}

	public static JSONObject setTypeJson(String taskType, Object data) {
		JSONObject json = new JSONObject();
		json.put("@taskType", taskType);
		json.put("data", data);
		return json;
	}

	public static JSONObject setTypeJson(String taskType, String text) {
		JSONObject json = new JSONObject();
		json.put("@taskType", taskType);
		json.put("#text", text);
		return json;
	}
	
	public static JSONObject setTypeJson(String taskType, int text) {
		JSONObject json = new JSONObject();
		json.put("@taskType", taskType);
		json.put("#text", text);
		return json;
	}
	
	public static JSONObject setTypeJson(String taskType, double text) {
		JSONObject json = new JSONObject();
		json.put("@taskType", taskType);
		json.put("#text", text);
		return json;
	}
	
	public static JSONObject setJson(String comments, String text, String taskType) {
		JSONObject json = new JSONObject();
		json.put("@comments", comments);
		json.put("#text", text);
		json.put("@taskType", taskType);
		return json;
	}
	
	public static JSONObject setJson(String comments, int text, String taskType) {
		JSONObject json = new JSONObject();
		json.put("@comments", comments);
		json.put("#text", text);
		json.put("@taskType", taskType);
		return json;
	}
	
	public static JSONObject setJson(String comments, double text, String taskType) {
		JSONObject json = new JSONObject();
		json.put("@comments", comments);
		json.put("#text", text);
		json.put("@taskType", taskType);
		return json;
	}
}
