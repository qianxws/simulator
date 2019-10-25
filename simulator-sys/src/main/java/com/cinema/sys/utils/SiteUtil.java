package com.cinema.sys.utils;

import com.cinema.sys.model.Site;
import com.cinema.sys.service.SiteService;

/**
 * 站点配置工具类
 * 
 */
public class SiteUtil {
	private final static SiteService fSiteService = SpringBeanUtil.getBean(SiteService.class);
	
	public final static Site site = fSiteService.getDetail();
}
