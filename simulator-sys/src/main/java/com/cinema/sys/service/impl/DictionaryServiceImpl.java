package com.cinema.sys.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSONObject;
import com.cinema.sys.action.util.ActionContext;
import com.cinema.sys.dao.DictionaryMapper;
import com.cinema.sys.model.Dictionary;
import com.cinema.sys.model.Option;
import com.cinema.sys.model.base.TDictionary;
import com.cinema.sys.service.DictionaryService;

/**
 * 字典管理业务层
 * 
 * @author ysw
 *
 */
@Service
public class DictionaryServiceImpl implements DictionaryService {
	@Autowired
	private DictionaryMapper dictionaryDao;

	/**得到子项*/
	@Override
	public List<Option>  getOptions(String id) {
		return dictionaryDao.getOptions(id);
	}
	
	@Override
	/**得到name-id字典*/
	public Map<String,String> getMap(String id) {
		Map<String, String> map = new HashMap<>();
		List<Option> list=getOptions(id);
		if(list !=null) {
			for(Option item:list)
				map.put(item.getName(), item.getId());
		}
		return map;
	}
	
	/**
	 * 查询所有字典数据
	 * 
	 * @author yxh
	 */
	@Override
	public List<Dictionary> dictionaryList(Map<String, Object> paraMap) {
//		JSONObject json = new JSONObject();
		List<Dictionary> list = dictionaryDao.getTopList(paraMap);
		for (Dictionary dics : list) {
			paraMap.put("parentId", dics.getId());
			dics.setChildDic(dictionaryDao.getList(paraMap));
		}
		return list;
//		json.put("list", l);
//		json.put("total", dictionaryDao.getTotal(paraMap));
//		return json;
	}

	/**
	 * 查询添加的同节点下的数据字典名称是否重复
	 * 
	 * @author yxh
	 */
	@Override
	public String validName(Map<String, Object> paraMap) {
		List<Dictionary> lists = dictionaryDao.find(paraMap);
		String ok = "true";
		for (int i = 0; i < lists.size(); i++) {
			if (paraMap.get("name").equals(lists.get(i).getName())) {
				ok = "false";
				break;
			}
		}
		return ok;
	}

	@Override
	public int addDictionary(TDictionary t) {
		return dictionaryDao.insertSelective(t);
	}

	@Override
	public int updateDictionary(TDictionary t) {
		return dictionaryDao.updateByPrimaryKeySelective(t);
	}

	@Override
	public int del(String id) {
		return dictionaryDao.deleteByPrimaryKey(id);
	}

	@Override
	public int deleteByPid(String id) {
		return dictionaryDao.deleteByPid(id);
	}
	
	@Override
	public List<Dictionary> getAllTopList() {
		return dictionaryDao.getAllTopList();
	}

	@Override
	public TDictionary getDetail(String id) {
		return dictionaryDao.getDetail(id);
	}
	
	@Override
	public JSONObject addDictionary(ActionContext cxt) {
		return null;
	}

	@Override
	public void updateDictionary(ActionContext cxt) {
	}


	

	

	
}
