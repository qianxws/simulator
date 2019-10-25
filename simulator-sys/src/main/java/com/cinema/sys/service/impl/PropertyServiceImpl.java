package com.cinema.sys.service.impl;

import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSONObject;
import com.cinema.sys.dao.PropertyMapper;
import com.cinema.sys.model.Property;
import com.cinema.sys.service.PropertyService;

@Service
public class PropertyServiceImpl implements PropertyService {
	
	@Autowired  
    private PropertyMapper propertyDao;  
  
    
	@Override
	public List<Property> getAllList(String type) {
		return propertyDao.getAllList(type);
	}
	
	
	@Override
	public JSONObject getDeviceProperties(String type) {
		JSONObject json = new JSONObject();
		json.put("MachineTypeOptions", propertyDao.getDeviceProperties("machine_type"));
		json.put("MachineBrandOptions",propertyDao.getDeviceProperties("machine_brand"));
		json.put("MachineModelOptions",propertyDao.getDeviceProperties("machine_model"));
		json.put("ResolutionOptions", propertyDao.getDeviceProperties("resolution"));
		json.put("DeviceTypeOptions", propertyDao.getDeviceProperties("device_type"));
		return json;
	}
	
	/**
	 * 分页获得设备属性
	 * 
	 * @param type
	 *            ：属性类型
	 * @param name
	 *            ：属性名称
	 * @param startTime
	 *            ：时间范围开始时间
	 * @param endTime
	 *            ：时间范围结束时间
	 * @param page
	 *            ：页码
	 * @param rows
	 *            ：每页显示数量
	 * @return
	 */
	@Override
	public JSONObject queryProperty(Map<String, Object> paraMap) {
		JSONObject json = new JSONObject();
		json.put("list",propertyDao.getList(paraMap));
		json.put("total", propertyDao.getTotal(paraMap));

		return json;
	}

	
	/**
	 * 保存设备属性
	 * 
	 * @param type
	 *            ：属性类型
	 * @param name
	 *            ：属性名称
	 * @throws Exception
	 */
	@Override
	public void insert(Property m) {
		propertyDao.insert(m);
	}

	/**
	 * 修改设备属性
	 * 
	 * @param id
	 *            ：属性id
	 * @param type
	 *            ：类型
	 * @param name
	 *            ：名称
	 * @throws Exception
	 */
	@Override
	public void update(Property m){
		propertyDao.update(m);
	}

	/**
	 * 删除属性
	 * 
	 * @param id
	 *            ：属性id
	 * @param type
	 *            属性
	 * @throws Exception
	 */
	@Override
	public void delete(String type, String id) {
//		Class<?> cla = Class.forName("com.cinema.model.generate.T" + type);
//		Object model = propertyDao.get(cla, id);
		propertyDao.delete(type, id);
	}
	
	@Override
	public boolean isNotExist(String type, String id, String name) {
		Boolean isNotExist=propertyDao.isNotExist(type,id, name);
		return isNotExist==null?true:isNotExist;
	}
	
	/**
	 * 验证设备属性是否重名(true:存在重名)
	 * 
	 * @param type
	 *            ：属性类型
	 * @param id
	 *            ：属性id
	 * @param name
	 *            ：属性名称
	 * @return
	 */
	@Override
	public Boolean checkProerty(Map<String, Object> paraMap) {
		String id=paraMap.get("id").toString();
		List<?> dataList = propertyDao.checkProerty(paraMap);
		if (dataList != null && dataList.size() > 0) {
			if (StringUtils.isEmpty(id)) {
				return true;
			}
			for (Object tId : dataList) {
				if (!String.valueOf(tId).equals(id)) {
					return true;
				}
			}
		}
		return false;
	}
}
