package com.cinema.sys.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * 上传下载
 * 
 * @author hanxu
 */
@Controller
@RequestMapping("/download")
public class DownloadController {

	private static final Logger logger = LoggerFactory.getLogger(DownloadController.class);

	public static void main(String[] args) {
		System.out.println(decodeUnicode("\\u8bbe\\u5907\\u4fe1\\u606f\\u002e\\u0078\\u006c\\u0073\\u0078"));
	}
	/**
	 * 下载文件
	 * 
	 * @param cxt
	 * @param request
	 * @param response
	 * @param session
	 */
	@SuppressWarnings("deprecation")
	@RequestMapping("/downloadByPath")
	@ResponseBody
	public void downloadByPath(HttpServletRequest request, HttpServletResponse response, HttpSession session) {

		String path = request.getParameter("path");
		String filedisplay = request.getParameter("fileName");// 下载文件时显示的文件保存名称
		if (StringUtils.isEmpty(path)) {
			logger.error("文件路径为空！");
			return;
		}

		// File file = new File (UploadUtil.FILE_PATH + path);
		File file = new File(request.getRealPath("") + path);
		if (!file.exists()) {
			logger.error("下载出错，文件不存在！路径：" + file.getPath());
			return;
		}

		ServletOutputStream out = null;
		FileInputStream in = null;
		try {
			response.setContentType("application/x-download");// 设置为下载application/x-download
			String agent = request.getHeader("USER-AGENT");
			if (agent != null && agent.toLowerCase().indexOf("firefox") > 0) {
				filedisplay = new String(filedisplay.getBytes("UTF-8"), "ISO-8859-1");
			} else {
				filedisplay =unicodetoString(filedisplay);
			}
			response.setContentType("application/x-msdownload;");
			response.setHeader("Content-Disposition", "attachment;filename=" + new String(filedisplay.getBytes("UTF-8"),"ISO-8859-1"));
			response.setHeader("Content-Length", String.valueOf(path));
			
			out = response.getOutputStream();
			in = new FileInputStream(file);
			byte[]buff=new byte[2048];
			int bytesRead;
			while(-1!=(bytesRead=in.read(buff,0,buff.length))) {
				out.write(buff,0,bytesRead);
			}
			//IOUtils.copy(in, out);
		} catch (IOException e) {
			logger.error("下载出错:" + e.getMessage());
		} finally {
			IOUtils.closeQuietly(out);
			IOUtils.closeQuietly(in);
		}
	}

	/**
	 * unicode解码
	 * @return
	 */
	public static String unicodetoString(String unicode) {
		if(unicode==null || "".equals(unicode)) {
			return null;
		}
		StringBuffer sb=new StringBuffer();
		int i=-1;
		int pos=0;
		while((i=unicode.indexOf("\\u",pos))!=-1) {
			sb.append(unicode.substring(pos,i));
			if(i+5<unicode.length()) {
				pos=i+6;
				sb.append((char)Integer.parseInt(unicode.substring(i+2,i+6),16));
			}
		}
		return sb.toString();
	}
	public static String decodeUnicode(String dataStr) {
		int start=0;
		int end=0;
		final StringBuffer sb=new StringBuffer();
		while(start>-1) {
			end=dataStr.indexOf("\\u",start+2);
			String charStr="";
			if(end==-1) {
				charStr=dataStr.substring(start+2,dataStr.length());
			}else {
				charStr=dataStr.substring(start+2,end);
			}
			char letter=(char)Integer.parseInt(charStr,16);
			sb.append(new Character(letter).toString());
			start=end;
		}
		return sb.toString();
	}
	
	/**
	 * 接收作业文件上传的附件
	 * 
	 * @param cxt
	 * @return
	@SuppressWarnings("deprecation")
	@ResponseBody
	@RequestMapping("/uploadAttachment")
	public JSONObject uploadAttachment(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		JSONObject json = new JSONObject();
		json.put("success", false);

		Iterator<String> fileNames = ((MultipartHttpServletRequest) request).getFileNames();
		if (fileNames.hasNext()) {
			String fileFormName = (String) fileNames.next();
			MultipartFile file = ((MultipartHttpServletRequest) request).getFile(fileFormName);
			if (!file.isEmpty()) {

				String oldName = file.getOriginalFilename();
				String relativePath = ResourceUtil.getMessageByConfig("attrPath") + "/"
						+ new SimpleDateFormat("yyyyMMdd").format(new Date());
				String fileName = MyUUID.getUUID() + oldName.substring(oldName.lastIndexOf("."));
				try {
					UploadUtil.upload(file.getInputStream(), request.getRealPath("").replace("\\", "/") + relativePath,
							fileName);
				} catch (Exception e) {
					e.printStackTrace();
				}

				json.put("relativePath", relativePath);
				json.put("fileName", fileName);
				json.put("oldName", oldName);
				json.put("fileSize", file.getSize());
				json.put("success", true);
			}
		}

		return json;
	}
	 */
	

	/**
	 * 
	 * @return
	 */
	@SuppressWarnings("deprecation")
	@ResponseBody
	@RequestMapping("/deleteAttachment")
	public void deleteAttrachment(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		String path = request.getParameter("path");
		logger.info("删除文件，路径：" + path);
		if (StringUtils.isEmpty(path)) {
			logger.error("删除出错，删除文件路径为空！");
			return;
		}

		// File file = new File (UploadUtil.FILE_PATH + path);
		File file = new File(request.getRealPath("") + path);
		if (!file.exists()) {
			logger.error("删除出错，文件不存在！路径：" + file.getPath());
			return;
		}

		Boolean boo = file.delete();
		logger.info("删除文件结束，是否成功：" + boo);
	}
	
	
}



