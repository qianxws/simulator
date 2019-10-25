var biz={
	//初始化tree_table列表
    getTreeList: function(){
    	vmTree.init();
    },
	//添加
	add : function() {
		JqdeBox.dialog({
			title : '新增权限',
			url : 'modules/auth2/edit.html',
			init : function() {
				vmEdit.init();
			},
			confirm : function() { // 确认事件
				if ($(vmEdit.formId).valid()) {
					JqdeMods.ajax('authAction', 'addAuth', {dataItem : vmEdit.model}).then(function(result) {
						if (result.success) {
//							window.location.reload();
							biz.getTreeList();
							JqdeBox.message(true, '新增成功！');
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
	//编辑
	edit : function(item) {
		JqdeBox.dialog({
			title : '修改权限',
			url : 'modules/auth2/edit.html',
			init : function() {
				item=eval("(" + decodeURIComponent(item) + ")");
				vmEdit.model = $.extend(vmEdit.model, item);
				vmEdit.model.parentId=vmEdit.model.pId;
                vmEdit.init();
				setTimeout(function(){
					$('#pname').val(vmEdit.model.pname);
					$("#parentId").val(vmEdit.model.pId);
					//指定选中ID的节点  
					var zTree_Menu = $.fn.zTree.getZTreeObj("authsTree");
				    var node = zTree_Menu.getNodeByParam("id",  vmEdit.model.pId==0?-1:vmEdit.model.pId); 
				    zTree_Menu.selectNode(node);
				}, 100);
			},
			confirm : function() {
				if ($(vmEdit.formId).valid()) {
					JqdeMods.ajax('authAction', 'updateAuth',{dataItem : vmEdit.model}).then(function(result) {
						if (result.success) {
							biz.getTreeList();
							JqdeBox.message(true, '修改成功！');
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
	//删除
	del : function(authId,name,isParent) {
		JqdeBox.confirm('您确定要删除[<b class="green">' + name + '</b>]吗？', function(result) {
			if (result) {
				JqdeMods.ajax('authAction', 'removeAuth', {
					"ids" : [authId],
					"isParent" :isParent
				   }).then(function(result) {
					if (result.success) {
						vm.ids = [];
						biz.getTreeList();
						JqdeBox.message(true, '删除成功！');
					} else {
						JqdeBox.message(false, result.message);
					}
				});
			}
		});
	},
	//删除选中
	delSelected : function() {
		var ids = vm.ids;
		JqdeBox.confirm('您确定要删除选中权限吗？', function(result) {
			if (result) {
				JqdeMods.ajax('authAction', 'removeAuth', {"ids" : ids}).then(function(result) {
					if (result.success) {
                    	biz.getList();// 更新页面
						JqdeBox.message(true, '删除成功！');
					} else {
						JqdeBox.message(false, result.message);
					}
				});
			}
		});
	},
	delSelectedZtree : function() {
		var ids = vm.ids;
		var pName = vm.pName;
		var isParent = vm.isParent;
		var delAll = true;
		JqdeBox.confirm('您确定要删除'+pName+'权限吗？', function(result) {
			if (result) {
				JqdeMods.ajax('authAction', 'removeAuth', {"ids" : ids , "isParent":isParent,"delAll":delAll}).then(function(result) {
					if (result.success) {
						//刷新树
						biz.getTreeList();
						vm.ids = [];
						vm.pName = [];
						vm.isParent = [];
						JqdeBox.message(true, '删除成功！');
					} else {
						JqdeBox.message(false, result.message);
					}
				});
			}
		});
	},
	// 验证表单
	setValid : function() {
        $('#validation-form').validate({
            errorElement: 'div',
            errorClass: 'help-block',
            focusInvalid: true,
            ignore: "",
            rules: {
            	name : {
					required : true,
					remote: {//验证权限是否存在
		                type:"post",
		                url:Config.apiPath+"commMods/ajax?action=authAction&verb=isNotExist&token="+token,
		                data : {
		                	authId : function() {
		                		return vmEdit.model.authId
							}
		                }
		            } 
				},
                code : {required: true},
            	parentId: {required: true}
            },
            messages: {
                name : {required: "权限名称不能为空", remote:"权限已存在"},
                code : {required: "权限编码不能为空"},
                parentId: {required: "上级节点不能为空"}
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
	},
}
