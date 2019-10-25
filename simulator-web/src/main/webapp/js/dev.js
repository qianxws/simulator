/**
 * JqdeMods ajax
 */
var token = getToken();
var devMods = {
	publicAjax : function(verb, ajaxParams) {
		var apiPath = Config.apiPath.replace(/\/?$/, '');
		var url = apiPath +'/mypublic/' + verb;
		return new Promise(function(resolve, reject) {
			var data = null;
			if (ajaxParams) {
				if ($.type(ajaxParams) === "string") {
					data = {
						'ajaxParams' : ajaxParams
					};
				} else {
					data = {
						'ajaxParams' : JSON.stringify(ajaxParams)
					};
				}
			}
			$.ajax({
				type : 'post',
				url : url,
				data : data,
				cache : false,
				dataType : 'json',
				success : function(data, textStatus, jqXHR) {
					if (data.success == false && data.message && data.message.indexOf('重新登录') > -1) {
						if (window.location.hash) {
							JqdeBox.noTitleAlert(data.message, function() {
								window.location.href =Config.apiPath+ 'login.html' + location.hash;
							});
						} else {
							window.location.href = Config.apiPath+ 'login.html';
						}
						/*if(data.message==-1){
							window.location.href = './login.html';
						}*/
						return;
					}
					resolve(data);
				},
				error : function(XMLHttpRequest, textStatus, errorThrown) {
					reject(XMLHttpRequest);
				}
			});
		})
	},
	ajax : function(action, verb, ajaxParams,mods) {
		var apiPath = Config.apiPath.replace(/\/?$/, '');
		var url = apiPath +'/commonMods/ajax?action=' + action + '&verb=' + verb+'&token=' + token;
		return new Promise(function(resolve, reject) {
			var data = null;
			if (ajaxParams) {
				if ($.type(ajaxParams) === "string") {
					data = {
						'ajaxParams' : ajaxParams
					};
				} else {
					data = {
						'ajaxParams' : JSON.stringify(ajaxParams)
					};
				}
			}
			$.ajax({
				type : 'post',
				url : url,
				data : data,
				cache : false,
				dataType : 'json',
				success : function(data, textStatus, jqXHR) {
					if (data.success == false && data.message && data.message.indexOf('重新登录') > -1) {
						if (window.location.hash) {
							JqdeBox.noTitleAlert(data.message, function() {
								window.location.href =Config.apiPath+ 'login.html' + location.hash;
							});
						} else {
							window.location.href = Config.apiPath+ 'login.html';
						}
						/*if(data.message==-1){
							window.location.href = './login.html';
						}*/
						return;
					}
					resolve(data);
				},
				error : function(XMLHttpRequest, textStatus, errorThrown) {
					reject(XMLHttpRequest);
				}
			});
		})
	},
	get : function(url, success, error) {
		$.ajax({
			type : 'get',
			url : url,
			cache : false,
			dataType : 'json',
			success : function(data, textStatus, jqXHR) {
				if (success)
					success(data);
			},
			error : function(XMLHttpRequest, textStatus, errorThrown) {
				if (error)
					error(XMLHttpRequest);
			}
		});
	},
	post : function(url, data, success, error) {
		$.ajax({
			type : 'post',
			url : url,
			data : data,
			cache : false,
			dataType : 'json',
			success : function(data, textStatus, jqXHR) {
				if (success)
					success(data);
			},
			error : function(XMLHttpRequest, textStatus, errorThrown) {
				if (error)
					error(XMLHttpRequest);
			}
		});
	}
};

var BootDialog = {
	dialog : function(options){
		var dl = BootstrapDialog.show({
			title : "<span class='bigger-130'>" + options.title + "</span>",
			message : $('<div></div>').load(options.url),
			draggable : true,
			closable : true,
			onshown : function () {
				if (options.init)
					options.init();
			},
			buttons: [{
				label : '<i class="fa fa-times"></i> 取消',
				cssClass : 'btn-sm',
				action : function(dialog) {
					dialog.close();
				}
			}, {
				label : '<i class="fa fa-check"></i> 确定',
				cssClass : 'btn-success btn-sm',
				action : function(dialog) {
					if (options.confirm){
						if (options.confirm()){
							dialog.close();
						}
					}else {
						dialog.close();
					}
				}
			}]
		});
		return dl;
	},
	alert : function(options){
		var dl = BootstrapDialog.show({
			title : options.title || '<span class="bigger-130">信息</span>',
			message : options.message,
			draggable : true,
			onshow : function(dialog) {
				//$(dialog.$modalHeader).css({'padding':'0 10px'});
				$(dialog.$modalBody).css({'padding-bottom':'20px'});
			}
		});
		return dl;
	},
	uploadAlert : function(message) {
		var dl = BootstrapDialog.show({
			//title : options.title,
			message : message,
			draggable : true,
			onshow : function(dialog) {
				$(dialog.$modalHeader).remove;
			}
		});
		return dl;
	}
}

/**
 * bootbox 弹出框
 * 
 * @type {{alert: JqdeBox.alert, confirm: JqdeBox.confirm, prompt:
 *       JqdeBox.prompt, dialog: JqdeBox.dialog, loading: JqdeBox.loading,
 *       unloading: JqdeBox.unloading}}
 */
var JqdeBox = {
	// alert/confirm/prompt/dialog
	alert : function(message, callback) {
		var dl = BootstrapDialog.show({
			title : '<span class="bigger-130">提示</span>',
			message : message,
			draggable : true,
			closable : true,
			onshow : function(dialog) {
				//$(dialog.$modalHeader).css({'padding':'0 10px'});
				$(dialog.$modalBody).css({'padding-bottom':'20px'});
			},
			buttons: [{
				label : '<i class="fa fa-check"></i> 确定',
				cssClass : 'btn-success btn-sm',
				action : function(dialog) {
					if (callback){
						callback();
						dialog.close();
					}else {
						dialog.close();
					}
				}
			}]
		});
		return dl;
		/*
		return bootbox.alert({
			message : "<span class='bigger-130'>" + message + "</span>",
			buttons : {
				ok : {
					label : '<i class="fa fa-check"></i> 确定',
					className : 'btn-success'
				}
			},
			callback : callback
		});*/
	},
	noTitleAlert : function(message, callback) {
		return bootbox.alert({
			message : "<span class='bigger-130'>" + message + "</span>",
			buttons : {
				ok : {
					label : '<i class="fa fa-check"></i> 确定',
					className : 'btn-success'
				}
			},
			callback : callback
		});
	},
	confirm : function(message, callback) {
		bootbox.confirm({
			message : "<span class='bigger-130'>" + message + "</span>",
			buttons : {
				cancel : {
					label : '<i class="fa fa-times"></i> 取消',
					className : 'btn-sm',
				},
				confirm : {
					label : '<i class="fa fa-check"></i> 确定',
					className : 'btn-success btn-sm'
				}
			},
			callback : function(result) {
				//_.result($(this).data('bs.modal'), 'resetScrollbar');
				$.isFunction(callback) && callback(result);
			}
		});
	},
	prompt : function(title, inputType, callback) {

		if ($.isFunction(inputType)) {
			callback = inputType;
			inputType = 'text';
		}

		bootbox.prompt({
			title : title,
			inputType : inputType,
			buttons : {
				cancel : {
					label : '<i class="fa fa-times"></i> 取消',
					className : 'btn-sm',
				},
				confirm : {
					label : '<i class="fa fa-check"></i> 确定',
					className : 'btn-success btn-sm',
				}
			},
			callback : callback
		});
	},
	dialogNoBtn : function(title, message) {
		return bootbox.dialog({
			title : "<span class='bigger-130'>" + title + "</span>",
			message : message,
			buttons : null
		});
	},
	dialog : function(options) {
		var dialog = BootstrapDialog.show({
			title : "<span class='bigger-130'>" + options.title + "</span>",
			message : options.message || $('<div></div>').load(options.url),
			draggable : true,
			closable : true,
			onshown : function (dialog) {
				if (options.init)
					options.init();
				$('.bootstrap-dialog-close-button').css({'display':'block'})
			},
			buttons: options.onlyConfirm ? [{
				label : '<i class="fa fa-check"></i> 确定',
				cssClass : 'btn-success btn-sm',
				action : function(dialog) {
					if (options.confirm){
						if (options.confirm(dialog)){
							dialog.close();
						}
					}else {
						dialog.close();
					}
				}
			}] : [{
				label : '<i class="fa fa-times"></i> 取消',
				cssClass : 'btn-sm',
				action : function(dialog) {
					dialog.close();
				}
			}, {
				label : '<i class="fa fa-check"></i> 确定',
				cssClass : 'btn-success btn-sm',
				action : function(dialog) {
					if (options.confirm){
						if (options.confirm()){
							dialog.close();
						}
					}else {
						dialog.close();
					}
				}
			}]
		});

		return dialog;
	},
	hideAll : function() {
		bootbox.hideAll()
	},

	// loading
	loading : function() {
		this.dlgLoading = bootbox
				.dialog({
					message : '<div class="text-center"><i class="fa fa-spin fa-spinner"></i> Loading...</div>',
					backdrop : false,
					closeButton : false
				})
	},
	unloading : function() {
		var dlgLoading = this.dlgLoading;
		setTimeout(function() {
			if (dlgLoading) {
				//_.result(dlgLoading.data('bs.modal'), 'resetScrollbar');
				dlgLoading.modal('hide');
			}
		}, 200);
	},

	// message box
	message : function(type, message) {
		if (type === true)
			type = 'success';
		if (type === false)
			type = 'error';
		$.gritter.add({
			title : '提示',
			time : 1000,
			text : message,
			class_name : 'gritter-' + type + ' gritter-light'
		});
	}
}