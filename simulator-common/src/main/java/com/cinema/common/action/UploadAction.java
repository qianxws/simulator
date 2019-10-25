package com.cinema.common.action;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.InetAddress;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.alibaba.fastjson.JSONObject;
import com.cinema.sys.action.util.ActionContext;
import com.cinema.sys.action.util.Service;
import com.cinema.sys.utils.MyUUID;

@Component
@Service(name = "uploadAction")
public class UploadAction {

	public JSONObject uploadFile(ActionContext cxt) throws IOException {
		JSONObject json = new JSONObject();
		// fileName为文件的名称，可通过file获取，不同框架获取的方式不一样
		SimpleDateFormat daySdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String dateStr = daySdf.format(new Date());
		String fileName = MyUUID.getUUID() + dateStr;
		// 获取文件路径
		Iterator<String> fileNames = ((MultipartHttpServletRequest) cxt.getHttpRequest()).getFileNames();
		// 获取文件名
		String file = (String) fileNames.next();
		//得到文件
		MultipartFile files = ((MultipartHttpServletRequest) cxt.getHttpRequest()).getFile(file);
		String realName = files.getOriginalFilename();
		//截取文件后缀名
		String suff ="";
		if(realName.indexOf(".")>-1) {
			suff = realName.substring(realName.lastIndexOf("."));
		}else {
			suff=".action";
		}
		//获取服务器绝对地址
		String basePath = cxt.getHttpRequest().getRealPath("").replaceAll("\\\\", "/");
		// 拼接成完整的指定的文件路径名，创建新文件
		File filedir = new File(basePath + "downloads");
		if (!filedir.exists()) {
			filedir.mkdir();
		}
		// 这里需要获取前台上传的地址
		// String oldfile=MyParam.getString(cxt, "fileurl");
		// 使用输入流读取前台的file文件
		InputStream is = files.getInputStream();
		// 循环读取输入流文件内容，通过输出流将内容写入新文件
		OutputStream os = new FileOutputStream(new File(filedir + "/" + fileName + suff));
		byte buffer[] = new byte[1024];
		int cnt = 0;
		while ((cnt = is.read(buffer)) > 0) {
			os.write(buffer, 0, cnt);
		}
		// 关闭输入输出流
		os.close();
		is.close();
		//获取服务器ip地址 例:127.0.0.1
		InetAddress address=InetAddress.getLocalHost();
		String hostAddress=address.getHostAddress();
		cxt.getHttpRequest().getServerPort();
		//获取项目名称 cinemaplat 
		String platname=cxt.getHttpRequest().getContextPath();
		//获取端口 例:8080
		int port=cxt.getHttpRequest().getServerPort();
		//全路径，存储数据库中
		String newfile=hostAddress+":"+port+platname+"/downloads/"+fileName + suff;
		System.out.println(newfile);
		json.put("fileurl", newfile);
		json.put("success", true);
		return json;
	}
}
