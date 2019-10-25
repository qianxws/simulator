package com.cinema.biz.util;

public class GlobalUtil {
	
	/**根据分类id判断level值*/
	public static int getLevelByCatId(String catId){
		return catId.length()/3-1;
	}
	
	/**得到分类id的父id*/
	public static String getParentCatId(String catId){
		return catId.length()>3?catId.substring(0,catId.length()-3):"0";
	}
	
	/**根据区域id判断level值*/
	public static int getLevelByAreaId(String areaId){
		return areaId.length()/3-1;
	}

}
