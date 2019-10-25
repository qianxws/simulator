package com.cinema.sys.utils;

public class ConvertUtil {
	
	public static Integer getInteger(String str){
		return str==null||str.equals("")||str.equals("undefined")?null: new Integer(str);
	}

	public static int getInt(String str){
		return str==null||str.equals("")||str.equals("undefined")?0: new Integer(str);
	}
	
	/**getLong:defaultValue为null或0*/
	public static Long getLong(String str){
		return str==null||str.equals("")||str.equals("undefined")?null: new Long(str);
	}

}
