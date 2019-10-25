package com.cinema.common.service.impl;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.alibaba.fastjson.JSONObject;
import com.cinema.common.service.UploadFileService;
import com.cinema.sys.action.util.ActionContext;
import com.cinema.sys.utils.FileUtil;
import com.cinema.sys.utils.FtpHostUtil;
import com.cinema.sys.utils.MyUUID;
import com.cinema.sys.utils.SiteUtil;

import net.coobird.thumbnailator.Thumbnails;


@Service
public class UploadFileServiceImpl implements UploadFileService {
	
	private MultipartFile getFile(HttpServletRequest request) throws Exception{
		Iterator<String> fileNames = ((MultipartHttpServletRequest) request).getFileNames();
		MultipartFile file=fileNames.hasNext()? ((MultipartHttpServletRequest) request).getFile(fileNames.next()):null;
		if (file==null) {
			throw new Exception("未读取到上传文件！");
		}
		return file;
	}

	@Override
	public JSONObject uploadFile(ActionContext cxt) {
		String userId = String.valueOf(cxt.getHttpRequest().getAttribute("userId"));
		HttpSession session = cxt.getHttpRequest().getSession();
		session.setAttribute("gropress", 0);
		JSONObject json = new JSONObject();
		StringBuffer sb = new StringBuffer();
		
		//得到日期目录
		Date createTime=new Date();
		String fileName=MyUUID.getUUID()+".jpg";
		SimpleDateFormat sdf3=new SimpleDateFormat("yyyy/MMdd/");
		String datePath3=sdf3.format(createTime);
		String ftpPath= SiteUtil.site.getFtpPath()+"full/"+datePath3;
		String thumbFtpPath= SiteUtil.site.getFtpPath()+"thumbs/"+datePath3;
		String thumbUploadPath= SiteUtil.site.getUploadPath()+"thumbs/"+datePath3;
		String filePath=cxt.getHttpRequest().getRealPath("/upload/full/"+datePath3);
		String thumbFilePath=cxt.getHttpRequest().getRealPath("/upload/thumbs/"+datePath3);

		MultipartFile file =null;
		try {
			//导入到临时表DbTable
			file = this.getFile(cxt.getHttpRequest());
			InputStream in= file.getInputStream();
			
			FileUtil.mkdirs(filePath);
			FileUtil.saveFile(filePath,fileName, in);
			in=new FileInputStream(new File(filePath+fileName));
			
			FileUtil.mkdirs(thumbFilePath);
			Thumbnails.of(in)
		  		.size(100, 100)
		  		.toFile(thumbFilePath+fileName);  
			
			session.setAttribute("gropress", 0.3);
			
			//如果启用ftp保存图片
			if(SiteUtil.site.getFtpEnabled()) {
				 in=new FileInputStream(new File(filePath+fileName));
				 FtpHostUtil.uploadFile(SiteUtil.site.getFtpHost(), SiteUtil.site.getFtpUser(), SiteUtil.site.getFtpPassword(), SiteUtil.site.getFtpPort(), ftpPath, fileName,in);
				 session.setAttribute("gropress", 0.6);
				 in=new FileInputStream(new File(thumbFilePath+fileName));
		         FtpHostUtil.uploadFile(SiteUtil.site.getFtpHost(), SiteUtil.site.getFtpUser(), SiteUtil.site.getFtpPassword(), SiteUtil.site.getFtpPort(), thumbFtpPath, fileName,in);
		         session.setAttribute("gropress", 0.9);
		         if(FileUtil.exist(filePath+fileName))
		        	 FileUtil.delFile(filePath+fileName);
		         if(FileUtil.exist(thumbFilePath+fileName))
		        	 FileUtil.delFile(thumbFilePath+fileName);
			}

			in.close();
			session.setAttribute("gropress", 1);
			json.put("pic", datePath3+fileName);
			json.put("msg", "成功上传");
			json.put("success", true);
		} catch (Exception e) {
			String error=e.getMessage();
			json.put("msg", error);
			json.put("success", false);
		} finally {
			session.removeAttribute("isUpdate");
		}
		return json;
	}

}
