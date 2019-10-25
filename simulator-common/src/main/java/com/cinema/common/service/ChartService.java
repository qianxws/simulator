package com.cinema.common.service;

import java.util.List;
import java.util.Map;

import com.alibaba.fastjson.JSONObject;
import com.cinema.common.model.CommonFtfc;

public interface ChartService {
	
	JSONObject getLineChart(Map<String, Object> paraMap);
	JSONObject findBoxOfficeLine(Map<String, Object> paraMap);
	
	List<CommonFtfc> getCinemaRank(Map<String, Object> paraMap);
	List<CommonFtfc> getFilmRank(Map<String, Object> paraMap);
	
	/**
	 * 全国票房七天
	 * @return
	 */
	JSONObject   chartSevenOffice();
	/**
	 * 影片票房排名
	 * @return
	 */
	JSONObject chartFilmOffice();
	/**
	 * 影院票房排名
	 * @return
	 */
	JSONObject chartCinemaOffice();
    /**
	 * 院线票房排名
	 * @return
	 */
	JSONObject chartCompanyOffice();
	/**
	 * 影片票房昨日排名
	 * @return
	 */
	JSONObject chartYesterdayFilmOffice();
	/**
	 * 影院昨日票房排名
	 * @return
	 */
	JSONObject chartYesterdayCinemaOffice();
	/**
	 * 院线昨日票房排名
	 * @return
	 */
	JSONObject chartYesterdayCompanyOffice();
}
