package com.cinema.sys.utils;

import java.io.InputStream;

import org.apache.poi.hssf.usermodel.HSSFDateUtil;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.DataFormatter;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

public class ExcelImportUtil {
	
	/**
	 * 通过文件流和名称获得workbook对象，兼容office2003和2007
	 * @param fileName
	 * @param in
	 * @return
	 * @throws Exception
	 */
	public static Workbook getWorkbook(String fileName, InputStream in) throws Exception {
		Workbook xwb = null;
		if (fileName.endsWith("xls")) {
			xwb = new HSSFWorkbook(in);
		}else if (fileName.endsWith("xlsx")) {
			xwb = new XSSFWorkbook(in);
		}else {
			throw new Exception("未知的文件类型！");
		}
		return xwb;
	}
	
	/**
	 * 读取cell内的值
	 * 
	 * @param cell
	 *            :cell
	 * @return
	 */
	public static Object getCellValue(Cell cell) {
		if (cell != null) {
			switch (cell.getCellType()) {
			case Cell.CELL_TYPE_BLANK:
				return null;
			case Cell.CELL_TYPE_BOOLEAN:
				return cell.getBooleanCellValue();
			case Cell.CELL_TYPE_FORMULA:
				return cell.getCellFormula();
			case Cell.CELL_TYPE_NUMERIC:
				// 如果是时间
				if (HSSFDateUtil.isCellDateFormatted(cell)) {
					return (new DataFormatter()).formatCellValue(cell);
				}
				//double避免科学计数法
				ConfigUtil.NF.setGroupingUsed(false);
				return ConfigUtil.NF.format(cell.getNumericCellValue());
			case Cell.CELL_TYPE_STRING:
				return cell.getStringCellValue().trim();
			default:
				return null;
			}
		}
		return null;
	}

	/*
	public static String getCellStringValue(Cell cell) {
		if (cell != null) {
			switch (cell.getCellType()) {
				case Cell.CELL_TYPE_BLANK:
					return null;
				case Cell.CELL_TYPE_BOOLEAN:
					return cell.getBooleanCellValue() ? "1" : "0";
				case Cell.CELL_TYPE_FORMULA:
					return cell.getCellFormula();
				case Cell.CELL_TYPE_NUMERIC:
					// 如果是时间
					if (HSSFDateUtil.isCellDateFormatted(cell)) {
						Date date = cell.getDateCellValue();
						return Tools.DAY_SDF.format(date);
					}
					//double避免科学计数法
					ConfigUtil.NF.setGroupingUsed(false);
					return ConfigUtil.NF.format(cell.getNumericCellValue());
				case Cell.CELL_TYPE_STRING:
					return cell.getStringCellValue().trim();
				default:
					return null;
			}
		}
		return null;
	}*/
	
}
