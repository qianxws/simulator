package com.cinema.common.service.impl;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.cinema.common.dao.ChartMapper;
import com.cinema.common.model.CommonFtfc;
import com.cinema.common.service.ChartService;
import com.cinema.sys.utils.TimeUtil;

@Service
public class ChartServiceImpl implements ChartService {
	
	@Autowired  
    private ChartMapper chartDao;

	@Override
	public JSONObject getLineChart(Map<String, Object> paraMap) {
		
		List<Map<String,Object>> maps = chartDao.getLineChart(paraMap);
		JSONArray  cat = new JSONArray();
		JSONArray  report = new JSONArray ();
		JSONArray  verify = new JSONArray();
		
		for (Map<String,Object> map : maps) {
			cat.add(map.get("playtime").toString());
			verify.add(Double.valueOf(new DecimalFormat("#.00").format(map.get("reportpeoples"))));
			report.add(map.get("verifypeoples"));
		}
		
		JSONObject json = new JSONObject();
		json.put("cat", cat);
		json.put("report", report);
		json.put("verify", verify);
		return json;
	}
	
	private JSONObject  getChart(List<Map<String,Object>> list) {
		List<String> cat = new ArrayList<> ();
		List<Double> data = new ArrayList<> ();
		for(Map<String,Object> map : list) {
			cat.add(map.get("name").toString());
			data.add(Double.valueOf(new DecimalFormat("#.00").format(map.get("ticketoffice"))));
		}
		
		JSONObject json = new JSONObject();
		json.put("cat", cat);
		json.put("data", data);
		return json;
	}


	@Override
	public JSONObject  findBoxOfficeLine(Map<String, Object> paraMap) {
		
		List<Map<String,Object>> maps =chartDao.findBoxOfficeLine(paraMap);
		List<String> cat = new ArrayList<> ();
		List<Double> data = new ArrayList<> ();
		
		for (Map<String,Object> map : maps) {
			cat.add(map.get("playtime").toString());
			//保留两位小数，这是票房单位万元
			String str = map.get("ticketoffice") == null ? "0" : String.format("%.2f", map.get("ticketoffice"));
			data.add(Double.valueOf(str));
		}
		
		JSONObject json = new JSONObject();
		json.put("cat", cat);
		json.put("data", data);
		return json;
	}


	@Override
	public List<CommonFtfc> getCinemaRank(Map<String, Object> paraMap) {
		List<Map<String,Object>> maps = chartDao.getCinemaRank(paraMap);
		if (null != maps && maps.size() > 0) {
			List<CommonFtfc> ftfcList = new ArrayList<CommonFtfc>();
			DecimalFormat format = new DecimalFormat("#0.00");
			for (Map<String,Object> map : maps) {
				CommonFtfc ftfc = new CommonFtfc();
				ftfc.setCinemaName(map.get("cinema").toString());
				ftfc.setTicketOffice(Double.valueOf(format.format(Double.valueOf(String.valueOf(map.get("ticketoffice"))) / 10000)));
				ftfc.setPeopleRatio("0".equals(String.valueOf(map.get("peopleratio"))) ? "0.00%" : map.get("peopleratio")+"%");
				ftfcList.add(ftfc);
			}
			return ftfcList;
		}else {
			return null;
		}
	}

	@Override
	public List<CommonFtfc> getFilmRank(Map<String, Object> paraMap) {
		List<Map<String,Object>> maps = chartDao.getFilmRank(paraMap);
		if (null != maps && maps.size() > 0) {
			List<CommonFtfc> ftfcList = new ArrayList<CommonFtfc>();
			DecimalFormat format = new DecimalFormat("#0.00");
			for (Map<String,Object> map : maps) {
				CommonFtfc ftfc = new CommonFtfc();
				ftfc.setFilmName(map.get("name").toString());
				ftfc.setTicketOffice(Double.valueOf(format.format(Double.valueOf(String.valueOf(map.get("ticketoffice"))) / 10000)));
				ftfc.setPeopleRatio("0".equals(String.valueOf(map.get("peopleratio"))) ? "0.00%" : map.get("peopleratio")+"%");
				ftfcList.add(ftfc);
			}
			return ftfcList;
		}else {
			return null;
		}
	}
	

	
	/**
	 * 全国票房七天
	 */
	@Override
	public JSONObject  chartSevenOffice() {
		return getChart(chartDao.chartSevenOffice(TimeUtil.getBeforeWeekStart()));
	}
	
	/**
	 * 影片票房排名
	 */
	@Override
	public JSONObject  chartFilmOffice() {
		return getChart(chartDao.chartFilmOffice());
	}
	
	/**
	 * 影院票房排名
	 * @return
	 */
	@Override
	public JSONObject  chartCinemaOffice() {
		//查出前十条影院票房排名
		return getChart(chartDao.chartCinemaOffice());
	}
	
	/**
	 * 院线票房排名
	 * @return
	 */
	@Override
	public JSONObject chartCompanyOffice() {
		//查出前十条院线票房排名
		return getChart(chartDao.chartCompanyOffice());
	}
	/**
	 * 影片票房昨日排名
	 * @return
	 */
	@Override
	public JSONObject chartYesterdayFilmOffice() {
		return getChart(chartDao.chartYesterdayFilmOffice());
	}
	
	/**
	 * 影院昨日票房排名
	 * @return
	 */
	@Override
	public JSONObject  chartYesterdayCinemaOffice() {
		return getChart(chartDao.chartYesterdayCinemaOffice());
	}

	/**
	 * 院线昨日票房排名
	 * @return
	 */
	@Override
	public JSONObject chartYesterdayCompanyOffice() {
		return getChart(chartDao.chartYesterdayCompanyOffice());
	}
	
}
