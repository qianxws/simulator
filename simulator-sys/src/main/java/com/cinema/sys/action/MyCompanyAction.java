package com.cinema.sys.action;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.cinema.sys.action.util.ActionContext;
import com.cinema.sys.action.util.Service;
import com.cinema.sys.model.Area;
import com.cinema.sys.model.Company;
import com.cinema.sys.service.CompanyService;
import com.cinema.sys.service.LogService;
import com.cinema.sys.utils.ExceptionUtil;
import com.cinema.sys.utils.MapUtil;
import com.cinema.sys.utils.MyParam;
import com.cinema.sys.utils.MyUUID;


/**我的公司模块Action层*/
@Component
@Service(name = "myCompanyAction")
public class MyCompanyAction {

	@Autowired
	private CompanyService companyService;
	@Autowired
	private LogService logService;

	/**列表*/
	public JSONObject getDetail(ActionContext cxt) {
		String userId=String.valueOf(cxt.getHttpRequest().getAttribute("userId"));
		Company company=companyService.getDetail(MapUtil.getMap("contact",userId));
		Area area=company.getArea();
		if(area !=null) {
			company.setProvinceId(area.getParentId());
			company.setCityId(area.getId());
		}
		JSONObject json = new JSONObject();
		json.put("model",company);
		return json;
	}
	
	/**更新*/
	public JSONObject update(ActionContext cxt) {
		JSONObject json = new JSONObject();
		try {
			Company t = JSON.toJavaObject(MyParam.getDataItem(cxt, "dataItem"), Company.class);
			t.setAreaId(t.getCityId());
			if(t.getId()==null){
				t.setId(MyUUID.getUUID());
				t.setNid(companyService.getMaxNid());
				t.setAreaId(t.getCityId());
				t.setCreateTime(new Date());
				t.setContact(String.valueOf(cxt.getHttpRequest().getAttribute("userId")));
				t.setCreator(String.valueOf(cxt.getHttpRequest().getAttribute("userId")));
				companyService.insert(t);
			}
			else{
				companyService.update(t);
			}
			
			json.put("success", true);
			json.put("message","修改公司成功");
		} catch (Exception e) {
			e.printStackTrace();
			json.put("message", ExceptionUtil.getUpdateMessage(e, "修改公司失败"));
			json.put("success", false);
		}
		logService.addLog("修改公司", cxt, json);
		return json;
	}
}
