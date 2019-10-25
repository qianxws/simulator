package com.cinema.sys.utils.spring;

import java.awt.Color;
import java.io.File;
import java.util.Date;
import java.util.Map;

import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.ss.usermodel.BorderStyle;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.xssf.streaming.SXSSFWorkbook;
import org.apache.poi.xssf.usermodel.XSSFCellStyle;
import org.apache.poi.xssf.usermodel.XSSFColor;
import org.apache.poi.xssf.usermodel.XSSFFont;
import org.springframework.stereotype.Service;

@Service
public class DataExportUtil {
	//生成导出文件
	public static File getExportFile(String userId,String realPath,String downloadDir,String fileName) {
		//删除之前生成的文件
		Long time = new Date().getTime() - 60 * 60 * 1000;//删除一小时前所有文件
		File[] fileList = new File(realPath+downloadDir).listFiles();
		if (fileList != null && fileList.length > 0) {
			for (File file : fileList) {//删除之前的文件，以及一小时前创建的所有文件
				if (file.getName().startsWith(userId) || file.lastModified() < time) 
					file.delete();
			}
		}
		return new File(realPath+downloadDir + fileName);
	}
	
	//设置列宽
	public static void setColumnWidth(Sheet sheet,String[] head,Map<String,Integer> columnWidthMap) {
		for (int i = 0; i < head.length; i++) {
			if(columnWidthMap.get(head[i])!=null)
			   sheet.setColumnWidth(i, columnWidthMap.get(head[i])*256);
		}
	}
	
	//创建第一行表头
	public static void createTitleRow(SXSSFWorkbook workbook,Sheet sheet,String[] head) {
		//创建表头style
		XSSFCellStyle cellStyleTitle= (XSSFCellStyle) workbook.createCellStyle();
		cellStyleTitle.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);//填充表格
		cellStyleTitle.setFillForegroundColor(new XSSFColor(new Color(117,186,255)));//(byte)0,(byte)255,(byte)127
		//设置excel中的边框（表头的边框）
		cellStyleTitle.setAlignment(HorizontalAlignment.CENTER);//文字水平居中
		cellStyleTitle.setBorderBottom(BorderStyle.THIN);//底部边框线样式（细实线）
		cellStyleTitle.setBottomBorderColor(HSSFColor.BLACK.index);//底部边框线样式（细实线）
		cellStyleTitle.setBorderLeft(BorderStyle.THIN);
		cellStyleTitle.setLeftBorderColor(HSSFColor.BLACK.index);
		cellStyleTitle.setBorderRight(BorderStyle.THIN);
		cellStyleTitle.setRightBorderColor(HSSFColor.BLACK.index);
		cellStyleTitle.setBorderTop(BorderStyle.THIN);
		cellStyleTitle.setTopBorderColor(HSSFColor.BLACK.index);
		//设置 字体样式 
		XSSFFont titlefont=(XSSFFont) workbook.createFont();
		titlefont.setBold(true);//加粗
		cellStyleTitle.setFont(titlefont);//应用到当前样式中 
		
		//创建第一行表头
		Row row = sheet.createRow(0);
		Cell cell = null;
		for (int i = 0; i < head.length; i++) {
			cell = row.createCell(i);
			cell.setCellValue(head[i]);
			cell.setCellStyle(cellStyleTitle);
		}
	}
	
	//内容行的格式
	public static XSSFCellStyle  getCellStyleRow(SXSSFWorkbook workbook) {
		//创建表格内容style
		XSSFCellStyle cellStyleRow= (XSSFCellStyle) workbook.createCellStyle();
		//设置表格边框
		cellStyleRow.setBorderBottom(BorderStyle.THIN);//底部边框线样式（细实线）
		cellStyleRow.setBottomBorderColor(HSSFColor.BLACK.index);//底部边框线样式（细实线）
		cellStyleRow.setBorderLeft(BorderStyle.THIN);
		cellStyleRow.setLeftBorderColor(HSSFColor.BLACK.index);
		cellStyleRow.setBorderRight(BorderStyle.THIN);
		cellStyleRow.setRightBorderColor(HSSFColor.BLACK.index);
		cellStyleRow.setAlignment(XSSFCellStyle.ALIGN_RIGHT);
		cellStyleRow.setWrapText(true);
		
		return cellStyleRow;
	}
}