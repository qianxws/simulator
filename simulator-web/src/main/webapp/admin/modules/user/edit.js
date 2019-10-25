var vmEdit = new Vue({
	el : '#vmEdit',
	data : {
		ajaxPramas : {},
		item : {},
		roleList : []
	},
	methods : {
		mounted : function(){
			//获得全部角色
			this.getAllRole();
			
			$('#validation-form').validate({
				errorElement : 'div',
				errorClass : 'help-block',
				focusInvalid : true,
				ignore : "",
				rules : {
					id : { 
						required : true,
						remote: {//验证权限是否存在
			                type:"post",
			                url:Config.apiPath+"commMods/ajax?action=userAction&verb=isNotExist&token="+token
			            } 
					},
					password : {
						required : function() {
							if (vmEdit.item.id) {
								return false;
							}
							return true;
						}
					},
					name : { required : true }
				},
				messages : {
					id : { required : "用户名不能为空", remote:"用户名已经被注册"},
					password : { required : "密码不能为空" },
					name : { required : "姓名不能为空" }
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
		//获得全部权限
		getAllRole : function() {
			JqdeMods.ajax('roleAction', 'getAllRole', {
				userId : this.item.id
			}).then(function (result) {
				if (result.success){
					vmEdit.roleList = result.roleList;
					setTimeout(function(){
						var userRole = result.userRole;
						for (var i in userRole){
							$('#duallist').find('option[value="' + userRole[i].roleId + '"]').attr('selected', true);
						}
						
						$('select[name="duallistbox_demo1"]').bootstrapDualListbox({
					 		infoTextFiltered: '',
					 		selectorMinimalHeight : 200,
					 		infoText : '',
					 		filterTextClear : '显示全部',
					 		filterPlaceHolder : '搜索',
					 		infoTextEmpty : '',
					 		showFilterInputs : false
						});
					}, 500);
				}
			});
		},
		valid : function() {
			this.updateAjaxPramas();
			return $('#validation-form').valid();
		},
		updateAjaxPramas : function() {
			var data = $("#validation-form").serializeObject();
			this.ajaxPramas['dataItem'] = data;
			var roleArray = []
			$('#bootstrap-duallistbox-selected-list_duallistbox_demo1').find('option').each(function(i, v){
				roleArray.push($(v).val());
			});
			this.ajaxPramas['role'] = roleArray;
		}
	}
});