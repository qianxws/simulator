package com.cinema.sys.utils.spring;

import java.io.InputStream;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.apache.poi.hssf.usermodel.HSSFDateUtil;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.cinema.sys.dao.SqlMapper;
import com.cinema.sys.utils.ExcelImportUtil;
import com.cinema.sys.utils.MyUUID;
import com.cinema.sys.utils.PoiUtil;
import com.cinema.sys.utils.SafeSqlUtil;
import com.cinema.sys.utils.TimeUtil;

@Service
public class DataImportUtil {
	@Autowired  
    private SqlMapper sqlDao;  
	
	private DecimalFormat df = new DecimalFormat("###############");//15位数字
	private SimpleDateFormat fmt = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	//单次导入的记录数
//	private int singleRows=10;
	
	private  void deleteExcelTable(String excelTable) {
		sqlDao.execSql("delete from "+excelTable);
	}
	
	public  MultipartFile getFile(HttpServletRequest request) throws Exception{
		Iterator<String> fileNames = ((MultipartHttpServletRequest) request).getFileNames();
		MultipartFile file=fileNames.hasNext()? ((MultipartHttpServletRequest) request).getFile(fileNames.next()):null;
		if (file==null) {
			throw new Exception("未读取到上传文件！");
		}
		return file;
	}
//	CellType 类型 值
//	CELL_TYPE_NUMERIC 数值型 0
//	CELL_TYPE_STRING 字符串型 1
//	CELL_TYPE_FORMULA 公式型 2
//	CELL_TYPE_BLANK 空值 3
//	CELL_TYPE_BOOLEAN 布尔型 4
//	CELL_TYPE_ERROR 错误 5
	
	/**
	 * excel文件导入到数据库对应的excel数据表
	 */
	public  int excel2DbTable(HttpSession session,MultipartFile file,String dbTable,Map<String, String> typeMap,String head,String titles,int singleRows) throws Exception{
		if (session.getAttribute("isUpdate") != null) {
			throw new Exception("存在未完成的上传任务，请稍后再试！");
		}
		session.setAttribute("isUpdate", true);//文件正在上传
		session.setAttribute("gropress", 0);
		
		deleteExcelTable(dbTable);
		int total=0;
		InputStream in=null;
		try {
			PoiUtil eu1 = new PoiUtil();//用来读取源xls

			//第一次导入
			in = file.getInputStream();
			session.setAttribute("gropress", 0.01);
			Workbook xwb = ExcelImportUtil.getWorkbook(file.getOriginalFilename(), in);
			Sheet sheet = xwb.getSheetAt(0);// 读取第一个sheet页内容
			List<Row> rows=eu1.readExcel(xwb);
			session.setAttribute("gropress", 0.05);
			total=rows.size()-1;
			eu1.setEndSheetIdx(0);
			String title="";
			String values="";
			String sql="";
			int j=0;
			//检查excel表头格式
			Row titleRow=rows.get(0);
			for (int i = titleRow.getFirstCellNum(); i < titleRow.getLastCellNum(); i++) {
				if(titleRow.getCell(i) !=null) {
					title=titleRow.getCell(i).getStringCellValue().trim();
					 if((","+head+",").indexOf(","+title+",")==-1)
						 throw new Exception("excel表头格式不正确，正确表头应包含:"+head);
				}
			}	
//			titles=titles.substring(0, titles.length()-1);//去掉最后,号
			String[] titleArr=titles.split(",");
//			titles="\""+titles.replace(",", "\",\"")+"\"";
			titles=String.format("insert into %s(row_num,error,id,create_time,%s)values(#values#);", dbTable,titles);
			Integer celltype=0;
			j=0;
			String rowStr="";
			Cell cell;
			for (Row row : rows){
				if(row.getCell(0) !=null && j>0){//排除首行为空的情况
					values="";
					for (int i = row.getFirstCellNum(); i < titleArr.length; i++) {
						celltype=row.getCell(i).getCellType();
						cell=row.getCell(i);
						String type=typeMap.get(titleArr[i])==null?"string":typeMap.get(titleArr[i]);
						switch(type){
						  case "string":
							  if(row.getCell(i).getCellType()==0) {//数值类型转字符串
								  values+="'"+df.format(row.getCell(i).getNumericCellValue())+"',";
							  }
							  else {
								  values+="'"+SafeSqlUtil.getSafeString(row.getCell(i).toString().trim())+"',";
							  }
							  break;
						  case "num":
							  if(row.getCell(i).toString().trim().equals("")) {
								  values+="null,";
							  }
							  else if(row.getCell(i).getCellType()==1) {//字符串类型转数值
								try{
									values+=Double.valueOf(row.getCell(i).toString().trim()).intValue()+",";
								}catch(Exception ex) {
									throw new Exception("第"+row.getRowNum()+"行：["+titleArr[i]+"]应为数值格式！");
								}
							  }
							  else {
								  //处理数值为3.012E7此类情况
								  rowStr=row.getCell(i).toString();
								  if(rowStr.contains("E"))
									  values+=df.format(row.getCell(i).getNumericCellValue())+",";
								  else
									  values+=row.getCell(i).toString()+",";
							  }
							  break;
						  case "date":
							  if(row.getCell(i).toString().trim().equals("")) {
								  values+="null,";
							  }
							  else if(row.getCell(i).getCellType()==0) {//数值形式的时间格式
								  if (HSSFDateUtil.isCellDateFormatted(cell)) {// 处理日期格式、时间格式  
						                values+="'"+fmt.format(cell.getDateCellValue())+"',";
						            } 
								  else if (cell.getCellStyle().getDataFormat() == 58) {  
						                // 处理自定义日期格式：m月d日(通过判断单元格的格式id解决，id的值是58)  
						                double value = cell.getNumericCellValue();  
						                Date date = org.apache.poi.ss.usermodel.DateUtil.getJavaDate(value);  
						                values+="'"+fmt.format(date)+"',"; 
						            } 
								  else
									  throw new Exception("第"+row.getRowNum()+"行：["+titleArr[i]+"]应为时间格式！"); 
							  }
							  else if(row.getCell(i).getCellType()==1) {//字符串形式的时间格式
									try {
										Date date = TimeUtil.stringToDateNew(row.getCell(i).toString()); 
										values+="'"+fmt.format(date)+"',"; 
									} catch (Exception e) {
										throw new Exception("第"+row.getRowNum()+"行：["+titleArr[i]+"]应为时间格式！");
									}
							  }
							  else  
								  throw new Exception("第"+row.getRowNum()+"行：["+titleArr[i]+"]应为时间格式！");
							  break;
						  case "bool":
							  if(row.getCell(i).getCellType()==4) //布尔型 4
							    values+=row.getCell(i).toString()+",";
							  else
							    throw new Exception("第"+row.getRowNum()+"行：["+titleArr[i]+"]应为布尔格式！");	
							  break;
						}
					}	
					values=values.substring(0, values.length()-1);
					values=row.getRowNum()+",'','"+MyUUID.getUUID()+"','"+fmt.format(new Date())+"',"+values;
					sql+=titles.replace("#values#", values);
					if((j+1)%singleRows==0){
						sqlDao.execSql(sql);
						session.setAttribute("gropress", 0.85*j/total+0.05);
						sql="";
					}
					values="";
				}
				j++;
			}
			sqlDao.execSql(sql);
			session.setAttribute("gropress", 0.9);
		} catch (Exception e) {
			total=0;
			throw e;
		}
		finally {
			IOUtils.closeQuietly(in);
		}
		return total;
  }
}