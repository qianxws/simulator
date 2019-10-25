var vmEdit = new Vue({
	el : '#vmEdit',
	data : {
		item : {}
	},
	methods : {
		init : function() { // 初始化执行
			vmEdit.setValid();
		},
		// 验证表单设置
		setValid : function() {
			$.validator.addMethod('isTel', function(value, element) {
				var regTel = /^\d+$/;
				return regTel.test(value);
			});
			$.validator.addMethod('isEmail', function(value,element){
				var regEmail = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
				return regEmail.test(value);
			});
			
			$(vmEditUtil.divForm).validate({
				errorElement : 'div',
				errorClass : 'help-block',
				focusInvalid : true,
				ignore : "",
				rules : {
					name : {required : true, maxlength : 50, remote : {
						type:"post",
		                url:"commMods/ajax?action=companyAction&verb=isNotExist&token="+token,
		                data : {
		                	companyId : function() {return vmEdit.item.companyId;}
		                }
					}},
					corporation : { required : true , maxlength : 10},
					contact : { required : true , maxlength : 10},
					tel : {required : true, isTel : true, maxlength : 11},
					email : { required : true, isEmail : true, maxlength : 50 },
					address : { required : true , maxlength : 100}
				},
				messages : {
					name : {required : "院线名称不能为空", maxlength : "院线名称过长", remote:"院线名称已存在"},
					corporation : { required : "法人不能为空", maxlength : "法人名称过长"},
					contact : { required : "联系人不能为空" ,maxlength:"联系人名称过长"},
					tel : {required : '电话不能为空', isTel : "电话格式不正确", maxlength:"电话名称过长"},
					email : { required : "邮件不能为空" ,email: "请填入正确的邮箱",isEmail:'邮件格式不正确', maxlength:"邮件名称过长" },
					address : { required : "地址不能为空", maxlength:"地址名称过长" }
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
		}
	}
});
