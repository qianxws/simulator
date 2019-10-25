package com.cinema.common.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cinema.common.dao.MapMapper;
import com.cinema.common.model.MapItem;
import com.cinema.common.service.MapService;

@Service
public class MapServiceImpl implements MapService {
	
	@Autowired  
    private MapMapper mapDao;

	@Override
	public MapItem getMapTitle(Map<String, Object> paraMap) {
		return mapDao.getMapTitle(paraMap);
	}

	@Override
	public int getMapTitleFilms(Map<String, Object> paraMap) {
		return mapDao.getMapTitleFilms(paraMap);
	}

	@Override
	public int getMapTitleExceptions(Map<String, Object> paraMap) {
		Integer result=mapDao.getMapTitleExceptions(paraMap);
		return result==null?0:result;
	}

	// 获得地图的省份数据
	@Override
	public List<MapItem> getProvinceData(Map<String, Object> paraMap) {
		List<MapItem> dataList = mapDao.getProvinceData(paraMap);
		for (MapItem m : dataList) {
			//4.5:没有数据，2.5：正常，3.5：异常
			if (m.getInstalledCount()==0) {
				m.setValue(4.5);
			}else {
				m.setValue(m.getIsException()==0 ? 2.5 : 3.5);
			}
			//判断下面省市等级
			m.setLevel(1);
		}
		return dataList;
	}

	//获得地图的城市数据
	@Override
	public List<MapItem> getCityData(Map<String, Object> paraMap) {
		List<MapItem> dataList = mapDao.getCityData(paraMap);
		for (MapItem m : dataList) {
			//4.5:没有数据，2.5：正常，3.5：异常
			if (m.getInstalledCount()==0 ) {
				m.setValue(4.5);
			}else {
				m.setValue(m.getIsException()==0 ? 2.5 : 3.5);
			}
			//判断下面省市等级
			m.setLevel(2);
		}
		return dataList;
	}

	// 获得地图的影院数据
	@Override
	public List<MapItem> getCinemaData(Map<String, Object> paraMap) {
		List<MapItem> dataList = mapDao.getCinemaData(paraMap);
		for (MapItem m : dataList) {
			m.setGeoCoord(new double[] {m.getLongitude(), m.getLatitude()});
			// 0.5:正常,绿色；1.5:异常,红色
			m.setValue(m.getIsException()==1? 1.5 : 0.5);
		}
		return dataList;
	}

}
