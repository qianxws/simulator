var biz={
		//列表
		getList:function (page) {
			vmCheckUtil.clearChecked();
			JqdeBox.loading();
			page = page || 1;
			var rows = $('#pageSelect').val();
			JqdeMods.ajax('companyAction', 'getList', {
				'page' : page,
				'rows' : rows,
				'name' : vm.model.name,
				'provinceId' :vm.model.provinceId,
				'cityId' :vm.model.cityId,
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
				title : '添加公司',
				url : 'modules/company/edit.html',
				init : function() {
					vmEdit.init();
				},
				confirm : function() { 
					if ($(vmEdit.formId).valid()) {
						JqdeMods.ajax('companyAction', 'insert', {dataItem : vmEdit.model}).then(function(result) {
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
				title : '修改<b class="green">[' + item.name + ']</b>公司',
				url : 'modules/company/edit.html',
				init : function() {
					vmEdit.model = $.extend(vmEdit.model, item);
	                vmEdit.init();
				},
				confirm : function() {
					if ($(vmEdit.formId).valid()) {
						JqdeMods.ajax('companyAction', 'update', {dataItem : vmEdit.model}).then(function(result) {
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
			JqdeBox.confirm('您确定要删除公司[<b class="green">' + item.name + '</b>] 吗？',function(result) {
				if (result) {
					JqdeMods.ajax('companyAction', 'delete', {"ids" : [ item.id ]}).then(function(result) {
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
			JqdeBox.confirm('您确定要删除公司吗？', function(result) {
				if (result) {
					JqdeMods.ajax('companyAction', 'delete',  {"ids" : vm.ids}).then(function(result) {
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
		//省下拉选项
		getProvinceOptions : function(options) {
			JqdeMods.ajax('areaAction', 'getProvinceOptions').then(function (result) {
				if (result) {
					options =$.extend(options,{'provinceId':result.list});
				}
	        });
		},
		//市下拉选项
		getCityOptions : function(options,provinceId) {
			JqdeMods.ajax('areaAction', 'getCityOptions',{
				'provinceId' :provinceId
			}).then(function (result) {
				if (result) {
					options =$.extend(options,{'cityId':result.list});
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
					domain : {required : true},
				},
				messages : {
					name : {required : "名称不能为空"},
					domain : {required : "域名不能为空"},
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