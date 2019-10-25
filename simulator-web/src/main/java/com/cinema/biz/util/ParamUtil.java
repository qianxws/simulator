package com.cinema.biz.util;

import javax.servlet.http.HttpServletRequest;

public class ParamUtil {
	
	public static Integer getInt(HttpServletRequest request,String key,int default_){
		try {
			if(key==null ||key.equals(""))
				return null;
			return new Integer(request.getParameter(key));
		} catch (Exception ex) {
			return default_;
		}
	}

}
