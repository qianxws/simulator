package com.cinema.biz.util;

import java.util.UUID;

public class ToolUtil {
	
	public static String getUUID(){
		return UUID.randomUUID().toString().replace("-", "");
	}

}
