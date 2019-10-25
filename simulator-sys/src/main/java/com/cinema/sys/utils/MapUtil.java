package com.cinema.sys.utils;

import java.util.HashMap;
import java.util.Map;

public class MapUtil {

	public static Map<String,Object> getMap(String key,Object value){
		return new HashMap<String,Object>(){{put(key,value);}};
	}
}
