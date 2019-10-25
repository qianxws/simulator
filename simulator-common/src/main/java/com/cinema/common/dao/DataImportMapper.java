package com.cinema.common.dao;

import java.util.List;

import com.cinema.common.model.ImportError;

public interface DataImportMapper{
	/**
	 * 导入影片
	 * @param paraMap
	 */
	List<ImportError> getImportErrorFilm_mysql();
	List<ImportError> getImportErrorFilm_postgresql();
	void importFilm();
}