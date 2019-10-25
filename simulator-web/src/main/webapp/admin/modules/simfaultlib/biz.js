var biz={
		//列表
		getList:function (page) {
			vmCheckUtil.clearChecked();
			JqdeBox.loading();
			page = page || 1;
			var rows = $('#pageSelect').val();
			JqdeMods.ajax('simFaultLibAction', 'getList', {
				'page' : page,
				'rows' : rows,
				'typeId' : vm.selected,//vm.model.typeId,//
				'deviceName' : vm.model.deviceName,
				'faultName' : vm.model.faultName,
				'faultContent' : vm.model.faultContent,
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
				title : '添加故障库',
				url : 'modules/simfaultlib/edit.html',
				init : function() {
					vmEdit.init();
				},
				confirm : function() { 
					if ($(vmEdit.formId).valid()) {
						//赋值给下拉框 的model
						vmEdit.model.typeId=vmEdit.model.typeId;
						JqdeMods.ajax('simFaultLibAction', 'insert', {dataItem : vmEdit.model}).then(function(result) {
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
				title : '修改<b class="green">[' + item.deviceName + ']</b>故障库',
				url : 'modules/simfaultlib/edit.html',
				init : function() {
					JqdeMods.ajax('simFaultLibAction', 'getDetail',  {
						'faultLibId' : item.faultLibId,
					}).then(function(result) {
						if (result.success) {
							debugger
							vmEdit.model = $.extend(vmEdit.model, item);
			                vmEdit.init();
			                
			                //
						} else {
							JqdeBox.message(false, result.message);
						}
					});
				},
				confirm : function() {
					if ($(vmEdit.formId).valid()) {
						//赋值给下拉框 的model
						vmEdit.model.typeId=vmEdit.model.typeId;
						JqdeMods.ajax('simFaultLibAction', 'update', {dataItem : vmEdit.model}).then(function(result) {
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
			JqdeBox.confirm('您确定要删除故障库[<b class="green">' + item.name + '</b>] 吗？',function(result) {
				if (result) {
					JqdeMods.ajax('simFaultLibAction', 'delete', {"ids" : [ item.faultLibId ]}).then(function(result) {
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
			JqdeBox.confirm('您确定要删除故障库吗？', function(result) {
				if (result) {
					JqdeMods.ajax('simFaultLibAction', 'delete',  {"ids" : vm.ids}).then(function(result) {
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
			debugger
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
		//产品类型列表
		getSimTypeList:function () {
			//JqdeBox.loading();
			JqdeMods.ajax('simTypeAction', 'getList', {
				'page' : 1,
				'rows' : 15,
				'name' : "",
				'startTime' : "",
				'endTime' : ""
			}).then(function(result) {
				JqdeBox.unloading();
				if (result){
					
					vm.simTypeArray = result.list;
					//vmEdit.edit_simTypeArray=result.list;
				}else {
					JqdeBox.message(false, result.message);
				}
			});
		},
}