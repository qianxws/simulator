var linkVmEdit = {
	item : {}, ajaxPramas : {},
	mounted : function() { // 初始化执行
		//验证表单
		$('#validation').validate({
			errorElement : 'div',
			errorClass : 'help-block',
			focusInvalid : true,
			ignore : "",
			rules : {
				name : {required : true},
				phone : {required: true},
				address: {required: true},
				position: {required: true}
			},
			messages : {
				name : {required : "姓名不能为空"},
				phone: {required: "电话不能为空"},
				address: {required: "地址不能为空"},
				position: {required: "职务不能为空"}
			},
			highlight : function(e) {
				$(e).closest('.form-group').removeClass('has-info').addClass('has-error');
			},
			success : function(e) {
				$(e).closest('.form-group').removeClass('has-error');
				$(e).remove();
			},
			errorPlacement : function(error, element) {
				error.insertAfter(element);
			}
		});
	},
	// 验证表单
	valid : function() {
		this.updateAjaxPramas();
		return $('#validation').valid();
	},
	// 更新ajaxPramas
	updateAjaxPramas : function() {
		// 自动将form表单封装成json
		var data = $("#validation").serializeObject();
		this.item = $.extend({}, data);
		this.ajaxPramas = {
			dataItem : this.item,
		};
	}
}; 