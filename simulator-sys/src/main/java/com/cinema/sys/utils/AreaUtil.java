package com.cinema.sys.utils;

/**
 * 省市区域工具类
 * 
 * 
 */
public class AreaUtil {

	/**市是否属于省*/
	public static Boolean isCityBelongProvince(Integer provinceId,Integer cityId) {
		int dvalue=cityId-provinceId;
		return dvalue>0 && dvalue<10000;
	}
}
