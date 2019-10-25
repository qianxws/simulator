package com.cinema.sys.utils;

import java.util.regex.Pattern;

public class StrUtil {
	
	public static boolean isBlank(String str) {
		return str==null||str.trim().equals("");
	}
	
	/**是否为整数*/
	public static boolean isInteger(String str) {  
	        Pattern pattern = Pattern.compile("^[-\\+]?[\\d]*$");  
	        return pattern.matcher(str).matches();  
	}
	
	
	/**是否为数字：正负，整数,小数*/
	public static boolean isNumeric(String str) {  
	        Pattern pattern = Pattern.compile("^(\\-|\\+)?\\d+(\\.\\d+)?$");  
	        boolean a=pattern.matcher(str).matches();  
	        return a;
	}
	
	/**
	 * 数组转字符串
	 * 
	 * @param array
	 * @return
	 */
	public static String arrayToString(String[] array) {
		StringBuffer sb = new StringBuffer();
		for (String str : array) {
			sb.append("，" + str);
		}
		if (sb.length() > 1) {
			return sb.substring(1);
		}
		return sb.toString();
	}
}
