package com.cinema.sys.action;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.cinema.sys.action.util.ActionContext;
import com.cinema.sys.action.util.Service;
import com.cinema.sys.model.Dictionary;
import com.cinema.sys.model.base.TDictionary;
import com.cinema.sys.service.DictionaryService;
import com.cinema.sys.service.LogService;
import com.cinema.sys.utils.ExceptionUtil;
import com.cinema.sys.utils.MyParam;
import com.cinema.sys.utils.MyUUID;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;

/**
 * 字典管理控制层Action
 */
@Component
@Service(name = "dictionaryAction")
public class DictionaryAction {

	@Autowired
	private DictionaryService dictionaryService;
	@Autowired
	private LogService logService;
	

	/**
	 * 获取所有字典数据
	 * 
	 * @param cxt
	 * @return
	 */
	public JSONObject getDictionarys(ActionContext cxt) throws Exception {
//		JSONObject model = new JSONObject();
		Map<String, Object> paraMap = new HashMap<> ();
//		paraMap.put("page", MyParam.getInt(cxt, "page", 1));
//		paraMap.put("rows", MyParam.getInt(cxt, "rows", 15));
		paraMap.put("name", MyParam.getString(cxt, "name"));
//		model = dictionaryService.dictionaryList(paraMap);
//		model.put("success", true);
//		return model;
		
		//分页查询
		PageHelper.startPage(MyParam.getInt(cxt, "page", 1),MyParam.getInt(cxt, "rows", 15));
		Page<Dictionary> p=(Page<Dictionary>)dictionaryService.dictionaryList(paraMap);
		JSONObject json = new JSONObject();
		json.put("list",p.getResult());
		json.put("total", p.getTotal());
		return json;
	}
	
	/**
	 * 获得所有一级菜单
	 * @param cxt
	 * @return
	 */
	public List<Dictionary> getPauth(ActionContext cxt) {
		return dictionaryService.getAllTopList();
	}
	
	/**
	 * 添加字典数据
	 * 
	 * @param cxt
	 * @return
	 */
	public JSONObject add(ActionContext cxt) {
		JSONObject model = new JSONObject();
		Map<String, Object> paraMap = new HashMap<> ();
		try {
			JSONObject json = MyParam.getDataItem(cxt, "dataItem");
			TDictionary dictionary = JSON.toJavaObject(json, TDictionary.class);			
			dictionary.setId(MyUUID.getUUID());
			dictionary.setCreateTime(new Date());
			dictionary.setUpdateTime(new Date());
			dictionary.setCreator(String.valueOf(cxt.getHttpRequest().getAttribute("userId")));	
			dictionary.setUpdator(String.valueOf(cxt.getHttpRequest().getAttribute("userId")));	
			paraMap.put("parentId",dictionary.getParentId());
			paraMap.put("name",dictionary.getName());			
			//验证同级节点下名称是否重复
		    String ok = dictionaryService.validName(paraMap);			
			if (ok.equals("true")) {
			    dictionaryService.addDictionary(dictionary);
				model.put("success", true);
				model.put("message", "添加成功");
			} else {
				model.put("success", false);
				model.put("message", "同级节点中已存在此名称");
			}
		} catch (Exception e) {
			model.put("success", false);
			model.put("message", e.getMessage());
		}
		// 添加日志信息
		logService.addLog("添加字典数据", cxt, model);
		return model;
	}

	/**
	 * 修改字典数据
	 * @param cxt
	 * @return
	 */
	public JSONObject update(ActionContext cxt) {
		JSONObject model = new JSONObject();
		try {		
			TDictionary t = JSON.toJavaObject(MyParam.getDataItem(cxt, "dataItem"), TDictionary.class);
			t.setUpdateTime(new Date());
			t.setUpdator(String.valueOf(cxt.getHttpRequest().getAttribute("userId")));
			//验证是否为根节点如果是则不能修改
			TDictionary byId = dictionaryService.getDetail(t.getId());			
				if(byId.getParentId().equals("0")) {
				  if(byId.getParentId().equals(t.getParentId())) {
					  dictionaryService.updateDictionary(t);			
						model.put("success", true);
						model.put("message", "修改字典成功");  					  
				  }else {
						model.put("success", false);
						model.put("message", "根节点不能修改节点");
				  }  
					 																						
				}else {
					dictionaryService.updateDictionary(t);			
					model.put("success", true);
					model.put("message", "修改字典成功");				
				}		
			
		} catch (Exception e) {
			model.put("success", false);
			model.put("message", e.getMessage());
		}
		// 添加日志信息
		logService.addLog("修改字典数据", cxt, model);
		return model;		
	}

	/**
	 * 删除字典数据
	 * 
	 * @param cxt
	 * @return
	 */
	public JSONObject delete(ActionContext cxt) {
		JSONObject model = new JSONObject();
		try {
			JSONArray ids = JSON.parseArray(MyParam.getString(cxt, "ids"));
			if (ids.size() == 0)
				throw new Exception("ids不能为空");
			for (int i = 0; i < ids.size(); i++) {
				dictionaryService.del(ids.getString(i));
			}
			//根据id和pid删除 子节点
			for (int i = 0; i < ids.size(); i++) {
				dictionaryService.deleteByPid(ids.getString(i));
			}		
			model.put("success", true);
			model.put("message","删除字典成功");
		} catch (Exception ex) {
			ex.printStackTrace();
			model.put("success", false);
			model.put("message", ExceptionUtil.getDeleteMessage(ex, "删除字典失败"));
		}		
		// 添加日志信息
		logService.addLog("删除字典数据", cxt, model);
		return model;
	}	
	
}
