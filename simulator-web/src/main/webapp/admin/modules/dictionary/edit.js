var vmEdit = {
    item: {},
    ajaxPramas: {},
    // 初始化执行
    mounted: function () {
        $('#validation-form').validate({
            errorElement: 'div',
            errorClass: 'help-block',
            focusInvalid: true,
            ignore: "",
            rules: {
            	name    :  { required : true , maxlength : 20},
				note : { required : true , maxlength : 150},
				pname : { required : true },
				parentId : { required : true },
				state : { required : true }		
            },
            messages: {
            	name : {required : "字典名称不能为空", maxlength : "字典名称过长"},
				note : { required : "描述不能为空", maxlength : "描述过长"},						
				parentId : { required : "上级节点不能为空" },
				state : { required : "状态不能为空" }	
            },
            highlight: function (e) {
                $(e).closest('.form-group').removeClass('has-info').addClass('has-error');
            },
            success: function (e) {
                $(e).closest('.form-group').removeClass('has-error');//.addClass('has-info');
                $(e).remove();
            },
            errorPlacement: function (error, element) {
                error.insertAfter(element);
            }
        });
        
  	  //获得所有一级菜单
        JqdeMods.ajax('dictionaryAction', 'getPauth', {}).then(function(result) {
        	var dic_html = '<option value="0">根节点</option>';
			if (result) {
				for (var i in result){
					dic_html += '<option value="' + result[i].id + '">' + result[i].name + '</option>';
				}
			}
			$('#parentId').html(dic_html);
			if (vmEdit.item && vmEdit.item.parentId){
				$('#parentId').val(vmEdit.item.parentId);
			}
		});
        if (vmEdit.item) {
        	$('#validation-form [name="name"]').val(vmEdit.item.name);
        	$('#validation-form [name="note"]').val(vmEdit.item.note);	        	       	
        	if (vmEdit.item.state == '1'){
        		$('#validation-form .state-true').click();
        	}else if (vmEdit.item.state == '0') {
        		$('#validation-form .state-false').click();
        	}
        	
        }
    },
    valid: function () {
        this.updateAjaxPramas();
        return $('#validation-form').valid();
    },
	// 更新ajaxPramas
	updateAjaxPramas : function() {
		// 自动将form表单封装成json
		var data = $("#validation-form").serializeObject();
		this.item = $.extend({}, this.item, data);			
		this.ajaxPramas = {
			dataItem : this.item
		};
	}
};
