package com.cinema.sys.utils;

import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.text.SimpleDateFormat;

/**
 * 项目参数工具类
 * 
 * 
 */
public class ConfigUtil {

	public final static String ROOT_ID="root";
	public final static String SUPADMIN_ID="1";
	public final static SimpleDateFormat TIME_SDF = new SimpleDateFormat("hh:mm:ss");
    public final static SimpleDateFormat DATE_TIME = new SimpleDateFormat("yyy-MM-dd hh:mm:ss");
    public final static SimpleDateFormat DAY_TIME = new SimpleDateFormat("yyy-MM-dd");
    //token超时时间
    public final static Integer TOKEN_VALID_TIME = Integer.valueOf(ResourceUtil.getConfigValueByKey("token.validtime"));
    //redis_url
    public final static String REDIS_URL = ResourceUtil.getConfigValueByKey("redis.url");
    //isredis
    public final static Integer REDIS_PORT = Integer.valueOf(ResourceUtil.getConfigValueByKey("redis.redisport"));
    //isredis
    public final static Integer ISREDIS = Integer.valueOf(ResourceUtil.getConfigValueByKey("redis.isredis"));
    //istoken
    public final static Integer ISTOKEN = Integer.valueOf(ResourceUtil.getConfigValueByKey("istoken"));
    
    public final static String UPLOAD_DIR= ResourceUtil.getConfigValueByKey("upload_dir");
    
    //报表服务地址
    public final static String REPORT_HOST = ResourceUtil.getConfigValueByKey("report.host");
    public final static DecimalFormat DF = new DecimalFormat("#0.00");

	public static final NumberFormat NF = NumberFormat.getInstance();
	
	//设备监控页面，获得设备在线时间间隔
	public static final int ONLINE_INTERVAL_TIME = Integer.parseInt(ResourceUtil.getConfigValueByKey("online_interval_time"));
}
