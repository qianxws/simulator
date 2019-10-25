package com.cinema.biz.action;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.cinema.biz.model.SimThreshold;
import com.cinema.biz.model.base.TSimThreshold;
import com.cinema.biz.service.SimThresholdService;
import com.cinema.sys.action.util.ActionContext;
import com.cinema.sys.action.util.Service;
import com.cinema.sys.service.LogService;
import com.cinema.sys.utils.ExceptionUtil;
import com.cinema.sys.utils.MyParam;
import com.cinema.sys.utils.MyUUID;
import com.cinema.sys.utils.TimeUtil;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;


/**监控阈值模块Action层*/
@Component
@Service(name = "simThresholdAction")
public class SimThresholdAction {

	@Autowired
	private SimThresholdService simThresholdService;
	@Autowired
	private LogService logService;

	/**列表*/
	public JSONObject getList(ActionContext cxt) {
		Map<String, Object> paraMap = new HashMap<> ();
		paraMap.put("startTime", TimeUtil.stringToDate(MyParam.getString(cxt, "startTime")+" 00:00:00"));
		paraMap.put("endTime", TimeUtil.stringToDate(MyParam.getString(cxt, "endTime")+" 23:59:59"));
		paraMap.put("name", MyParam.getString(cxt, "name"));
		paraMap.put("thresholdId", MyParam.getString(cxt, "thresholdId"));
		paraMap.put("typeId", MyParam.getString(cxt, "typeId"));

		//分页查询
		PageHelper.startPage(MyParam.getInt(cxt, "page", 1),MyParam.getInt(cxt, "rows", 15));
		Page<SimThreshold> p=(Page<SimThreshold>)simThresholdService.getList(paraMap);
		JSONObject json = new JSONObject();
		json.put("list",p.getResult());
		json.put("total", p.getTotal());
		return json;
	}

	/**详情*/
	public JSONObject getDetail(ActionContext cxt) {
		Map<String, Object> paraMap = new HashMap<> ();
		paraMap.put("thresholdId", MyParam.getString(cxt, "thresholdId"));

		JSONObject json = new JSONObject();
		json.put("model",simThresholdService.getDetail(paraMap));
		return json;
	}

	/**添加*/
	public JSONObject insert(ActionContext cxt) {
		JSONObject json = new JSONObject();
		try {
			TSimThreshold t = JSON.toJavaObject(MyParam.getDataItem(cxt, "dataItem"), TSimThreshold.class);
			t.setThresholdId(MyUUID.getUUID());
			simThresholdService.insert(t);

			json.put("success", true);
			json.put("message","添加监控阈值成功");
		} catch (Exception e) {
			e.printStackTrace();
			json.put("message", ExceptionUtil.getInsertMessage(e, "添加监控阈值失败"));
			json.put("success", false);
		}
		logService.addLog("添加监控阈值", cxt, json);
		return json;
	}

	/**更新*/
	public JSONObject update(ActionContext cxt) {
		JSONObject json = new JSONObject();
		try {
			TSimThreshold t = JSON.toJavaObject(MyParam.getDataItem(cxt, "dataItem"), TSimThreshold.class);
			simThresholdService.update(t);

			json.put("success", true);
			json.put("message","修改监控阈值成功");
		} catch (Exception e) {
			e.printStackTrace();
			json.put("message", ExceptionUtil.getUpdateMessage(e, "修改监控阈值失败"));
			json.put("success", false);
		}
		logService.addLog("修改监控阈值", cxt, json);
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
				simThresholdService.delete(ids.getString(i));
			
			json.put("success", true);
			json.put("message","删除监控阈值成功");
		} catch (Exception ex) {
			ex.printStackTrace();
			json.put("message", ExceptionUtil.getDeleteMessage(ex, "删除监控阈值失败"));
			json.put("success", false);
		}
		logService.addLog("删除监控阈值", cxt, json);
		return json;
	}
}
