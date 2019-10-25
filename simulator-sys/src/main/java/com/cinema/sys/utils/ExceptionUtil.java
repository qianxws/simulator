package com.cinema.sys.utils;

public class ExceptionUtil {
	//隐藏系统错误
	private static String getMessageHideSysError(String error,String errorHeader) {
		//处理系统抛出的错误
		if (error.contains("### Error")) {
			return errorHeader;
		}
		else //处理自定义抛出的错误
			return error;
	}
	
	//处理异常
	public static String getMessage(Exception e,String errorHeader) {
		String error=e.getMessage();
		return errorHeader+":"+error;
	}
	
	//处理删除异常
	public static String getDeleteMessage(Exception e,String errorHeader) {
		String error=e.getMessage();
        if (error.contains("foreign key constraint")) {
			return errorHeader+":存在子记录！";
		} 
        else {
        	return errorHeader+":"+error;
		}
	}

	//处理添加异常
	public static String getInsertMessage(Exception e,String errorHeader) {
		String error=e.getMessage();
        if (error.contains("foreign key constraint")) {
			return errorHeader+":父级项不存在！";
		} 
        else {
        	return errorHeader+":"+error;
		}
	}
	

	//处理更新异常
	public static String getUpdateMessage(Exception e,String errorHeader) {
		String error=e.getMessage();
        if (error.contains("foreign key constraint")) {
			return errorHeader+":父级项不存在！";
		} 
        else {
        	return errorHeader+":"+error;
		}
	}
}
