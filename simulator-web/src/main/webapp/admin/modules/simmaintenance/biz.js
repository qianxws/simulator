var biz={
		//列表
		getList:function (page) {
			vmCheckUtil.clearChecked();
			JqdeBox.loading();
			page = page || 1;
			var rows = $('#pageSelect').val();
			JqdeMods.ajax('simMaintenanceAction', 'getList', {
				'page' : page,
				'rows' : rows,
				'name' : vm.model.name,
				'simulatorId' :vm.model.nodeId,
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
				title : '添加维护保养',
				url : 'modules/simmaintenance/edit.html',
				init : function() {
					vmEdit.init();
				},
				confirm : function() { 
					if ($(vmEdit.formId).valid()) {
						JqdeMods.ajax('simMaintenanceAction', 'insert', {dataItem : vmEdit.model}).then(function(result) {
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
				title : '修改<b class="green">[' + item.name + ']</b>维护保养',
				url : 'modules/simmaintenance/edit.html',
				init : function() {
					vmEdit.model = $.extend(vmEdit.model, item);
	                vmEdit.init();
				},
				confirm : function() {
					if ($(vmEdit.formId).valid()) {
						JqdeMods.ajax('simMaintenanceAction', 'update', {dataItem : vmEdit.model}).then(function(result) {
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
			JqdeBox.confirm('您确定要删除维护保养[<b class="green">' + item.name + '</b>] 吗？',function(result) {
				if (result) {
					JqdeMods.ajax('simMaintenanceAction', 'delete', {"ids" : [ item.maintenanceId ]}).then(function(result) {
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
			JqdeBox.confirm('您确定要删除维护保养吗？', function(result) {
				if (result) {
					JqdeMods.ajax('simMaintenanceAction', 'delete',  {"ids" : vm.ids}).then(function(result) {
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