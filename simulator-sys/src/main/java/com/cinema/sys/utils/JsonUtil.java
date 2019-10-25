package com.cinema.sys.utils;

import java.io.IOException;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.cinema.sys.model.base.TRoleAuth;

public class JsonUtil {
	/**
	 * 将对象转换成JSON字符串
	 * 
	 * @param object
	 * @throws IOException
	 */
	public static String toJsonStr(Object object) {
		String json = "";
		try {
			// SerializeConfig serializeConfig = new SerializeConfig();
			// serializeConfig.setAsmEnable(false);
			// String json = JSON.toJSONString(object);
			// String json = JSON.toJSONString(object, serializeConfig,
			// SerializerFeature.PrettyFormat);
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
	
	public static String[] toArray(JSONArray jarr){
		String[] arr=new String[jarr.size()];
		for (int i = 0; i < jarr.size(); i++) 
			arr[i]= jarr.getString(i);
		return arr;
	}
}
