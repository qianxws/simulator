package com.cinema.common.action;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.alibaba.fastjson.JSONObject;
import com.cinema.common.service.AlarmMapService;
import com.cinema.sys.action.util.ActionContext;
import com.cinema.sys.action.util.Service;
import com.cinema.sys.service.LogService;
import com.cinema.sys.utils.MyParam;

@Component
@Service(name = "alarmMapAction")
public class AlarmMapAction {
	@Autowired
	private AlarmMapService alarmMapService;

	@Autowired
	private LogService logService;
	
	/**
	 * 获得影院数异常数
	 * @return
	 */
	public JSONObject getMapTitle(ActionContext cxt) {
		return alarmMapService.getMapTitle();
	}
	
	/**
	 * 获得运维管理全国地图的报警数据
	 * @return
	 */
	public JSONObject getChinaMap(ActionContext cxt) {
		JSONObject json = new JSONObject();
		json.put("cinemaData", alarmMapService.getCinemaData(null));
		json.put("provinceData", alarmMapService.getProvinceData());
		return json;
	}
	
	/**
	 * 获得运维管理全省地图的报警数据
	 * @return
	 */
	public JSONObject getProvinceMap(ActionContext cxt) {
		JSONObject json = new JSONObject();
		String provinceId = MyParam.getString(cxt, "provinceId");
		json.put("cinemaData", alarmMapService.getCinemaData(provinceId));
		json.put("cityData", alarmMapService.getCityData(provinceId));
		return json;
	}

}
