package com.cinema.sys.action.util;

import java.lang.reflect.Method;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.core.annotation.AnnotationUtils;

import com.alibaba.fastjson.JSONObject;

/**
 * Ajax的Servcie bean只需要在Spring里定义即可，不需要指定bean的ID。系统会自动搜索spring的所有bean,
 * 对具有Service标注的类进行处理
 */
public class ActionCache {
	
	private static ActionCache serviceCache = new ActionCache();
	private LinkedHashMap<String, ServiceInfo> map = new LinkedHashMap<String, ServiceInfo>();

	private ActionCache() {

	}

	public static synchronized void registerBean(Object bean) {
		LinkedHashMap<String, ServiceInfo> map = serviceCache.map;
		// 这么处理的目的是，为了防止被TransactionProxyFactoryBean代理的目标类的注解无法穿透问题
		Class<?> cls = bean.getClass();
		Service serviceAnnotation = AnnotationUtils.findAnnotation(cls, Service.class);
		if (serviceAnnotation == null)
			return;
		ServiceInfo info = new ServiceInfo();
		info.serviceName = serviceAnnotation.name();
		info.serviceBean = bean;
		map.put(info.getServiceName(), info);
		//LOG.info("info.serviceName, " + info.serviceName + " set success!!!");
	}

	/*
	private static JSONObject getHtml(String url) throws Exception {
		URL loginUrl = new URL(url);
		HttpURLConnection httpCon = (HttpURLConnection) loginUrl.openConnection();
		httpCon.setRequestMethod("GET");
		httpCon.setDefaultUseCaches(false);
		httpCon.setDoInput(true);
		httpCon.setInstanceFollowRedirects(true);

		httpCon.setDoOutput(false);
		StringBuffer sb = new StringBuffer();

		BufferedReader rd = new BufferedReader(new InputStreamReader(httpCon.getInputStream(), "utf-8"));

		char buf[] = new char[512];
		while (true) {
			int size = rd.read(buf);
			if (size < 0)
				break;
			sb.append(buf, 0, size);
		}

		return JSON.parseObject(sb.toString());
	}

	private static String byteArr2HexStr(byte[] arrB) {
		int iLen = arrB.length;

		StringBuffer sb = new StringBuffer(iLen * 2);
		for (int i = 0; i < iLen; i++) {
			int intTmp = arrB[i];

			while (intTmp < 0) {
				intTmp = intTmp + 256;
			}

			if (intTmp < 16) {
				sb.append("0");
			}
			sb.append(Integer.toString(intTmp, 16));
		}
		return sb.toString();
	}
	*/

	public static Map<String, ServiceInfo> getServiceMap() {
		return serviceCache.map;
	}

	/**
	 * 返回true表示需要对ctx进行ajax渲染，并写到response中。返回false表示 已经对response进行写处理了（比如下载文件）
	 * 
	 * @param service
	 * @param verb
	 * @param ctx
	 * @return
	 * @throws Exception
	 */
	public static Object invoke(String service, String verb, ActionContext cxt, HttpServletRequest request)
			throws Exception {

		ServiceInfo info = serviceCache.map.get(service);

		if (info == null)
			throw new Exception("Service " + service + " 未定义。");

		Object ajaxService = info.serviceBean;

		Class<?> cls = ajaxService.getClass();

		Method method = null;
		try {
			method = cls.getMethod(verb, ActionContext.class);
		} catch (Exception e) {
			e.printStackTrace();
			throw new Exception("服务" + service + "未实现动词" + verb + "");
		}

		Object model = null;
		if (method.getReturnType().equals(void.class)) {
			try {
				model = null;
				method.invoke(ajaxService, cxt);
			} catch (Exception e) {
				e.printStackTrace();
				throw new Exception("服务:" + e.getMessage());
			}
		} else if (method.getReturnType().equals(JSONObject.class)) {
			try {
				model = method.invoke(ajaxService, cxt);
			} catch (Exception e) {
				e.printStackTrace();
				throw new Exception("服务:" + e.getMessage());
			}
		} else if (method.getReturnType().equals(List.class)) {
			try {
				model = method.invoke(ajaxService, cxt);
			} catch (Exception e) {
				e.printStackTrace();
				throw new Exception("服务:" + e.getMessage());
			}
		} else {
			throw new Exception("服务" + service + "." + verb + "必须返回model或者null或者void");
		}
		return model;
	}

	public static class ServiceInfo {
		Object serviceBean;
		String serviceName;

		public void setServiceBean(Object serviceBean) {
			this.serviceBean = serviceBean;
		}

		public Object getServiceBean() {
			return serviceBean;
		}

		public void setServiceName(String serviceName) {
			this.serviceName = serviceName;
		}

		public String getServiceName() {
			return serviceName;
		}
	}
}
