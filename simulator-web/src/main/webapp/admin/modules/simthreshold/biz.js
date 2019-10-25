var biz={
		//列表
		getList:function (page) {
			vmCheckUtil.clearChecked();
			JqdeBox.loading();
			page = page || 1;
			var rows = $('#pageSelect').val();
			JqdeMods.ajax('simThresholdAction', 'getList', {
				'page' : page,
				'rows' : rows,
				'name' : vm.model.name,
				'typeId' :vm.model.nodeId,
				'startTime' : $('#startTime').val(),
				'endTime' : $('#endTime').val()
			}).then(function(result) {
				JqdeBox.unloading();
				if (result){
					vm.list = result.list;
					vmPageUtil.show(page, result.total, 'biz.getList', rows);
				}else {
					JqdeBox.message(false, result.message);
				}
			});
		},
		// 添加
		add : function() {
			BootDialog.dialog({
				title : '添加监控阈值',
				url : 'modules/simthreshold/edit.html',
				init : function() {
					vmEdit.init();
				},
				confirm : function() { 
					if ($(vmEdit.formId).valid()) {
						JqdeMods.ajax('simThresholdAction', 'insert', {dataItem : vmEdit.model}).then(function(result) {
							if (result.success) {
								biz.getList();// 更新页面
								JqdeBox.message(true, result.message);
							} else {
								JqdeBox.message(false, result.message);
							}
						});
						return true;
					}
					return false;
				}
			});
		},
		//更新
		edit : function(item) {
			BootDialog.dialog({
				title : '修改<b class="green">[' + item.name + ']</b>监控阈值',
				url : 'modules/simthreshold/edit.html',
				init : function() {
					JqdeMods.ajax('simThresholdAction', 'getDetail',  {
						'thresholdId' : item.thresholdId,
					}).then(function(result) {
						if (result.success) {
							vmEdit.model = $.extend(vmEdit.model, result.model);
			                vmEdit.init();
						} else {
							JqdeBox.message(false, result.message);
						}
					});
				},
				confirm : function() {
					if ($(vmEdit.formId).valid()) {
						JqdeMods.ajax('simThresholdAction', 'update', {dataItem : vmEdit.model}).then(function(result) {
							if (result.success) {
								biz.getList();// 更新页面
								JqdeBox.message(true, result.message);
							} else {
								JqdeBox.message(false, result.message);
							}
						});
						return true;
					}
					return false;
				}
			});
		},
		// 删除
		del : function(item) {
			JqdeBox.confirm('您确定要删除监控阈值[<b class="green">' + item.name + '</b>] 吗？',function(result) {
				if (result) {
					JqdeMods.ajax('simThresholdAction', 'delete', {"ids" : [ item.thresholdId ]}).then(function(result) {
						if (result) {
							biz.getList();// 更新页面
							JqdeBox.message(true, result.message);
						} else {
							JqdeBox.message(false, result.message);
						}
					});
				}
			});
		},
		// 删除选中
		delSelected : function() {
			JqdeBox.confirm('您确定要删除监控阈值吗？', function(result) {
				if (result) {
					JqdeMods.ajax('simThresholdAction', 'delete',  {"ids" : vm.ids}).then(function(result) {
						if (result) {
							biz.getList();// 更新页面
							JqdeBox.message(true, result.message);
						} else {
							JqdeBox.message(false, result.message);
						}
					});
				}
			});
		},
		// 验证表单
		setValid : function() {
			$(vmEdit.formId).validate({
				errorElement : 'div',
				errorClass : 'help-block',
				focusInvalid : true,
				ignore : "",
				rules : {
					name : {required : true},
				},
				messages : {
					name : {required : "名称不能为空"},
				},
				highlight : function(e) {
					$(e).closest('.form-group').removeClass('has-info').addClass('has-error');
				},
				success : function(e) {
					$(e).closest('.form-group').removeClass('has-error');//.addClass('has-info');
					$(e).remove();
				},
				errorPlacement : function(error, element) {
					error.insertAfter(element);
				}
			});
		},
}