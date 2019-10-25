package com.cinema.common.action;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.xssf.streaming.SXSSFWorkbook;
import org.apache.poi.xssf.usermodel.XSSFCellStyle;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.alibaba.fastjson.JSONObject;
import com.cinema.common.service.DataExportService;
import com.cinema.sys.action.util.ActionContext;
import com.cinema.sys.action.util.Service;
import com.cinema.sys.service.LogService;
import com.cinema.sys.utils.TimeUtil;
import com.cinema.sys.utils.spring.DataExportUtil;

@Component
@Service(name = "dataExportAction")
public class DataExportAction {
	private static final Logger logger = LoggerFactory.getLogger(DataExportAction.class);
	private static String downloadDir="/downloadFile/";
	@Autowired
	private LogService logService;
	@Autowired 
    private DataExportService dataExportService;  

	/**
	 * 导出影片信息excel文件
	 * @param cxt
	 */
	@SuppressWarnings("deprecation")
	public JSONObject exportFilm(ActionContext cxt) {
		JSONObject json = new JSONObject();
		HttpServletRequest request = cxt.getHttpRequest();
		HttpSession session = request.getSession();
		session.setAttribute("gropress", 0);
		
		String userId = String.valueOf(cxt.getHttpRequest().getAttribute("userId"));
		String realPath = request.getRealPath("") ;
		String fileName = userId + "-" +(new Date()).getTime() + ".xlsx";
		//生成导出文件
		File file = DataExportUtil.getExportFile(userId,realPath,downloadDir,fileName);
		OutputStream out = null;

		int rowNum = 0;
		try {
			SXSSFWorkbook workbook = new SXSSFWorkbook();
			Sheet sheet = workbook.createSheet();
			String[] head = {"序号", "名称", "编码", "日期"};

			//设置列宽
			Map<String,Integer> columnWidthMap=new HashMap<String,Integer>();
			columnWidthMap.put("序号", 5);
			columnWidthMap.put("名称", 32);
			columnWidthMap.put("编码", 32);
			columnWidthMap.put("日期", 32);
			DataExportUtil.setColumnWidth(sheet, head, columnWidthMap);
			//创建第一行表头
			DataExportUtil.createTitleRow(workbook,sheet, head);
			
			Row row = null;
			Cell cell = null;
			//内容行的格式
			XSSFCellStyle cellStyleRow=DataExportUtil.getCellStyleRow(workbook);

			int page = 1;
			int total = dataExportService.getFilmTotal();
			while (true) {
				List<Map<String,Object>>  dataList = dataExportService.getFilmExcel(1000,(page-1)*1000);
				page++;
				if (dataList == null || dataList.size() == 0) {
					break;
				}
				for (Map<String,Object> map : dataList) {
					row = sheet.createRow(++rowNum);
					for (int i = 0; i < head.length; i++) {
						switch(head[i]) {
							case "序号":
								cell = row.createCell(0);
								cell.setCellValue(rowNum);
								cell.setCellStyle(cellStyleRow);
								break;
							case "日期":
								cell = row.createCell(i);
								cell.setCellValue(map.get(head[i])==null?"":TimeUtil.dateToString((Date)map.get(head[i])));
								cell.setCellStyle(cellStyleRow);
								break;
							default:
								cell = row.createCell(i);
								cell.setCellValue(map.get(head[i])==null?"":map.get(head[i]).toString());
								cell.setCellStyle(cellStyleRow);
								break;
						}
					}
				}
				session.setAttribute("gropress", rowNum / total);
			}
			out = new FileOutputStream(file);
			workbook.write(out);
			out.flush();
			workbook.dispose();
			session.setAttribute("gropress", 1);
		} catch (IOException ex) {
			logger.error(ex.getMessage());
		}finally {
			if (out != null) 
				IOUtils.closeQuietly(out);
		}
		logService.addLog("导出影院Excel", "导出" + rowNum + "个影院", userId, true);
		json.put("filePath",downloadDir+ fileName);
		return json;
	}

}
