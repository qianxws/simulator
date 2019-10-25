package com.cinema.sys.action;

import java.text.ParseException;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.alibaba.fastjson.JSONObject;
import com.cinema.sys.action.util.ActionContext;
import com.cinema.sys.action.util.Service;
import com.cinema.sys.model.Log;
import com.cinema.sys.service.LogService;
import com.cinema.sys.utils.MyParam;
import com.cinema.sys.utils.TimeUtil;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;

@Component
@Service(name = "logAction")
public class LogAction {
	@Autowired
	private LogService logService;

	/**
	 * 获取日志列表
	 * 
	 * @param cxt
	 * @return
	 */
	public JSONObject getAllLogs(ActionContext cxt) throws ParseException {
//		JSONObject json = new JSONObject();
		
		String startTime = MyParam.getString(cxt, "startTime");
		  startTime="".equals(startTime)?"":startTime+" 00:00:00";
		String endTime= MyParam.getString(cxt, "endTime");
		  endTime="".equals(endTime)?"":endTime+" 23:59:59";

		Map<String, Object> paraMap = new HashMap<> ();
//		paraMap.put("page", MyParam.getInt(cxt, "page", 1));
//		paraMap.put("rows", MyParam.getInt(cxt, "rows", 15));
		paraMap.put("startTime", TimeUtil.stringToDate(startTime));
		paraMap.put("endTime", TimeUtil.stringToDate(endTime));
		paraMap.put("alias", MyParam.getString(cxt, "alias").trim());
		paraMap.put("userName", MyParam.getString(cxt, "userName").trim());
		
//		json = logService.getList(paraMap);
//		json.put("success", true);
//		return json;
		
		//分页查询
		PageHelper.startPage(MyParam.getInt(cxt, "page", 1),MyParam.getInt(cxt, "rows", 15));
		Page<Log> p=(Page<Log>)logService.getList(paraMap);
		JSONObject json = new JSONObject();
		json.put("rows",p.getResult());
		json.put("total", p.getTotal());
		return json;
	}
}
