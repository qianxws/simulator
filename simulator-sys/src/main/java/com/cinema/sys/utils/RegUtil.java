package com.cinema.sys.utils;

import org.apache.commons.lang3.StringUtils;

/**
 * 正则验证工具类
 * @author lifeng
 * @date 2016-10-24
 *
 */
public class RegUtil {

	/**
	 * 数字验证
	 * @param str
	 * @return
	 */
	 public static boolean isNumer(String str){
		 if(StringUtils.isBlank(str))
			 return false;
		 return str.matches("[0-9]+");
     }

	 
	 public static void main(String[] args) {
		System.out.println(RegUtil.isNumer("4s786"));
	}
}
