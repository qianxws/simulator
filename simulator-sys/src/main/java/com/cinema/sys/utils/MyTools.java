package com.cinema.sys.utils;

import java.lang.reflect.Field;
import java.math.BigDecimal;
import java.security.MessageDigest;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.nutz.dao.entity.annotation.Id;

import com.alibaba.fastjson.JSONObject;

public class MyTools {
	/**
	 * double四舍五入取两位小数
	 * 
	 * @return
	 */
	public static Double formatDouble(Double d) {
		BigDecimal bd = new BigDecimal(d);
		return bd.setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue();
	}
	
	public static String byte2hex(byte[] b)
	{
		String hs = "";
		String stmp = "";
		for (int n = 0; n < b.length; n++)
		{
			stmp = Integer.toHexString(b[n] & 0xFF);
			if (stmp.length() == 1)
			{
				hs = hs + "0" + stmp;
			}
			else
			{
				hs = hs + stmp;
			}
		}
		return hs.toUpperCase();
	}
	
	public static String password(String password){
		if(password==null)return null;
		if(password.isEmpty())return password;
		try{
			MessageDigest md = MessageDigest.getInstance("SHA-1"); //$NON-NLS-1$
			byte[] bytes = password.getBytes();
			bytes = md.digest(bytes);
			md.reset();
			bytes = md.digest(bytes);
			return '*' + byte2hex(bytes);
			
		}catch(Exception e){
			return null;
		}
	}
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public static void applyProperties(final Object dest, final Object src) throws RuntimeException{
		Field[] fields = dest.getClass().getDeclaredFields();
		try{
			for(Field f : fields){
				boolean accessible = f.isAccessible();
				f.setAccessible(true);
				try{
					Object o = f.get(src);
					if(o==null){
						f.set(dest,null);
					}else if(o instanceof List){
						applyChanges((List)f.get(dest),(List)o);
					}else{
						f.set(dest,o);
					}
				}finally{
					f.setAccessible(accessible);
				}
			}
		}catch(Exception ex){
			throw new RuntimeException(ex);
		}
    }
	@Deprecated
	public static <T> void applyChanges(List<T> poList, List<T> voList, Class<T> cls){
		applyChanges(poList,voList);
	}
	public static <T> void applyChanges(List<T> poList, List<T> voList){
		Class<?> cls = null;
		if(!poList.isEmpty()){
			cls = poList.get(0).getClass();
		}else if(!voList.isEmpty()){
			cls = voList.get(0).getClass();
		}
		if(cls==null)return;
		// TODO Auto-generated method stub
		if(voList==null)return;	//Need not change
		try{
			Field idField = null;
			//先找到Id的column
			for(Field f : cls.getDeclaredFields()){
				Id an= f.getAnnotation(Id.class);
				if(an!=null){
					idField = f;
					break;
				}
			}
			if(idField==null)throw new RuntimeException("Entity have no Id annotion");
			idField.setAccessible(true);
			//先查找需要删除的
			int i=0,j=0;
			for(i=poList.size()-1;i>=0;i--){
				Object id1=idField.get(poList.get(i));
				for(j=0;j<voList.size();j++){
					if(id1.equals(idField.get(voList.get(j)))){
						//需要修改的
						applyProperties(poList.get(i), voList.get(j));
						break;
					}
				}
				if(j==voList.size()){
					//not found in voList, then must be deleted
					poList.remove(i);
				}
			}
			//再查找新增加的
			for(i=0;i<voList.size();i++){
				Object id1=idField.get(voList.get(i));
				if(id1==null){
					//需要新增加
					poList.add(voList.get(i));
				}
				if(id1 instanceof Long){
					if( ((Long)id1) == 0){
						poList.add(voList.get(i));
					}
				}else if(id1 instanceof Integer){
					if( ((Integer)id1) == 0){
						poList.add(voList.get(i));
					}
				}
				for(j=0;j<poList.size();j++){
					if(id1.equals(idField.get(poList.get(j))))break;
				}
				if(j==poList.size()){
					//not found in voList, then must be deleted
					poList.add(voList.get(i));
				}
			}

		}catch(Exception ex){
			throw new RuntimeException(ex);
		}
	}
	
	/**
	 * 获取用户ip
	 * 
	 * @param request
	 * @return
	 */
	public static String getRemoteHost(HttpServletRequest request) {

		if (request == null) {
			return null;
		}

		String ip = request.getHeader("x-forwarded-for");
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("Proxy-Client-IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("WL-Proxy-Client-IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getRemoteAddr();
		}
		return ip.equals("0:0:0:0:0:0:0:1") ? "127.0.0.1" : ip;
	}
	
	/**
	 * 获取浏览器头信息内容
	 * @param request
	 * @return
	 */
	public static JSONObject getHeader(HttpServletRequest request) {
		// 取出头信息内容
    	String host=request.getHeader("host");
    	String referer=request.getHeader("referer");
    	String agent=request.getHeader("user-agent");
    	String language=request.getHeader("accept-language");
    	String encoding=request.getHeader("accept-encoding");
    	JSONObject jb = new JSONObject();
    	jb.put("host", host);
    	jb.put("referer", referer);
    	jb.put("agent", agent);
    	jb.put("language", language);
    	jb.put("encoding", encoding);
    	return jb;
	}
	
	/**
	 * 获取webapps绝对路径
	 * @param default_
	 * @return
	 */
	public static String getRealPath(HttpServletRequest request, String default_) {
		return request.getServletContext().getRealPath(default_);
	}
}
