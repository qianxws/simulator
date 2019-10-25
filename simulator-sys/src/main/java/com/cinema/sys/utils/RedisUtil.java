package com.cinema.sys.utils;

import java.util.HashMap;
import java.util.Map;

import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;
import redis.clients.jedis.JedisPoolConfig;

public class RedisUtil {

	private static JedisPool pool=null;
	
	/**
	 * 获取连接池
	 * @return
	 */
	public static JedisPool getPool() {
		if(pool==null) {
			JedisPoolConfig config=new JedisPoolConfig();
			//config.setmax
			config.setMaxIdle(5);
			config.setMaxWaitMillis(1000*100);
			config.setTestOnBorrow(true);
			pool=new JedisPool(config,ConfigUtil.REDIS_URL,ConfigUtil.REDIS_PORT);
		}
		return pool;
	}
	
	/**
	 * 返回
	 * @param pool
	 * @param redis
	 */
	public static void returnResource(Jedis redis) {
		if(redis!=null) {
			//pool.r
		}
	}
	
	/**
	 * 存入key,value
	 * @param key
	 * @param value
	 * @return
	 */
	public static String set(String key,String value) {
		Jedis jedis=null;
		try {
			pool=getPool();
			jedis=pool.getResource();
			return jedis.set(key, value);
		}catch (Exception e) {
			e.printStackTrace();
			return "0";
		}finally {
			jedis.close(); 
		}
	}
	
	
	/**
	 * 获取数据
	 * @param key
	 * @return
	 */
	public static String get(String key){
		String value=null;
		JedisPool pool=null;
		Jedis jedis=null;
		try {
			pool=getPool();
			jedis=pool.getResource();
			value=jedis.get(key);
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			jedis.close();
		}
		return value;
	}
	
	
	
	/**
	 * 删除数据
	 * @param args
	 */
	
	public static void delInfo(String str) {
		JedisPool pool=null;
		Jedis jedis=null;
		try {
			pool=getPool();
			jedis=pool.getResource();
			jedis.del(str);
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			jedis.close();
		}
		
	}
	
	
	/**
	 * 存入hashmap
	 * @param key
	 * @param value
	 * @return
	 */
	public static String hmset(String key,Map<String,String > value) {
		Jedis jedis=null;
		try {
			pool=getPool();
			jedis=pool.getResource();
			
			return jedis.hmset(key, value);
		}catch (Exception e) {
			e.printStackTrace();
			return "0";
		}finally {
			jedis.close(); 
		}
	}
	
	/**
	 * 获取hashmap
	 * @param key
	 * @return
	 */
	public static Map<String, String> hget(String token){
		Map<String,Map<String,String>> result=new HashMap<String, Map<String,String>>();
		JedisPool pool=null;
		Jedis jedis=null;
		Map<String, String> value=null;
		try {
			pool=getPool();
			jedis=pool.getResource();
			value=jedis.hgetAll(token);
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			jedis.close();
		}
		return value;
	}
	
	public static void main(String[] args) {
		
		/*for(int i=0;i<10;i++) {
			data.put("k"+i, "v"+i);
			RedisAPI.hmset("k"+i,data);
		}*/
		//RedisAPI.delInfo("token1");
		Map<String,String> data=new HashMap<String, String>();
		data.put("token", "123");
		data.put("userId", "123");
		data.put("isAdmin", "123");
		data.put("authCodes", "123");
		hmset("token1",data);
		data.put("token", "456");
		data.put("userId", "456");
		data.put("isAdmin", "456");
		data.put("authCodes", "456");
		hmset("token2",data);
		Map<String, String> result=hget("token1");
		System.out.println(result);
		
		String token=result.get("token");
		System.out.println(token);
		/*for (int i = 0; i < 10; i++) {
			RedisAPI.set("111","1w");
		}
		for (int i = 0; i < 10; i++) {
			System.out.println(i + "==" + RedisAPI.get("111"));
		}*/
		//RedisAPI.delInfo("111");
		
		
	}

}
