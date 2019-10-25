package com.cinema.sys.action;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.alibaba.fastjson.JSONObject;
import com.cinema.sys.action.util.ActionContext;
import com.cinema.sys.action.util.Service;
import com.cinema.sys.service.AreaService;
import com.cinema.sys.utils.MyParam;

@Component
@Service(name = "areaAction")
public class AreaAction {
	@Autowired
	private AreaService areaService;

	/**省下拉菜单*/
	public JSONObject getProvinceOptions(ActionContext cxt) {
		JSONObject json = new JSONObject();
		json.put("list",areaService.getProvinceOptions(null));
		return json;
	}
	
	/**市下拉菜单*/
	public JSONObject getCityOptions(ActionContext cxt) {
		String provinceId=MyParam.getString(cxt, "provinceId");
		JSONObject json = new JSONObject();
		json.put("list",provinceId==null?null:areaService.getCityOptions(new HashMap<String,Object> (){{put("parentId", provinceId);}}));
		return json;
	}
}
