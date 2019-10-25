package com.cinema.sys.utils;

import java.math.BigDecimal;

public class NumericUtil {
	
	//保留count个小数位
	public static String  format(Object num,int count) {
		return String.format("%."+count+"f", num);
	}

	
	/**
	 * double四舍五入取count位小数
	 * 
	 * @return
	 */
	public static Double formatDouble(Object d,int count) {
		BigDecimal bd = (BigDecimal)d;
		return bd.setScale(count, BigDecimal.ROUND_HALF_UP).doubleValue();
	}
	

}
