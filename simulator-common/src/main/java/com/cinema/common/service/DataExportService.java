package com.cinema.common.service;

import java.util.List;
import java.util.Map;

public interface DataExportService {
	
	int getFilmTotal();
	
	List<Map<String,Object>> getFilmExcel(int rows,int offset);
}
