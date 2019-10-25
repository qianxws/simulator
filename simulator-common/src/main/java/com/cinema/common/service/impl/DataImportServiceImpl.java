package com.cinema.common.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cinema.common.dao.DataImportMapper;
import com.cinema.common.model.ImportError;
import com.cinema.common.service.DataimportService;

@Service
public class DataImportServiceImpl  implements DataimportService{
	
	@Autowired  
    private DataImportMapper dataImportDao;
	
	@Override
	public List<ImportError> importFilm() {
		//先执行getImportError，再执行import,执行顺序不能相反
		List<ImportError> list=dataImportDao.getImportErrorFilm_postgresql();
		dataImportDao.importFilm();
		return list;
	}
	
}
