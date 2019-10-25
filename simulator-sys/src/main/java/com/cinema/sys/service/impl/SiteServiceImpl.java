package com.cinema.sys.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cinema.sys.dao.SiteMapper;
import com.cinema.sys.model.Site;
import com.cinema.sys.model.base.TSite;
import com.cinema.sys.service.SiteService;
import com.cinema.sys.utils.MyUUID;

@Service
public class SiteServiceImpl implements SiteService {
	
	@Autowired  
    private SiteMapper siteDao;  
	
	/**详情*/
	@Override
	public Site getDetail() {
		List<Site> list=siteDao.getList();
		Site site=new Site();
		for(Site m:list)
			site=m;
		return site;
	}

	
	/**添加*/
	@Override
	public int save(TSite t) {
		if(t.getId()==null){
			t.setId(MyUUID.getUUID());
			return siteDao.insertSelective(t);
		}
		else
			return siteDao.updateByPrimaryKeySelective(t);
	}

}
