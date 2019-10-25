var importUtil = {
		action:'',
		is_update : false,
		dialog : null,
		execImport : function (divFile,action,uploadVerb) {
			importUtil.action=action;
			var file = $(document.getElementById(divFile)).val();
			if (!file) return false;
			
			var fileType = file.substring(file.lastIndexOf(".")+1);
			if(".xls.xlsx".indexOf(fileType) == -1) {
				JqdeBox.alert("请选择excel文件！");
				return false;
			}
			importUtil.is_update = true;
			//显示进度条
			importUtil.gropress();
			//上传文件
			$.ajaxFileUpload({
		        url: 'commMods/ajax?action='+action+'&verb='+uploadVerb+'&token='+token, //用于文件上传的服务器端请求地址
		        secureuri: false, //一般设置为false
		        fileElementId: divFile, //文件上传空间的id属性  
		        dataType: 'json', //返回值类型 一般设置为json
		        success: function (data, status){
		        	importUtil.dialog.close();
		        	if (data.success) {
		        		JqdeBox.alert('<div class="success-msg">' + data.msg + '</div>', null);
					} else {
						JqdeBox.alert('<div class="error-msg">' + data.msg + '</div>', null);
					}
		        	importUtil.is_update = false;
		        	$('#'+divFile).val("");
		        	importBiz.onImportSuccess();
		        },
		        error: function (data, status, e){
		        	JqdeBox.alert("上传失败，请稍后再试！", null);
		        	importUtil.is_update = false;
		        	$('#'+divFile).val("");
		        	importBiz.onImportError();
		        }
			});
		},
		//进度条
		gropress : function() {
			//查询进度
			importUtil.dialog = BootstrapDialog.show({
				title : '文件正在导入，请勿进行其他操作',
				message : '<div class="col-sm-10 col-sm-offset-1" id="gropress" style="height:40px;">'
					+ '<div class="progress pos-rel" data-percent="0%">'
					+ '<div class="progress-bar" style="width:0%;"></div></div></div>'});
			//刷新进度条
			importUtil.updateGropress();
		},
		updateGropress : function () {
			if (!importUtil.is_update){
				return false;
			}
			var gropress_div = $('#gropress');
			JqdeMods.ajax('dataImport', 'updatePress', {}).then(function (result) {
				if (result.success){
					var gropress = (result.gropress * 100).toFixed(2);
					gropress_div.html('<div class="progress pos-rel" data-percent="'+gropress+'%">'+
	        				'<div class="progress-bar" style="width:'+gropress+'%;"></div></div>');
	        		setTimeout(importUtil.updateGropress(), 500);
	        	}
			});
		}
}



