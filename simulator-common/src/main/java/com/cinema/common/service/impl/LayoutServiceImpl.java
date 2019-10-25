package com.cinema.common.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.cinema.common.dao.LayoutMapper;
import com.cinema.common.model.Layout;
import com.cinema.common.model.base.TLayout;
import com.cinema.common.service.LayoutService;
import com.cinema.sys.utils.MyUUID;

/**
 * 可拖拽模块布局布局
 * @author hanxu
 */
@Service
public class LayoutServiceImpl implements LayoutService{
	
	@Autowired
	private LayoutMapper layoutDao;
	
	
	/**
	 * 删除用户默认布局
	 * @param userId	：用户id
	 * @param page		：页面
	 */
	@Override
	public void deleteByUserId(String userId, String page) {
		layoutDao.deleteByUserId(userId, page);
	}
	
	/**
	 * 保存首页布局
	 * @param jsonArray :布局
	 * @param userId	：用户id
	 */
	@Override
	public void saveHomeLayout(JSONArray jsonArray, String userId) {
		if (jsonArray == null) {
			return;
		}
		//保存新的布局
		for (int i = 0; i < jsonArray.size(); i++) {
			JSONObject widget = jsonArray.getJSONObject(i);
			
			TLayout layout = JSONObject.toJavaObject(widget, TLayout.class);
			layout.setLayoutId(MyUUID.getUUID());
			layout.setUserId(userId);
			layout.setPage("home");
			layout.setCseq((short)i);
			layoutDao.insertSelective(layout);
		}
	}
	
	/**
	 * 保存票房信息页面布局
	 * @param jsonArray
	 * @param userId
	 */
	@Override
	public void saveTicketInfoLayout(JSONArray jsonArray, String userId) {
		if (jsonArray == null) {
			return;
		}
		
		//循环每一行
		for (int i = 0; i < jsonArray.size(); i++) {
			JSONObject rowJson = jsonArray.getJSONObject(i);
			//循环本行左侧列表
			JSONArray leftJson = rowJson.getJSONArray("left");
			if (leftJson != null && leftJson.size() > 0) {
				for (int l = 0; l < leftJson.size(); l++) {
					JSONObject widget = leftJson.getJSONObject(l);
					TLayout layout = JSONObject.toJavaObject(widget, TLayout.class);
					layout.setLayoutId(MyUUID.getUUID());
					layout.setUserId(userId);
					layout.setPage("ticketInfo");
					layout.setCseq((short)l);
					layout.setRowNum((short)i);
					layoutDao.insertSelective(layout);
				}
			}
			//循环本行右侧列表
			JSONArray rightJson = rowJson.getJSONArray("right");
			if (rightJson != null && rightJson.size() > 0) {
				for (int r = 0; r < rightJson.size(); r++) {
					JSONObject widget = rightJson.getJSONObject(r);
					TLayout layout = JSONObject.toJavaObject(widget, TLayout.class);
					layout.setLayoutId(MyUUID.getUUID());
					layout.setUserId(userId);
					layout.setPage("ticketInfo");
					layout.setCseq((short)r);
					layout.setRowNum((short)i);
					layoutDao.insertSelective(layout);
				}
			}
		}
	}


	
	/**
	 * 获得首页页面布局
	 * @param userId
	 * @return
	 */
	@Override
	public List<Layout> getHomeLayout(String userId) {
		return layoutDao.getList(userId,"home");
	}
	
	/**
	 * 获得票房信息页面布局
	 * @param userId
	 * @return
	 */
	@Override
	public List<Map<String, List<Layout>>>  getTicketInfoLayout(String userId) {
		//读到数据库存储的布局列表
		List<Layout> layoutList = layoutDao.getList(userId,"ticketInfo" );
		
		//Map<行号， Map<left/right, 模块列表>>
		Map<Integer, Map<String, List<Layout>>> rowMap = new HashMap<> ();
		
		//将列表转换为前端能读取的格式
		for (Layout layout : layoutList) {
			Integer row = (int)layout.getRowNum();
			if (rowMap.containsKey(row)) {
				Map<String, List<Layout>> lrMap = rowMap.get(row);
				String lr = layout.getPosition();
				if (lrMap.containsKey(lr)) {
					List<Layout> layList = lrMap.get(lr);
					layList.add(layout);
				}else {
					List<Layout> layList = new ArrayList<> ();
					layList.add(layout);
					lrMap.put(layout.getPosition(), layList);
				}
			}else {
				Map<String, List<Layout>> lrMap = new HashMap<> ();
				List<Layout> layList = new ArrayList<> ();
				layList.add(layout);
				lrMap.put(layout.getPosition(), layList);
				rowMap.put(row, lrMap);
			}
		}
		
		//返回的格式
		List<Map<String, List<Layout>>> resultList = new ArrayList<> ();
		
		for (int j = 0; j < rowMap.size(); j++) {
			resultList.add(rowMap.get(j));
		}
		
		return resultList;
	}
	

}
