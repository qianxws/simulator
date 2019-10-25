package com.cinema.sys.utils;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.jdbc.datasource.lookup.AbstractRoutingDataSource;

import com.alibaba.fastjson.JSONObject;

public class DBContextHolder extends AbstractRoutingDataSource {
	public static final ThreadLocal<String> contextHolder= new ThreadLocal<String>();
	
	/**
	 * 设置当前数据源
	 * @param dbType
	 */
	public static void setDbType(String dbType) {
		contextHolder.set(dbType);
	}
	
	/**
	 * 获取当前数据源
	 * @return
	 */
	public static String getDbType() {
		String dbType=contextHolder.get();
		return dbType;
	}
	
	/**
	 * 清除上下文
	 */
	public static void clearContext() {
		contextHolder.remove();
	}

	@Override
	protected Object determineCurrentLookupKey() {
		return DBContextHolder.getDbType();
	}
	
	public static void test(HttpServletRequest requst) {
		
		System.out.println(requst.getContextPath());
	}
	public static void main(String[] args) throws IOException {
		JSONObject json=new JSONObject();
		List list=new ArrayList();
		list.add(0, "123");
		list.add(1, "456");
		list.set(0, "123");
		
		
		json.put("list", list);
		System.out.println(json);
	}
	
}
