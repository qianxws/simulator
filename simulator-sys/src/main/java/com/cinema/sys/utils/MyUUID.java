package com.cinema.sys.utils;

import java.util.UUID;

import org.apache.commons.lang3.StringUtils;

/**
 * <PRE>
 * 
 * MyUUID
 * </PRE>
 */
public class MyUUID {
	
	// 获取uuid，不包含“-”
	public static String getUUID() {
		return getUUID(true);
	}
	
	// 获取uuid，包含“-”
	public static String getUUID(boolean noFlag) {
		if (noFlag) {
			return UUID.randomUUID().toString().replaceAll("-", "");
		}
		return UUID.randomUUID().toString();
	}
	
	// 将字符串转为uuid格式
	public static String getUUIDFromBytes(String str) {
		return getUUIDFromBytes(str, "");
	}
	
	// 将字符串转为uuid格式
	public static String getUUIDFromBytes(String str, String default_) {
		if (StringUtils.isBlank(str)) {
			return default_;
		}
		return UUID.nameUUIDFromBytes(str.getBytes()).toString();
	}
}