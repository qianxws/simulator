package com.cinema.sys.utils;

import java.math.BigDecimal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import org.apache.poi.ss.usermodel.DateUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class TimeUtil {
	
	private static Logger logger = LoggerFactory.getLogger(TimeUtil.class);

	public static String dateToString(Date date) {
		return date==null?"": new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(date);
	}

	public static String timeToString() {
		return new SimpleDateFormat("HH:mm:ss").format(new Date());
	}

	/**
	 * 字符串转时间：yyyy-MM-dd HH:mm:ss
	 * @param dateStr
	 * @return
	 */
	public static Date stringToDate(String dateStr) {
		if (dateStr == null || dateStr.length() != 19) {
			logger.error("字符串转时间报错,字符串长度不正确：" + dateStr);
			return null;
		}
		try {
			return new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(dateStr);
		} catch (Exception e) {
			//e.printStackTrace();
			logger.error("字符串转换时间报错：" + dateStr + ";报错信息：" + e.getMessage());
		}
		return null;
	}
	
	public static Date stringToDateNew(String dateStr) throws Exception{
		if (dateStr == null) {
			return new Date(0);
		}
		dateStr=dateStr.replace("/", "-");
		if (dateStr.length() <= 10) {
			if(dateStr.contains("-"))
			  dateStr=dateStr+" 00:00:00";
			else
			  dateStr="1899-12-31 "+dateStr;
		}
		return new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(dateStr);
	}

	/**
	 * 时间格式字符串转时间对象，格式不正确抛异常
	 * 
	 * @param dateStr
	 * @return
	 * @throws Exception
	 */
	public static Date stringToDateException(String dateStr) throws Exception {
		Date parse = null;
		if (dateStr == null || dateStr.length() < 16) {
			throw new Exception("时间格式不正确：" + dateStr);
		} else if (dateStr.length() == 16) {
			parse = new SimpleDateFormat("yyyy-M-d H:mm:ss").parse(dateStr);
		} else if (dateStr.length() == 19) {
			parse = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(dateStr);
		}

		return parse;

	}

	/**
	 * 字符串转时间
	 * 
	 * @param dateStr
	 * @param formatStr
	 * @return
	 */
	public static Date stringToDate(String dateStr, String formatStr) {
		Date date = null;
		try {
			date = new SimpleDateFormat(formatStr).parse(dateStr);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return date;
	}

	/**
	 * 字符串转时间
	 * 
	 * @param dateStr
	 * @param formatStr
	 * @return
	 */
	public static Date stringToDate(String dateStr, SimpleDateFormat formatStr) {
		Date date = null;
		try {
			date = formatStr.parse(dateStr);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return date;
	}

	/**
	 * 数组转字符串
	 * 
	 * @param array
	 * @return
	 */
	public static String arrayToString(String[] array) {
		StringBuffer sb = new StringBuffer();
		for (String str : array) {
			sb.append("，" + str);
		}
		if (sb.length() > 1) {
			return sb.substring(1);
		}
		return sb.toString();
	}
	/**
	 * 获得当天时间
	 * 
	 * @return
	 */
	public static Date getNowDayStartTime() {
		SimpleDateFormat daySdf = new SimpleDateFormat("yyyy-MM-dd");
		
		String dateStr = daySdf.format(new Date());

		try {
			return daySdf.parse(dateStr);
		} catch (ParseException e) {
			logger.error("获得当天时间报错！");
			e.printStackTrace();
		}
		return null;
	}
	/**
	 * 获得前一天时间
	 * 
	 * @return
	 */
	public static Date getBeforeDay() {
		Calendar date = Calendar.getInstance();
		date.add(Calendar.DATE, -1);
		SimpleDateFormat daySdf = new SimpleDateFormat("yyyy-MM-dd");

		String dateStr = daySdf.format(date.getTime());

		try {
			return daySdf.parse(dateStr);
		} catch (ParseException e) {
			logger.error("获得前一天时间报错！");
			e.printStackTrace();
		}
		return date.getTime();
	}

	/**
	 * 获得7*24小时前的时间
	 * 
	 * @return
	 */
	public static Date getBeforeWeek() {
		Calendar date = Calendar.getInstance();
		date.add(Calendar.DATE, -7);
		return date.getTime();
	}
	
	/**
	 * 获得七天前的开始时间，7天前的零点时分
	 * @return
	 */
	public static Date getBeforeWeekStart() {
		Date date = TimeUtil.getBeforeWeek();
		SimpleDateFormat daySdf = new SimpleDateFormat("yyyy-MM-dd");
		String dateStr = daySdf.format(date.getTime());

		try {
			return daySdf.parse(dateStr);
		} catch (ParseException e) {
			logger.error("获得前7天开始时间报错！");
			e.printStackTrace();
		}
		return date;
	}

	/**
	 * 获得昨天时间字符串：yyyy-mm-dd
	 * 
	 * @return
	 */
	public static String getYesterdayStr() {
		Calendar date = Calendar.getInstance();
		date.add(Calendar.DATE, -1);
		return new SimpleDateFormat("yyyy-MM-dd").format(date.getTime());
	}
	
	/**
	 * 获得今天时间字符串：yyyy-mm-dd
	 * 
	 * @return
	 */
	public static String gettodayStr() {
		Calendar date = Calendar.getInstance();
		date.add(Calendar.DATE,0);
		return new SimpleDateFormat("yyyy-MM-dd").format(date.getTime());
	}

	/**
	 * 获得本月：yyyy-mm
	 * 
	 * @return
	 */
	public static String getNowMonthStr() {
		return new SimpleDateFormat("yyyy-MM").format(new Date());
	}

	/**
	 * 获得本年:yyyy
	 * 
	 * @return
	 */
	public static String getNowYearStr() {
		return new SimpleDateFormat("yyyy").format(new Date());
	}

}
