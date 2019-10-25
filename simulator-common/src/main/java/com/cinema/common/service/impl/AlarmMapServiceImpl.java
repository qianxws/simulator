package com.cinema.common.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSONObject;
import com.cinema.common.dao.AlarmMapMapper;
import com.cinema.common.model.MapItem;
import com.cinema.common.service.AlarmMapService;
import com.cinema.sys.utils.TimeUtil;

@Service
public class AlarmMapServiceImpl implements AlarmMapService {
	
	@Autowired  
    private AlarmMapMapper alarmMapDao;
	
	/**
	 * 获得影院的统计数量
	 * @return
	 */
	@Override
	public JSONObject getMapTitle() {
		JSONObject json = new JSONObject();
		MapItem m = alarmMapDao.getMapTitle();
		json.put("cinemaCount", m.getCinemaCount());
		json.put("exceptionCount", m.getExceptionCount());
		json.put("installedCount", m.getInstalledCount());
		return json;
	}
	
	/**
	 * 获得全部省的地图数据
	 * @return
	 */
	@Override
	public List<MapItem> getProvinceData() {
		List<MapItem> dataList = alarmMapDao.getProvinceData(TimeUtil.getBeforeDay());
		for (MapItem m : dataList) {
			//4.5:没有数据，2.5：正常，3.5：异常
			if (m.getInstalledCount()==0) {
				m.setValue(4.5);
			}else {
				m.setValue(m.getException()==null? 2.5 : 3.5);
			}
		}
		return dataList;
	}
	
	/**
	 * 获得省内所有市的影院信息
	 * @param ProvinceId	:省id
	 * @return
	 */
	@Override
	public List<MapItem> getCityData(String provinceId) {
		List<MapItem> dataList = alarmMapDao.getCityData(provinceId, TimeUtil.getBeforeDay());
		for (MapItem m : dataList) {
			//4.5:没有数据，2.5：正常，3.5：异常
			if (m.getInstalledCount()==0 ) {
				m.setValue(4.5);
			}else {
				m.setValue(m.getException() == null? 2.5 : 3.5);
			}
		}
		return dataList;
	}

	/**
	 * 获得全部影院信息
	 * @return
	 */
	@Override
	public List<MapItem> getCinemaData(String provinceId) {
		List<MapItem> dataList = alarmMapDao.getCinemaData(provinceId);
		for (MapItem m : dataList) {
			m.setGeoCoord(new double[] {m.getLongitude(), m.getLatitude()});
			m.setIsException(m.getException()==null?  0: 1);
			// 0.5:正常,绿色；1.5:异常,红色
			m.setValue(m.getException()==null? 0.5 : 1.5);
		}
		return dataList;
	}

}
