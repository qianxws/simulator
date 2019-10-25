package com.cinema.sys.service;

import java.util.List;
import java.util.Map;

import com.alibaba.fastjson.JSONObject;
import com.cinema.sys.action.util.ActionContext;
import com.cinema.sys.model.Dictionary;
import com.cinema.sys.model.Option;
import com.cinema.sys.model.base.TDictionary;


public interface DictionaryService {
	
	/**得到子项*/
	List<Option>  getOptions(String id);
	
	/**得到name-id字典*/
	Map<String,String> getMap(String id);
	
	/**
	 * 获得所有一级节点
	 * @return
	 */
	public List<Dictionary> getAllTopList();

	JSONObject addDictionary(ActionContext cxt);

	List<Dictionary> dictionaryList(Map<String, Object> paraMap);

	void updateDictionary(ActionContext cxt);

	int del(String id);
	
	/**
	 * 验证同级节点字典名称是否存在
	 * 
	 * @param cxt
	 * @return
	 */
	public String validName(Map<String, Object> paraMap);

	public TDictionary getDetail(String id);

	int addDictionary(TDictionary t);

	int deleteByPid(String pid);

	int updateDictionary(TDictionary t);

	

	
}
