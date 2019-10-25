package com.cinema.common.service;

import com.alibaba.fastjson.JSONObject;
import com.cinema.sys.action.util.ActionContext;

public interface UploadFileService {
	/**
	 * 接收上传的影片信息excel文件
	 */
	JSONObject uploadFile(ActionContext cxt);
}
