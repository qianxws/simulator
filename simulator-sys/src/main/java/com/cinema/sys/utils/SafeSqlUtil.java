package com.cinema.sys.utils;

public class SafeSqlUtil {

	/**
	 * 是否为安全String
	 * 将'替换为''
	 * @param str
	 * @return
	 */
	 public static String getSafeString(String str){
		 if(str==null) return "";
		 // 至少一个数字、字母、下划线、逗号、汉字
//		 return str.matches("[0-9a-zA-Z,_\u4e00-\u9fa5]+")?str:"";
		 return str.replace("'", "''");
    }
	 

	 
	 public static boolean  isSafeString(String str){
		 String injectStr="'|*|%|;|-|+|,";
		 String arr[]=injectStr.split("|");
		 for(int i=0;i<arr.length;i++) {
			 if(str.indexOf(arr[i])>-1)
				 return false;
		 }
		 return true;
    }
}
