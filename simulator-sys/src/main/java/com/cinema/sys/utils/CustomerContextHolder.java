package com.cinema.sys.utils;

public class CustomerContextHolder {

	private static final ThreadLocal<String> contextHloder=new ThreadLocal<String>();
	
	public static void setCustomerType(String customerType) {
		contextHloder.set(customerType);
	}
	
	public static void clearCustomerType() {
		contextHloder.remove();
	}
	
	public static String getCustomerType() {
		return contextHloder.get();
	}
}
