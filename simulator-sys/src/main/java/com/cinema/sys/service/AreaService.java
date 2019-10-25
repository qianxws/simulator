package com.cinema.sys.service;

import java.util.List;
import java.util.Map;

import com.cinema.sys.model.Area;

public interface AreaService {
	
	/**详情*/
	Area getDetail(String id);
    
	/**列表*/
    List<Area> getList(Map<String,Object> paraMap);
    
	/**得到所有省*/
    List<Area> getAllProvinces();
    
    /**省下拉菜单*/
    List<Area>  getProvinceOptions(String provinceIds);
    
    /**市下拉菜单*/
    List<Area>  getCityOptions(Map<String,Object> paraMap);
    
    /**根据provinceId得到provinceName*/
    String  getProvinceName(String provinceId);
    
    /**根据provinceName得到provinceId*/
    String  getProvinceId(String provinceName);
    
    /**根据cityName得到cityId
     * 在service中处理了大兴和朝阳重复问题*/
    String  getCityId(String cityName);
    
    String  getAreaIdByNid(Integer nid);
}
