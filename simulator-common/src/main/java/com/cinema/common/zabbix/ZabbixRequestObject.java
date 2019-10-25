package com.cinema.common.zabbix;

import java.util.HashMap;
import java.util.Map;

public class ZabbixRequestObject {

	private String jsonrpc = "2.0";
	private String method;
	private String auth;
	private Integer id;
	private Map<String, Object> params = new HashMap<> ();

	public String getJsonrpc() {
		return jsonrpc;
	}

	public void setJsonrpc(String jsonrpc) {
		this.jsonrpc = jsonrpc;
	}

	public String getMethod() {
		return method;
	}

	public void setMethod(String method) {
		this.method = method;
	}

	public String getAuth() {
		return auth;
	}

	public void setAuth(String auth) {
		this.auth = auth;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Map<String, Object> getParams() {
		return params;
	}

	public void setParams(Map<String, Object> params) {
		this.params = params;
	}

	public void putParams(String key, Object value) {
		params.put(key, value);
	}
	
	public void removeParams(String key) {
		params.remove(key);
	}
	
}
