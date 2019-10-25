package com.cinema.sys.action;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.cinema.sys.action.util.ActionContext;
import com.cinema.sys.action.util.Service;
import com.cinema.sys.model.Property;
import com.cinema.sys.service.LogService;
import com.cinema.sys.service.PropertyService;
import com.cinema.sys.utils.ExceptionUtil;
import com.cinema.sys.utils.MyParam;
import com.cinema.sys.utils.MyUUID;
import com.cinema.sys.utils.SafeSqlUtil;
import com.cinema.sys.utils.TimeUtil;


/**
 * 属性
 * 
 *
 */
@Component
@Service(name = "propertyAction")
public class PropertyAction {

	@Autowired
	private PropertyService propertyService;
	@Autowired
	private LogService logService;
	
	/**
	 * 获取属性
	 * @return
	 */
	public List<Property> getProperties(ActionContext cxt) {
		String type = SafeSqlUtil.getSafeString(MyParam.getString(cxt, "type"));
		return propertyService.getAllList(type);
	}
	
	/**
	 * 获取设备属性
	 * @return
	 */
	public JSONObject getDeviceProperties(ActionContext cxt) {
		String type = SafeSqlUtil.getSafeString(MyParam.getString(cxt, "type"));
		return propertyService.getDeviceProperties(type);
	}

	/**
	 * 分页获得属性
	 * @param cxt
	 * @return
	 */
	public JSONObject queryProperty(ActionContext cxt) {
		
		JSONObject json = new JSONObject();
		
		String startTime = MyParam.getString(cxt, "startTime");
		  startTime="".equals(startTime)?"":startTime+" 00:00:00";
		String endTime= MyParam.getString(cxt, "endTime");
		  endTime="".equals(endTime)?"":endTime+" 23:59:59";
		
		String type = SafeSqlUtil.getSafeString(MyParam.getString(cxt, "type"));

		Map<String, Object> paraMap = new HashMap<> ();
		paraMap.put("page", MyParam.getInt(cxt, "page", 1));
		paraMap.put("rows", MyParam.getInt(cxt, "rows", 10));
		if(StringUtils.isNotEmpty(startTime)) {
			paraMap.put("startTime", TimeUtil.stringToDate(startTime));
		}
		if(StringUtils.isNotEmpty(endTime)) {
			paraMap.put("endTime", TimeUtil.stringToDate(endTime));
		}
		paraMap.put("type", type);
		paraMap.put("name", SafeSqlUtil.getSafeString(MyParam.getString(cxt, "name").trim()));
		if (StringUtils.isEmpty(type)) {
			throw new NullPointerException("属性类型读取出错！");
		}
		json = propertyService.queryProperty(paraMap);
		json.put("success", true);
		return json;
	}
	
	/**
	 * 新增设备属性
	 * @throws Exception 
	 */
	public JSONObject saveDeviceProperty(ActionContext cxt) throws Exception {
		
		JSONObject json = new JSONObject();
		try {
			Property m =new Property();
			m.setType(SafeSqlUtil.getSafeString(MyParam.getString(cxt, "type")));
			m.setId(MyUUID.getUUID());
			m.setName(SafeSqlUtil.getSafeString(MyParam.getString(cxt, "name")));
			m.setCreator(String.valueOf(cxt.getHttpRequest().getAttribute("userId")));
			m.setCreateTime(new Date());
			propertyService.insert(m);
			
			json.put("success", true);
			json.put("message","添加属性成功");
		} catch (Exception e) {
			e.printStackTrace();
			json.put("success", false);
			json.put("message", ExceptionUtil.getInsertMessage(e, "添加属性失败"));
		}
		logService.addLog("添加属性", cxt, json);
		return json;
	}
	/**
	 * 修改属性
	 * @throws Exception 
	 */
	public JSONObject editDeviceProperty(ActionContext cxt){
		JSONObject json = new JSONObject();
		try {
			Property m =new Property();
			m.setType(SafeSqlUtil.getSafeString(MyParam.getString(cxt, "type")));
			m.setId(SafeSqlUtil.getSafeString(MyParam.getString(cxt, "id")));
			m.setName(SafeSqlUtil.getSafeString(MyParam.getString(cxt, "name")));
			m.setCreator(String.valueOf(cxt.getHttpRequest().getAttribute("userId")));
			m.setCreateTime(new Date());
			propertyService.update(m);
			
			json.put("success", true);
			json.put("message","修改属性成功");
		} catch (Exception e) {
			e.printStackTrace();
			json.put("success", false);
			json.put("message", ExceptionUtil.getUpdateMessage(e, "修改属性失败"));
		}
		logService.addLog("修改属性", cxt, json);
		return json;
	}
	
	/**
	 * 删除属性
	 * @return
	 * @throws Exception 
	 */
	public JSONObject deleteDeviceProperty(ActionContext cxt) throws Exception {

		String itemStr =MyParam.getString(cxt, "ids");
		JSONArray itemArray = JSONArray.parseArray(itemStr);
		
		for (Object item : itemArray) {
			JSONObject json = JSONObject.parseObject(item.toString());
			propertyService.delete( SafeSqlUtil.getSafeString(json.getString("type")),SafeSqlUtil.getSafeString(json.getString("id")));
		}

		logService.addLog("删除属性", "成功删除" + itemArray.size() + "条属性", String.valueOf(cxt.getHttpRequest().getAttribute("userId")), true);
		return new JSONObject();
	}
	
	// 校验属性是否存在
	public JSONObject isNotExist(ActionContext cxt) throws Exception {
		String type=SafeSqlUtil.getSafeString(MyParam.getString(cxt, "type"));
		String id=SafeSqlUtil.getSafeString(MyParam.getString(cxt, "id"));
		String name=SafeSqlUtil.getSafeString(MyParam.getString(cxt, "name"));
		
		JSONObject json = new JSONObject();
		json.put("success",propertyService.isNotExist(type,id,name));
		return json;
	}

}
