package com.cinema.sys.service;

import com.cinema.sys.model.Site;
import com.cinema.sys.model.base.TSite;

public interface SiteService {
	
    Site getDetail();
	
	/**添加或更新*/
	int save(TSite t);
}
