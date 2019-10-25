package com.cinema.common.zabbix;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.apache.commons.lang.ArrayUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.http.HttpEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpUriRequest;
import org.apache.http.client.methods.RequestBuilder;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.cinema.sys.utils.ConfigUtil;
import com.cinema.sys.utils.ResourceUtil;

public class ZabbixUtils {

	private final Logger logger = LoggerFactory.getLogger(ZabbixUtils.class);
	
	
	public static final String ZABBIX_WINKEY_CPU = ResourceUtil.getMessageByConfig("zabbix.winkey.cpu", null);
	public static final String ZABBIX_WINKEY_FILESYSTEM = ResourceUtil.getMessageByConfig("zabbix.winkey.filesystem", null);
	public static final String ZABBIX_WINKEY_MEMORY = ResourceUtil.getMessageByConfig("zabbix.winkey.memory", null);
	public static final String ZABBIX_WINKEY_NETWORK = ResourceUtil.getMessageByConfig("zabbix.winkey.network", null);

	public static final String ZABBIX_LINUXKEY_CPU = ResourceUtil.getMessageByConfig("zabbix.linuxkey.cpu", null);
	public static final String ZABBIX_LINUXKEY_FILESYSTEM = ResourceUtil.getMessageByConfig("zabbix.linuxkey.filesystem", null);
	public static final String ZABBIX_LINUXKEY_MEMORY = ResourceUtil.getMessageByConfig("zabbix.linuxkey.memory", null);
	public static final String ZABBIX_LINUXKEY_NETWORK = ResourceUtil.getMessageByConfig("zabbix.linuxkey.network", null);
	
	//zabbix接口地址
	public static final String ZABBIX_APP_URL = ResourceUtil.getMessageByConfig("zabbix.api", null);
	public static final String ZABBIX_USER_NAME = ResourceUtil.getMessageByConfig("zabbix.username", null);
	public static final String ZABBIX_PASS_WORD = ResourceUtil.getMessageByConfig("zabbix.password", null);
	
	private static String auth = null;
	
	
	// 单例
	private ZabbixUtils() {

	}

	private static final ZabbixUtils zabbixUtils = new ZabbixUtils();

	public static ZabbixUtils getZabbixUtils() {
		return zabbixUtils;
	}

	public String login() {
		return this.login(ZABBIX_USER_NAME, ZABBIX_PASS_WORD);
	}

	/**
	 * 登录zabbix，获得授权码
	 * 
	 * @param userName
	 *            ：用户名
	 * @param password
	 *            ：密码
	 * @return
	 */
	public String login(String userName, String password) {
		ZabbixRequestObject requestObject = ZabbixRequestBuilder.newBuilder().method("user.login")
				.paramEntry("user", userName).paramEntry("password", password).build();
		JSONObject response = this.call(requestObject);
		auth = response.getString("result");

		logger.info("login zabbix result auth:" + auth);
		return auth;
	}

	/**
	 * 查询items
	 * 
	 * @param hostName
	 *            ：主机名称
	 * @param searchKey
	 *            ：查询key
	 * @param outputs
	 *            ：返回结果集
	 * @return
	 */
	public JSONObject queryItems(String hostName, String searchKey, String ...outputs) {
		JSONObject response = null;
		JSONObject search = new JSONObject();
		search.put("key_", searchKey);

		ZabbixRequestObject requestObject = ZabbixRequestBuilder.newBuilder().method("item.get")
				.setAuth(auth)
				.paramEntry("output", ArrayUtils.isEmpty(outputs) ? "extend" : outputs)
				.paramEntry("host", hostName)
				.paramEntry("search", search).build();
		response = this.call(requestObject);
		logger.info("queryItems:" + response == null ? "null" : response.toJSONString());
		return response;
	}
	
	/**
	 * 查询items的值
	 * 
	 * @param hostName
	 *            ：主机名称
	 * @param searchKey
	 *            ：查询key
	 * @return
	 */
	public String queryItemsValue(String hostName, String searchKey) {
		JSONObject json = this.queryItems(hostName, searchKey, "lastvalue");
		if (json != null && json.containsKey("result")) {
			Double value = json.getJSONArray("result").getJSONObject(0).getDouble("lastvalue");
			return ConfigUtil.DF.format(value * 100) + "%";
		}
		return null;
	}

	/**
	 * 查询host信息
	 * 
	 * @param hostName
	 *            ：hostname（一般为ip）
	 * @return
	 */
	public JSONObject queryHost(String hostName) {
		JSONObject response = null;
		JSONObject search = new JSONObject();
		search.put("host", hostName);
		ZabbixRequestObject requestObject = ZabbixRequestBuilder.newBuilder().method("item.get")
				.paramEntry("output", "extend").paramEntry("filter", hostName).build();

		response = this.call(requestObject);
		logger.info("queryHost:" + response == null ? "null" : response.toJSONString());

		return response;
	}

	/**
	 * 发送请求，返回json
	 * 
	 * @param requestObject
	 * @return
	 */
	public JSONObject call(ZabbixRequestObject requestObject) {
		try {
			if (StringUtils.isEmpty(requestObject.getAuth()) && !"user.login".equals(requestObject.getMethod())) {
				if (auth == null) {
					auth = this.login();
				}
				requestObject.setAuth(auth);
			}
			
			RequestBuilder builder = RequestBuilder.post().setUri(ZABBIX_APP_URL.trim())
					.addHeader("Content-Type", "application/json");
			HttpUriRequest httpRequest = builder
					.setEntity(new StringEntity(JSON.toJSONString(requestObject), "utf-8")).build();
			CloseableHttpClient httpclient = HttpClients.custom().build();
			CloseableHttpResponse response = httpclient.execute(httpRequest);
			HttpEntity entity = response.getEntity();
			byte[] data = EntityUtils.toByteArray(entity);
			// System.out.println(new String(data));
			JSONObject json = (JSONObject) JSONObject.parse(data);
			
			if (json.containsKey("error") && "-32602".equals(json.getJSONObject("error").getString("code"))) {
				//登录超时
				requestObject.setAuth(this.login());
				httpRequest = builder.setEntity(new StringEntity(JSON.toJSONString(requestObject), "utf-8")).build();
				response = httpclient.execute(httpRequest);
				entity = response.getEntity();
				data = EntityUtils.toByteArray(entity);
				json = (JSONObject) JSONObject.parse(data);
			}
			
			return json;
		} catch (Exception ex) {
			logger.error("zabbix请求异常,请求方法：" + requestObject.getMethod() + ",异常信息：" + ex.getMessage());
			throw new RuntimeException("ZabbixRequestBuilder 请求zabbix服务失败！", ex);
		}
	}
	
	/**
	 * 批量获得主机信息
	 * @param keys	:key_
	 * @param hosts	:主机名称（一般为ip）
	 * @param outputs	:输出
	 * @return
	 */
	public JSONObject getItemsByKeyHostids(Collection<String> keys, Collection<String> hosts, String ...outputs) {
		JSONObject filter = new JSONObject();
		filter.put("key_", keys);
		filter.put("host", hosts);
		
		ZabbixRequestObject requestObject = ZabbixRequestBuilder.newBuilder().method("item.get")
				.paramEntry("outputs", ArrayUtils.isEmpty(outputs) ? "extend" : outputs)
				.paramEntry("filter", filter)
				//.paramEntry("selectInterfaces", new String[] {"interfaceid", "hostid", "ip", "type"})
				//.paramEntry("selectTriggers", new String[] {"triggerid", "state"})
				//.paramEntry("selectHistory", new String[] {"value"})
				//.paramEntry("selectHosts", new String[] {"host", "hostId", "available", "name"})
				.build();
		
		return this.call(requestObject);
		
	}
	
	
	public JSONArray getHostList() {
		
		ZabbixRequestObject requestObject = ZabbixRequestBuilder.newBuilder().method("host.get").build();
		
		JSONObject json = this.call(requestObject);
		if (json != null && json.containsKey("result")) {
			return json.getJSONArray("result");
		}
		return null;
	}
	
	public static void main(String[] args) {
		ZabbixUtils zabbixUtils = ZabbixUtils.getZabbixUtils();
		//zabbixUtils.queryItems("10.10.10.105", "system.cpu.load[percpu,avg1]", "lastvalue");
		
		List<String> keys = new ArrayList<> ();
		keys.add("system.cpu.load[percpu,avg1]");
		keys.add("vm.memory.size[free]");
		keys.add("vfs.fs.discovery");
		keys.add("net.if.in[Intel(R) PRO/1000 MT Network Connection]");
		
		List<String> hosts = new ArrayList<> ();
		hosts.add("10.10.10.105");
		hosts.add("10.10.10.107");
		
		//JSONObject json = zabbixUtils.getItemsByKeyHostids(keys, hosts, "lastvalue");
		JSONArray json = zabbixUtils.getHostList();
		
		System.out.println(json.toJSONString());
		
	}
	
}
