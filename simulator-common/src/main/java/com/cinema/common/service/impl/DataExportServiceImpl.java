package com.cinema.common.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cinema.common.dao.DataExportMapper;
import com.cinema.common.service.DataExportService;

@Service
public class DataExportServiceImpl  implements DataExportService{
	
	@Autowired  
    private DataExportMapper dataExportDao;

	/** 获得影片总数*/
	@Override
	public int getFilmTotal() {
		return dataExportDao.getFilmTotal();
	}

	/** 分页查询所有影片信息*/
	@Override
	public List<Map<String, Object>> getFilmExcel(int rows,int offset) {
		return dataExportDao.getFilmExcel(rows,offset);
	}

}
