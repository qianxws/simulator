package com.cinema.sys.action;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.cinema.sys.action.util.ActionContext;
import com.cinema.sys.action.util.Service;
import com.cinema.sys.model.Company;
import com.cinema.sys.model.base.TCompany;
import com.cinema.sys.service.CompanyService;
import com.cinema.sys.service.DictionaryService;
import com.cinema.sys.service.LogService;
import com.cinema.sys.utils.ExceptionUtil;
import com.cinema.sys.utils.MyParam;
import com.cinema.sys.utils.MyUUID;
import com.cinema.sys.utils.TimeUtil;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;

import tk.mybatis.mapper.util.StringUtil;


/**公司模块Action层*/
@Component
@Service(name = "companyAction")
public class CompanyAction {

	@Autowired
	private CompanyService companyService;
	@Autowired
	private DictionaryService dictionaryService;
	@Autowired
	private LogService logService;

	/**列表*/
	public JSONObject getList(ActionContext cxt) {
		Map<String, Object> paraMap = new HashMap<> ();
		paraMap.put("startTime", TimeUtil.stringToDate(MyParam.getString(cxt, "startTime")+" 00:00:00"));
		paraMap.put("endTime", TimeUtil.stringToDate(MyParam.getString(cxt, "endTime")+" 23:59:59"));
		paraMap.put("name", MyParam.getString(cxt, "name"));
		String provinceId=MyParam.getString(cxt, "provinceId");
		String cityId=MyParam.getString(cxt, "cityId");
		paraMap.put("areaId", StringUtil.isEmpty(cityId)?provinceId:cityId);
		
		//分页查询
		PageHelper.startPage(MyParam.getInt(cxt, "page", 1),MyParam.getInt(cxt, "rows", 15));
		Page<Company> p=(Page<Company>)companyService.getList(paraMap);
		JSONObject json = new JSONObject();
		json.put("list",p.getResult());
		json.put("total", p.getTotal());
		return json;
	}
	
	/**添加*/
	public JSONObject insert(ActionContext cxt) {
		JSONObject json = new JSONObject();
		try {
			TCompany t = JSON.toJavaObject(MyParam.getDataItem(cxt, "dataItem"), TCompany.class);
			t.setId(MyUUID.getUUID());
			t.setCreateTime(new Date());
			t.setCreator(String.valueOf(cxt.getHttpRequest().getAttribute("userId")));
			companyService.insert(t);
			
			json.put("success", true);
			json.put("message","添加公司成功");
		} catch (Exception e) {
			e.printStackTrace();
			json.put("message", ExceptionUtil.getInsertMessage(e, "添加公司失败"));
			json.put("success", false);
		}
		logService.addLog("添加公司", cxt, json);
		return json;
	}

	/**更新*/
	public JSONObject update(ActionContext cxt) {
		JSONObject json = new JSONObject();
		try {
			TCompany t = JSON.toJavaObject(MyParam.getDataItem(cxt, "dataItem"), TCompany.class);
//			t.setCreateTime(new Date());
			t.setCreator(String.valueOf(cxt.getHttpRequest().getAttribute("userId")));
			companyService.update(t);
			
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

	/**删除*/
	public JSONObject delete(ActionContext cxt) {
		JSONObject json = new JSONObject();
		try {
			JSONArray ids = JSON.parseArray(MyParam.getString(cxt, "ids"));
			if (ids.size() == 0)
				throw new Exception("ids不能为空");
			for (int i = 0; i < ids.size(); i++) 
				companyService.delete(ids.getString(i));
			
			json.put("success", true);
			json.put("message","删除公司成功");
		} catch (Exception ex) {
			ex.printStackTrace();
			json.put("message", ExceptionUtil.getDeleteMessage(ex, "删除公司失败"));
			json.put("success", false);
		}
		logService.addLog("删除公司", cxt, json);
		return json;
	}
	
	/**列表下拉选项*/
	public JSONObject getListOptions(ActionContext cxt) {
		JSONObject json = new JSONObject();
		json.put("typeOptions", dictionaryService.getOptions("companyType"));
		return json;
	}
	
	/**edit页面下拉选项*/
	public JSONObject getEditOptions(ActionContext cxt) {
		JSONObject json = new JSONObject();
		json.put("typeOptions", dictionaryService.getOptions("companyType"));
		json.put("versionOptions",dictionaryService.getOptions("companyVersion"));
		json.put("productionOptions",dictionaryService.getOptions("companyProduction"));
		json.put("publisherOptions", dictionaryService.getOptions("companyPublisher"));
		json.put("kindsOptions", dictionaryService.getOptions("companyKinds"));
		return json;
	}
}
