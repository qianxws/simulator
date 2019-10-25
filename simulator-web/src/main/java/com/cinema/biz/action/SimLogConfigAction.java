package com.cinema.biz.action;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.cinema.biz.model.SimLogConfig;
import com.cinema.biz.model.base.TSimLogConfig;
import com.cinema.biz.service.SimLogConfigService;
import com.cinema.sys.action.util.ActionContext;
import com.cinema.sys.action.util.Service;
import com.cinema.sys.service.LogService;
import com.cinema.sys.utils.ExceptionUtil;
import com.cinema.sys.utils.MyParam;
import com.cinema.sys.utils.MyUUID;
import com.cinema.sys.utils.TimeUtil;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;


/**日志记录配置模块Action层*/
@Component
@Service(name = "simLogConfigAction")
public class SimLogConfigAction {

	@Autowired
	private SimLogConfigService simLogConfigService;
	@Autowired
	private LogService logService;

	/**列表*/
	public JSONObject getList(ActionContext cxt) {
		Map<String, Object> paraMap = new HashMap<> ();
		paraMap.put("startTime", TimeUtil.stringToDate(MyParam.getString(cxt, "startTime")+" 00:00:00"));
		paraMap.put("endTime", TimeUtil.stringToDate(MyParam.getString(cxt, "endTime")+" 23:59:59"));
		paraMap.put("name", MyParam.getString(cxt, "name"));
		paraMap.put("typeFieldId", MyParam.getString(cxt, "typeFieldId"));
		paraMap.put("typeId", MyParam.getString(cxt, "typeId"));

		//分页查询
		PageHelper.startPage(MyParam.getInt(cxt, "page", 1),MyParam.getInt(cxt, "rows", 15));
		Page<SimLogConfig> p=(Page<SimLogConfig>)simLogConfigService.getList(paraMap);
		JSONObject json = new JSONObject();
		json.put("list",p.getResult());
		json.put("total", p.getTotal());
		return json;
	}

	/**详情*/
	public JSONObject getDetail(ActionContext cxt) {
		Map<String, Object> paraMap = new HashMap<> ();
		paraMap.put("typeFieldId", MyParam.getString(cxt, "typeFieldId"));

		JSONObject json = new JSONObject();
		json.put("model",simLogConfigService.getDetail(paraMap));
		return json;
	}

	/**添加*/
	public JSONObject insert(ActionContext cxt) {
		JSONObject json = new JSONObject();
		try {
			TSimLogConfig t = JSON.toJavaObject(MyParam.getDataItem(cxt, "dataItem"), TSimLogConfig.class);
			t.setTypeFieldId(MyUUID.getUUID());
			simLogConfigService.insert(t);

			json.put("success", true);
			json.put("message","添加日志记录配置成功");
		} catch (Exception e) {
			e.printStackTrace();
			json.put("message", ExceptionUtil.getInsertMessage(e, "添加日志记录配置失败"));
			json.put("success", false);
		}
		logService.addLog("添加日志记录配置", cxt, json);
		return json;
	}

	/**更新*/
	public JSONObject update(ActionContext cxt) {
		JSONObject json = new JSONObject();
		try {
			TSimLogConfig t = JSON.toJavaObject(MyParam.getDataItem(cxt, "dataItem"), TSimLogConfig.class);
			simLogConfigService.update(t);

			json.put("success", true);
			json.put("message","修改日志记录配置成功");
		} catch (Exception e) {
			e.printStackTrace();
			json.put("message", ExceptionUtil.getUpdateMessage(e, "修改日志记录配置失败"));
			json.put("success", false);
		}
		logService.addLog("修改日志记录配置", cxt, json);
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
				simLogConfigService.delete(ids.getString(i));
			
			json.put("success", true);
			json.put("message","删除日志记录配置成功");
		} catch (Exception ex) {
			ex.printStackTrace();
			json.put("message", ExceptionUtil.getDeleteMessage(ex, "删除日志记录配置失败"));
			json.put("success", false);
		}
		logService.addLog("删除日志记录配置", cxt, json);
		return json;
	}
}
