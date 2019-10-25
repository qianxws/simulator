package com.cinema.common.action;

import java.io.File;
import java.io.FileWriter;
import java.text.ParseException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.dom4j.Document;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;
import org.dom4j.io.OutputFormat;
import org.dom4j.io.SAXReader;
import org.dom4j.io.XMLWriter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.cinema.common.model.DbConfig;
import com.cinema.common.model.base.TDbConfig;
import com.cinema.common.service.DbConfigService;
import com.cinema.sys.action.util.ActionContext;
import com.cinema.sys.action.util.Service;
import com.cinema.sys.service.LogService;
import com.cinema.sys.utils.ExceptionUtil;
import com.cinema.sys.utils.MyParam;
import com.cinema.sys.utils.MyUUID;

@Component
@Service(name = "DbConfigAction")
public class DbConfigAction {
	@Autowired
	private DbConfigService DbConfigService;
	@Autowired
	private LogService logService;
	
	/**
	 * 得到数据库配置列表
	 * 
	 * @param cxt
	 * @return
	 */
	public JSONObject getDbConfigsPage(ActionContext cxt) throws ParseException {
		JSONObject json = new JSONObject();
		Map<String, Object> paraMap = new HashMap<> ();
		paraMap.put("page", MyParam.getInt(cxt, "page", 1));
		paraMap.put("rows", MyParam.getInt(cxt, "rows", 15));
		paraMap.put("data_source_id", MyParam.getString(cxt, "data_source_id").trim());
		
		json = DbConfigService.getList(paraMap);
		json.put("success", true);
		return json;
	}
	
	/**
	 * 修改数据库配置
	 * 
	 * @param cxt
	 * @return
	 */
	public JSONObject updateDbConfig(ActionContext cxt) {
		JSONObject json = new JSONObject();
		try {
			TDbConfig t = JSON.toJavaObject(MyParam.getDataItem(cxt, "dataItem"), TDbConfig.class);
			DbConfigService.update(t);
			
			json.put("success", true);
			json.put("message","修改数据库配置成功");
		} catch (Exception e) {
			e.printStackTrace();
			json.put("success", false);
			json.put("message", ExceptionUtil.getUpdateMessage(e, "修改数据库配置失败"));
		}
		logService.addLog("修改数据库配置", cxt, json);
		return json;
	}
	
	/**
	 * 添加数据库配置
	 * 
	 * @param cxt
	 * @return
	 */
	public JSONObject addDbConfig(ActionContext cxt) {
		JSONObject json = new JSONObject();
		try {
			TDbConfig t = JSON.toJavaObject(MyParam.getDataItem(cxt, "dataItem"), TDbConfig.class);
			t.setDbconfigId(MyUUID.getUUID());
			DbConfigService.insert(t);
			
			json.put("success", true);
			json.put("message","添加数据库配置成功");
		} catch (Exception e) {
			e.printStackTrace();
			json.put("success", false);
			json.put("message", ExceptionUtil.getInsertMessage(e, "添加数据库配置失败"));
		}
		logService.addLog("添加数据库配置", cxt, json);
		return json;
	}


	/**
	 * 是否存在从数据库
	 * 
	 * @param cxt
	 * @return
	 */
	public JSONObject isNotExist(ActionContext cxt) {
		JSONObject json = new JSONObject();
		json.put("result", DbConfigService.isNotExist());
		return json;
	}
	
	/**
	 * 删除数据库配置
	 * 
	 * @param cxt
	 * @return
	 */
	public JSONObject delDbConfig(ActionContext cxt) {
		JSONObject json = new JSONObject();
		try {
			JSONArray ids = JSON.parseArray(MyParam.getString(cxt, "ids"));
			if (ids.size() == 0)
				throw new Exception("ids不能为空");
			
			for (int i = 0; i < ids.size(); i++) 
			DbConfigService.delete(ids.getString(i));
			
			json.put("success", true);
			json.put("message","删除数据库配置成功");
		} catch (Exception e) {
			e.printStackTrace();
			json.put("success", false);
			json.put("message", ExceptionUtil.getDeleteMessage(e, "删除数据库配置失败"));
		}
		logService.addLog("删除数据库配置", cxt, json);
		return json;
	}
	
	
	
	// 
	public JSONObject autoGeneration(ActionContext cxt) throws Exception {
		JSONObject json=new JSONObject();
		
		try {
			List<DbConfig> all = DbConfigService.getAll();
			
			//获取文件路径
			System.out.println(cxt.getHttpRequest().getRealPath(""));
			String path=cxt.getHttpRequest().getRealPath("").replaceAll("\\\\", "/");
	    	String allfile=path+"WEB-INF/classes/spring-mybatis.xml";
//	    	String allfile="D:/cinemaplat/src/main/resources/spring-mybatis.xml";
//	    	String allfile="C:/Users/user/Desktop/spring-mybatis.xml";
			//读取XML文件，获得document对象
	        SAXReader sax = new SAXReader();
	        Document document = sax.read(new File(allfile));
	        //获取根节点
	        Element root=document.getRootElement();
	       
	        //进行循环添加子节点
	       
	        for (DbConfig dBconfig : all) {
				
	        	//先判断该节点bean id 是否存在 ----存在就删除，不存在就直接添加
	        	
	        	List<Element> element = root.elements();
		        for (Element ele : element) {
		        	if (dBconfig.getDataSourceId().equals(ele.attributeValue("id"))) {
		        		root.remove(ele);
		        	}
		        }
		        
		        List<Element> elements = root.elements();
		        
		        for (int s = 0; s < elements.size(); s++) {
		        	
		        	Element elem = elements.get(s);
		        	
		        	if("dataSource".equals(elem.attributeValue("id"))) {
		        		
		        		List<Element> elements2 = elem.elements();
		        		
		        		for (int j = 0; j < elements2.size(); j++) {
		        			
		        			Element elemj = elements2.get(j);
		        			
		        			if("targetDataSources".equals(elemj.attributeValue("name"))) {
		        				
		        				List<Element> elements3 = elemj.elements();
		        				
		        				for (int k = 0; k < elements3.size(); k++) {
		        					
		        					Element elemk = elements3.get(k);
		        					
		        					if("java.lang.String".equals(elemk.attributeValue("key-type"))) {
		        						
		        						List<Element> elements4 = elemk.elements();
		        						
		        						Element ele = DocumentHelper.createElement("entry");
						        		
						        		ele.addAttribute("key", dBconfig.getDataSourceId());
						        	
						        		ele.addAttribute("value-ref", dBconfig.getDataSourceId());
						        		
						        		elements4.add(ele);
						        		
						        		break;
		        					}
		        					
								}
		        				
		        			}
		        			
						}
		        		
		        	}
		        	
				}
	        	
	        	//添加字节点
	            Element newNode=root.addElement("bean");
	            //设置bean节点的属性和值
	            newNode.addAttribute("id", dBconfig.getDataSourceId());
	            newNode.addAttribute("class", "org.apache.commons.dbcp.BasicDataSource");
	            newNode.addAttribute("destroy-method", "close");
	            
	            //创建property 1
	            Element propertyNode1=newNode.addElement("property");
	            propertyNode1.addAttribute("name", "driverClassName");
	            propertyNode1.addAttribute("value", dBconfig.getDriver());
	            //创建property 2
	            Element propertyNode2=newNode.addElement("property");
	            propertyNode2.addAttribute("name", "url");
	            propertyNode2.addAttribute("value", dBconfig.getUrl());
	            //创建property 3
	            Element propertyNode3=newNode.addElement("property");
	            propertyNode3.addAttribute("name", "username");
	            propertyNode3.addAttribute("value", dBconfig.getUsername());
	            //创建property 4
	            Element propertyNode4=newNode.addElement("property");
	            propertyNode4.addAttribute("name", "password");
	            propertyNode4.addAttribute("value", dBconfig.getPassword());
	            //创建property 5
	            Element propertyNode5=newNode.addElement("property");
	            propertyNode5.addAttribute("name", "initialSize");
	            propertyNode5.addAttribute("value", String.valueOf(dBconfig.getInitialsize()));
	            //创建property 6
	            Element propertyNode6=newNode.addElement("property");
	            propertyNode6.addAttribute("name", "maxActive");
	            propertyNode6.addAttribute("value", String.valueOf(dBconfig.getMaxactive()));
	            //创建property 7
	            Element propertyNode7=newNode.addElement("property");
	            propertyNode7.addAttribute("name", "maxWait");
	            propertyNode7.addAttribute("value", String.valueOf(dBconfig.getMaxwait()));
	        	
	        }
	        
	        OutputFormat outformat=new OutputFormat();
	        outformat.setIndent(true);
	        outformat.setNewlines(true);
	        outformat.setTrimText(true);
	        //将某节点的属性和值写入xml文档中
	        XMLWriter writer = new XMLWriter(new FileWriter(allfile),outformat);
	        writer.write(document);
	        writer.close();
	        json.put("success", true);
			json.put("message","自动配置文件成功");
		}catch (Exception e) {
			e.printStackTrace();
			json.put("success", false);
			json.put("message", ExceptionUtil.getDeleteMessage(e, "自动配置文件失败"));
		}
		logService.addLog("自动配置文件完成", cxt, json);
		return json;
	}
}
