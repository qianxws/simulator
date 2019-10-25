package com.cinema.common.dao;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

public interface ChartMapper{

	List<Map<String,Object>> getLineChart(@Param("paraMap") Map<String, Object> paraMap);
	
	List<Map<String,Object>> findBoxOfficeLine(@Param("paraMap") Map<String, Object> paraMap);
	
	List<Map<String,Object>> getCinemaRank(@Param("paraMap") Map<String, Object> paraMap);
	List<Map<String,Object>> getFilmRank(@Param("paraMap") Map<String, Object> paraMap);

	/**
	 * 全国票房七天
	 * @param time
	 * @return
	 */
	List<Map<String,Object>> chartSevenOffice(Date time);
	/**
	 * 影片票房排名
	 * @return
	 */
	List<Map<String,Object>> chartFilmOffice();
	/**
	 * 影院票房排名
	 * @return
	 */
	List<Map<String,Object>> chartCinemaOffice();
	/**
	 * 院线票房排名
	 * @return
	 */
	List<Map<String,Object>> chartCompanyOffice();
	/**
	 * 影片票房昨日排名
	 * @return
	 */
	List<Map<String,Object>> chartYesterdayFilmOffice();
	/**
	 * 影院昨日票房排名
	 * @return
	 */
	List<Map<String,Object>> chartYesterdayCinemaOffice();
	/**
	 * 院线昨日票房排名
	 * @return
	 */
	List<Map<String,Object>> chartYesterdayCompanyOffice();
}