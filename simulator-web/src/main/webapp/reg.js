var vm = avalon.define({
    $id: "vmLogin",
    formId:'#loginForm',
	model : {},
	options:{},
	init : function() {
		this.model =$.extend($(this.formId).serializeObject(), this.model);
		this.options =$.extend($(this.formId).serializeOptions(), this.options);
		avalon.scan(document.getElementById(this.$id));//重新扫描新加入的dom
		
		biz.setValid();
		biz.getProvinceOptions(this.options);
		if(isNotBlank(this.model.provinceId)){
			biz.getCityOptions(this.options,this.model.provinceId);
		}
	},
	onProvinceChanged : function() {
		biz.getCityOptions(this.options,this.model.provinceId);
	},
	onCityChanged : function() {
		this.model.areaId=this.model.areaId;
	},
	add : function() {
		biz.add();

	},
})


var biz={
		// 添加
		add : function() {
		 if ($('#loginForm').valid()) {
    		var model=vm.model;
    		model={dataItem:model};
	    	var gotourl=$('#gotourl').val();
	    	if(typeof gotourl=='undefined'){gotourl='';}
	        $.ajax({
	            type: 'post',
	            url :gotourl+'public/reg',
	            data: {
	            	'ajaxParams': JSON.stringify(model)
	            },
	            dataType : 'json',
	            success: function (result) {
	            	var message = result.message;
	            	if (result && result.success){
	                	alert('注册成功');
	                	window.location.href =gotourl+ 'login.html';
	                } else {
	                    alert(result.message);
	                }
	            },
	            error: function (err) {
	                console.log(err);
	                alert("注册失败，请稍后再试！");
	            }
	        });
    		return true;
    	}else {
    		return false;
    	}
			
			
//			if ($(vm.formId).valid()) {
//				JqdeMods.ajax('myCompanyAction', 'update', {dataItem : vmEdit.model}).then(function(result) {
//					if (result.success) {
//						biz.getDetail();// 更新页面
//						JqdeBox.message(true, result.message);
//					} else {
//						JqdeBox.message(false, result.message);
//					}
//				});
//				return true;
//			}
//			return false;
		},

		//省下拉选项
		getProvinceOptions : function(options) {
	    	var gotourl=$('#gotourl').val();
	    	if(typeof gotourl=='undefined'){gotourl='';}
	        $.ajax({
	            type: 'post',
	            url :gotourl+'public/getProvinceOptions',
	            data: {},
	            dataType : 'json',
	            success: function (result) {
					if (result) {
						options.provinceId = result.list;
					}
	            }
	        });
//			JqdeMods.ajax('areaAction', 'getProvinceOptions').then(function (result) {
//				if (result) {
//					options.provinceId = result.list;
//				}
//	        });
		},
		//市下拉选项
		getCityOptions : function(options,provinceId) {
	    	var gotourl=$('#gotourl').val();
	    	if(typeof gotourl=='undefined'){gotourl='';}
	        $.ajax({
	            type: 'post',
	            url :gotourl+'public/getCityOptions',
	            data: {'ajaxParams':JSON.stringify({'provinceId' :provinceId})},
	            dataType : 'json',
	            success: function (result) {
					if (result) {
						options.areaId = result.list;
					}
	            }
	        });
//			JqdeMods.ajax('areaAction', 'getCityOptions',{
//				'provinceId' :provinceId
//			}).then(function (result) {
//				if (result) {
//					options.areaId = result.list;
//				}
//	        });
		},
		// 验证表单
		setValid : function() {
			var gotourl=$('#gotourl').val();
			if(typeof gotourl=='undefined'){gotourl='';}
			jQuery.validator.addMethod("isUserId", function(value, element) {  
				 var isUserId =/^[a-zA-Z][a-zA-Z0-9_]*$/;
				 return this.optional(element) || (isUserId.test(value) && value.length>=3 && value.length<=24);    
				}, "请输入以字母开头的3-24位字母、数字、下划线的组合");
			
			jQuery.validator.addMethod("isPassword", function(value, element) {  
				 var isPassword =/^(?:(?=.*[A-Za-z])(?=.*[0-9])|(?=.*[A-Za-z])(?=.*[^A-Za-z0-9])|(?=.*[0-9])(?=.*[^A-Za-z0-9])).{6,20}$/;
				 return this.optional(element) || (isPassword.test(value));  
				}, "请输入6-20位字母、数字或标点符号的组合");
			
			jQuery.validator.addMethod("isSame", function(value, element) {  
				 return this.optional(element) || (value==vm.model.password);  
				}, "两次输入的密码不一致，请重试"); 
			
			jQuery.validator.addMethod("isMobile", function(value, element) {  
				 var mobile = /^(13[0-9]{9})|(18[0-9]{9})|(14[0-9]{9})|(17[0-9]{9})|(15[0-9]{9})$/;  
				 return this.optional(element) || (value.length == 11 && mobile.test(value));  
				}, "请正确填写手机号码"); 
				
			jQuery.validator.addMethod("isQQ", function(value, element) {  
				var checkQQ = /^([1-9][0-9]{4,19})$/;  
				 return this.optional(element) || (checkQQ.test(value));  
				}, "请正确填写qq号码"); 
			
			jQuery.validator.addMethod("isEmail", function(value, element) {  
				var isEmail = /^[a-z0-9]+@([a-z0-9]+\.)+[a-z]{2,4}$/i; 
				 return this.optional(element) || (isEmail.test(value));  
				}, "请正确填写邮箱"); 

			
			$('#loginForm').validate({
				errorElement : 'div',
				errorClass : 'help-block',
				focusInvalid : true,
				ignore : "",
				rules : {
					id : {required : true,isUserId:true,remote : {
						type:"post",
			            url:gotourl+"public/notExistUserId",
			            data : {
			            	userId : function (){return $('#id').val();}
			            }
					}},
					password : {required : true,isPassword:true},
					password2 : {required : true,isSame:true},
					name : {required : true},
					phone : {required : true,isMobile : true },
					companyName : {required : true},
				},
				messages : {
					id : {required : "用户名不能为空", remote : "用户名已存在"},
					password : {required : "密码不能为空"},
					password2 : {required : "密码不能为空"},
					name : {required : "真实姓名不能为空"},
					phone : {required : "手机号不能为空"},
					qq : {required : "qq号不能为空"},
					email : {required : "邮箱不能为空"},
					companyName : {required : "公司名称不能为空"},
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

vm.init()


//$(function() {
//	biz.setValid();
//    $('#btnReg').on('click', function() {
//    	if ($('#loginForm').valid()) {
//    		var model=$('#loginForm').serializeObject();
//    		model={dataItem:model};
//	    	var gotourl=$('#gotourl').val();
//	    	if(typeof gotourl=='undefined'){gotourl='';}
//	        $.ajax({
//	            type: 'post',
//	            url :gotourl+'public/reg',
//	            data: {
//	            	'ajaxParams': JSON.stringify(model)
//	            },
//	            dataType : 'json',
//	            success: function (result) {
//	            	var message = result.message;
//	            	if (result && result.success){
//	                	alert('注册成功');
//	                	window.location.href =gotourl+ 'login.html';
//	                } else {
//	                    alert(result.message);
//	                }
//	            },
//	            error: function (err) {
//	                console.log(err);
//	                alert("登录失败，请稍后再试！");
//	            }
//	        });
//    		return true;
//    	}else {
//    		return false;
//    	}
//    });
//    $('input').on('keyup', function() {
//        $(this).parent().removeClass('error');
//    });
//
//    $(document).on('keyup', function(event) {
//        if (event.keyCode == "13") {
//            //回车执行查询
//            $('#btn').click();
//        }
//    });
//   //保存cookies
//    function setCookies(key, value, hour) {
//    	var time = new Date();
//    	time.setTime(time.getTime() + hour * 60 * 60 * 1000);
//    	document.cookie = key + '=' + value + ";path=/;expires=" + time.toGMTString();
//    }
//});
