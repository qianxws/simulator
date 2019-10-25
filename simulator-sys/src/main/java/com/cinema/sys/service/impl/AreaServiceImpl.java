package com.cinema.sys.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cinema.sys.dao.AreaMapper;
import com.cinema.sys.model.Area;
import com.cinema.sys.service.AreaService;

@Service
public class AreaServiceImpl implements AreaService {
	
	@Autowired  
    private AreaMapper areaDao;

	@Override
	public Area getDetail(String id) {
		Area area=areaDao.getDetail(id);
		if(area!=null) 
			area.setParentArea(areaDao.getDetail(area.getParentId()));
		return area;
	}

	@Override
	public List<Area> getList(Map<String,Object> paraMap) {
		List<Area> list=areaDao.getList(paraMap);
		for(Area area:list)
			area.setParentArea(areaDao.getDetail(area.getParentId()));
		return list;
	}

	@Override
	public List<Area> getAllProvinces() {
		return areaDao.getAllProvinces();
	}  
	
	@Override
	public List<Area> getProvinceOptions(String provinceIds) {
		return areaDao.getProvinceOptions(provinceIds);
	}

	@Override
	public List<Area> getCityOptions(Map<String, Object> paraMap) {
		return areaDao.getCityOptions(paraMap);
	}

	@Override
	public String getProvinceName(String provinceId) {
		return areaDao.getProvinceName(provinceId);
	}
	
	@Override
	public String getProvinceId(String provinceName) {
		return areaDao.getProvinceId(provinceName);
	}
	
	@Override
	public String getCityId(String cityName) {
		//重复问题：大兴区和大兴安岭；北京的朝阳区和辽宁的朝阳市
		if(cityName.equals("大兴")||cityName.equals("朝阳")) 
			cityName+="区";
		List<String> list=areaDao.getCityId(cityName);
		return list.size()>0?list.get(0):null;
	}

	@Override
	public String getAreaIdByNid(Integer nid) {
		return areaDao.getAreaIdByNid(nid);
	}


}
