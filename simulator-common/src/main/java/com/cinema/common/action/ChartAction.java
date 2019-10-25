package com.cinema.common.action;


import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.alibaba.fastjson.JSONObject;
import com.cinema.common.service.ChartService;
import com.cinema.sys.action.util.ActionContext;
import com.cinema.sys.action.util.Service;
import com.cinema.sys.utils.MyParam;
import com.cinema.sys.utils.TimeUtil;


/**
 * 地图对象接口
 */
@Component
@Service(name = "chartAction")
public class ChartAction {
	@Autowired
	private ChartService chartService;
	
	//获取曲线图
	public JSONObject getLineChart(ActionContext cxt) {
		Map<String, Object> paraMap = new HashMap<> ();
		paraMap.put("startTime", TimeUtil.stringToDate(MyParam.getString(cxt, "startTime") + " 00:00:00"));
		paraMap.put("endTime", TimeUtil.stringToDate(MyParam.getString(cxt, "endTime")+ " 23:59:59"));
		return chartService.getLineChart(paraMap);
	}

	public JSONObject getHighChart(ActionContext cxt) {
		String str="{\"cat\":[\"2018-12-24\",\"2018-12-25\",\"2018-12-26\",\"2018-12-27\",\"2018-12-28\"]," + 
				"\"report\":[19457,17661,18939,18628,18661]," + 
				"\"verify\":[12146,18393,11986,17886,10912]," + 
				"\"success\":true}";
	    return JSONObject.parseObject(str);
	}

	
	//全国影院票房七天
	public JSONObject chartSevenOffice(ActionContext cxt){
		return chartService.chartSevenOffice();
	}
	
	//影片排行
	public JSONObject chartFilmOffice(ActionContext cxt){
		return chartService.chartFilmOffice();
	}
	//影院排行
	public JSONObject chartCinemaOffice(ActionContext cxt){
		return chartService.chartCinemaOffice();
	}
	//院线排行
	public JSONObject chartCompanyOffice(ActionContext cxt){
		return chartService.chartCompanyOffice();
	}
	//影片昨日排行
	public JSONObject chartYesterdayFilmOffice(ActionContext cxt){
		return chartService.chartYesterdayFilmOffice();
	}
	
	//影院昨日排行
	public JSONObject chartYesterdayCinemaOffice(ActionContext cxt){
		return chartService.chartYesterdayCinemaOffice();
	}
	
	//院线昨日排行
	public JSONObject chartYesterdayCompanyOffice(ActionContext cxt){
		return chartService.chartYesterdayCompanyOffice();
	}
	
	//获取票房趋势图
	public JSONObject getBoxOffice(ActionContext cxt) {
		Map<String, Object> paraMap = new HashMap<> ();
		paraMap.put("startTime", TimeUtil.stringToDate(MyParam.getString(cxt, "startTime") + " 00:00:00"));
		paraMap.put("endTime", TimeUtil.stringToDate(MyParam.getString(cxt, "endTime")+ " 23:59:59"));
		return chartService.findBoxOfficeLine(paraMap);
	}
	


	/**
	 * 影院排行条形图
	 * @param cxt
	 * @return
	 */
	public JSONObject getCinemaRankByDate(ActionContext cxt) {
		JSONObject json = new JSONObject();
		Map<String, Object> paraMap = new HashMap<> ();
		paraMap.put("startTime", TimeUtil.stringToDate(MyParam.getString(cxt, "startTime") + " 00:00:00"));
		paraMap.put("endTime", TimeUtil.stringToDate(MyParam.getString(cxt, "endTime")+ " 23:59:59"));
		json.put("cinemaData", chartService.getCinemaRank(paraMap));
		return json;
	}
	
	/**
	 * 影片排行条形图
	 * @param cxt
	 * @return
	 */
	public JSONObject getFilmRankByDate(ActionContext cxt) {
		JSONObject json = new JSONObject();
		Map<String, Object> paraMap = new HashMap<> ();
		paraMap.put("startTime", TimeUtil.stringToDate(MyParam.getString(cxt, "startTime") + " 00:00:00"));
		paraMap.put("endTime", TimeUtil.stringToDate(MyParam.getString(cxt, "endTime")+ " 23:59:59"));
		json.put("filmData", chartService.getFilmRank(paraMap));
		return json;
	}
}