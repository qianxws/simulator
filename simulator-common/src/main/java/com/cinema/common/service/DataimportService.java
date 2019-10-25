package com.cinema.common.service;

import java.util.List;

import com.cinema.common.model.ImportError;

public interface DataimportService {
	/**
	 * 导入影片
	 * @param paraMap
	 */
	List<ImportError> importFilm();
}
