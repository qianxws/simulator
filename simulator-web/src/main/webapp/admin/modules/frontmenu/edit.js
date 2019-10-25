var usertoken = getToken();
var ztreeNodes = [];
var vmEdit = {
	item : {}, 
	ajaxPramas : {},
	mounted : function() { // 初始化执行
		$('#validation-form').validate({
			errorElement : 'div',
			errorClass : 'help-block',
			focusInvalid : true,
			ignore : "",
			rules : {
				name : {
					required : true,
					remote: {//验证菜单是否存在
		                type:"post",
		                url:"commMods/ajax?action=frontMenuAction&verb=isNotExist&token="+usertoken,
		                data : {
		                	menuid : function() {
		                		return ""
							}
		                }
		            } 
				},
				code : {required : true},
				url : {required : true}
			},
			messages : {
				name : {required : "名称不能为空", remote:"菜单已存在"},
				code : {required : "编码不能为空"},
				url : {required : "url不能为空"}
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
		
		//获得所有一级菜单
        JqdeMods.ajax('frontMenuAction', 'getAllMenu', {}).then(function(result) {
        	var auth_html = '<option value="0">根节点</option>';
			if (result) {
				for (var i in result){
					auth_html += '<option value="' + result[i].menuid + '">' + result[i].name + '</option>';
				}
			}
			$('#pid').html(auth_html);
			if (vmEdit.item && vmEdit.item.parentId){
				$('#pid').val(vmEdit.item.parentId);
			}
		});
	},
	// 验证表单
	valid : function() {
		this.updateAjaxPramas();
		return $('#validation-form').valid();
	},
	// 更新ajaxPramas
	updateAjaxPramas : function() {
		// 更新提交表单参数
		// 自动将form表单封装成json
		var data = $("#validation-form").serializeObject();
		this.item = $.extend({}, this.item, data);
		this.ajaxPramas = {
			dataItem : this.item
		};
	}
};