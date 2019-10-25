package com.cinema.common.zabbix;

import java.util.concurrent.atomic.AtomicInteger;

public class ZabbixRequestBuilder {

	private static final AtomicInteger nextId = new AtomicInteger(1);
	private ZabbixRequestObject requestObject;
	
	//私有化构造方法
	private ZabbixRequestBuilder() {
		this.requestObject = new ZabbixRequestObject();
	}
	
	//获得类
	public static ZabbixRequestBuilder newBuilder() {
		return new ZabbixRequestBuilder();
	}
	
	/**
	 * 获得请求对象
	 * @return
	 */
	public ZabbixRequestObject build() {
		if (requestObject.getId() == null) {
			requestObject.setId(nextId.getAndIncrement());
		}
		return requestObject;
	}
	
	/**
	 * 增加请求参数
	 * @param key
	 * @param value
	 * @return
	 */
	public ZabbixRequestBuilder paramEntry(String key, Object value) {
		this.requestObject.putParams(key, value);
		return this;
	}
	
	/**
	 * 添加请求秘钥
	 * @param auth
	 * @return
	 */
	public ZabbixRequestBuilder setAuth(String auth) {
		this.requestObject.setAuth(auth);
		return this;
	}
	
	public ZabbixRequestBuilder method(String method) {
		this.requestObject.setMethod(method);
		return this;
	}
	
	
}
