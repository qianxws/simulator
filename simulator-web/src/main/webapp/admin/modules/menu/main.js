
var vm = new Vue({
	el : '#vmModule',
	data : {
		ids : [],
		menuList : [],
		selectedMenu : {},//被选中的菜单
	},
	methods : {
		mounted : function() {
			this.fetchData();
			//隐藏右键菜单
			$("body").bind("mousedown", function(event) {
				if (!(event.target.id == "rMenu" || $(event.target).parents("#rMenu").length>0)) {
					$('#rMenu').css({"visibility" : "hidden"});
				}
			});
		},
		fetchData : function() {
			var html_ = "";
			JqdeMods.ajax('menuAction', 'getAllMenu', {}).then(function(result) {
				vm.menuList = result;
			});
		},
		
		//更新菜单
		updateMenu : function() {
			var menuid = this.selectedMenu.menuid;
			var is_valid = $('#form-horizontal').valid();
			if (is_valid){
				var form = $('#form-horizontal');
				var dataItem = {
					menuid : menuid,
					name : form.find('[name="name"]').val(),
					code : form.find('[name="code"]').val(),
					url : form.find('[name="url"]').val(),
					enabled : form.find('[name="enabled"]').val()
				};
				vm.selectedMenu = $.extend(vm.selectedMenu, dataItem);
				
				JqdeMods.ajax('menuAction', 'editMenu', {'dataItem' : dataItem}).then(function(result) {
					if (result && result.success){
						JqdeBox.message(true, '修改成功！');
						initTree()
					} else {
						JqdeBox.message(false, result.message);
					}
					vm.fetchData();
				});
			}
		},
		addMenu : function(pid) {
			JqdeBox.dialog({
				title : '添加菜单',
				url : 'modules/menu/edit.html',
				init : function() {
	            	// 用户权限的初始化操作
	                vmEdit.mounted();
				},
				confirm : function() { // 确认事件
					if (vmEdit.valid()) {
						//vmEdit.ajaxPramas.dataItem['pid'] = pid;
						JqdeMods.ajax('menuAction', 'addMenu', vmEdit.ajaxPramas).then(function(result) {
							if (result && result.success){
								JqdeBox.message(true, '添加成功！');
							} else {
								JqdeBox.message(false, result.message);
							}
							
							// 实时刷新树
							var data_tree = $.fn.zTree.getZTreeObj('treeDemo');
							var data_node = data_tree.getNodeByParam('menuid', pid);
							data_tree.reAsyncChildNodes(data_node, "refresh", false);
							
							vm.fetchData();
							$("#rMenu").hide();
						});
						return true;
					}else {
						$("#rMenu").hide();
						return false;
					}
				}
			});
		},
		editMenu : function(nodeId) {
			
			JqdeBox.dialog({
				title : '添加菜单',
				url : 'modules/menu/edit.html',
				init : function() {
					// 用户权限的初始化操作
					vmEdit.mounted();
					JqdeMods.ajax('menuAction', 'getMenusByid', {'menuid' : nodeId}).then(function(result) {
						if (result !=null){
//							vmEdit.item=result;
							$('#name').val(result[0].name);
							$('#code').val(result[0].code);
							$('#url').val(result[0].url);
							$('#menuid').val(result[0].menuid);
							if(result[0].enabled==1){
								$('input[name="enabled"][value=1]').prop("checked",true);
							}else{
								$('input[name="enabled"][value=0]').prop("checked",true);
							}
						} else {
							JqdeBox.message(false, result.message);
						}
						vm.fetchData();
						initTree();
					});
				},
				confirm : function() { // 确认事件
					if (vmEdit.valid()) {
						var dataItem = {
								name : $('#name').val(),
								code : $('#code').val(),
								url : $('#url').val(),
								enabled : $('input[name="enabled"]:checked').val(),
								menuid : $('#menuid').val(),
							};
							JqdeMods.ajax('menuAction', 'editMenu', {'dataItem' : dataItem}).then(function(result) {
								if (result && result.success){
									JqdeBox.message(true, '修改成功！');
									initTree()
								} else {
									JqdeBox.message(false, result.message);
								}
								vm.fetchData();
								initTree();
							});
							return true;
					}else{
						return false;
					}
					
				}
			});
		},
		//选择菜单
		chooseMenu : function(menu) {
			this.selectedMenu = menu;
			//选中样式
			$('#dd-list').find('.active.dd2-content').removeClass('active');
			$('#menu_' + menu.menuid + '>.dd2-content').addClass('active');
		},
		//上移
		removeUp : function(id, pid) {
			var this_menu = $('#menu_' + id);
			if (this_menu.prev()){
				this_menu.prev().before(this_menu);
			}
			//保存排序
			this.saveCseq(pid);
		},
		//下移
		removeDown : function(id, pid) {
			var this_menu = $('#menu_' + id);
			if (this_menu.next()){
				this_menu.next().after(this_menu);
			}
			//保存排序
			this.saveCseq(pid);
		},
		//保存排序
		saveCseq : function(pid) {
			//debugger
			var cseq_array = [];
			if (pid == 0) {
				//一级菜单
				$('#dd-list').find('.p-item').each(function(i, v) {
					cseq_array.push({
						id : v.id.split('_')[1],
						cseq : i
					});
				});
			}else {
				//二级菜单
				$('#menu_' + pid).find('.c-item').each(function(i, v) {
					cseq_array.push({
						id : v.id.split('_')[1],
						cseq : i
					});
				});
			}
			JqdeMods.ajax('menuAction', 'updateCseq', cseq_array);
		},

		//删除菜单
		deleteMenu : function(id,pid) {
			if(id==0){
				JqdeBox.message(false, '根节点不可删除！');
				return ;
			}
			JqdeBox.confirm('您是否确定删除菜单，以及子菜单！', function(result) {
				if (result){
					JqdeMods.ajax('menuAction', 'deleteMenu', {'menuid' : id}).then(function(result) {
						if (result && result.success){
							JqdeBox.message(true, '删除成功！');
						} else {
							JqdeBox.message(false, result.message);
						}
						
						// 实时刷新树
						/*var data_tree = $.fn.zTree.getZTreeObj('treeDemo');
						var data_node = data_tree.getNodeByParam('menuid', pid);
						data_tree.reAsyncChildNodes(data_node, "refresh", false);*/
						
						initTree();
						
						vm.fetchData();
						$("#rMenu").hide();
					});
				}
			});
		}
	}
});

//折叠展开树
function fold(this_) {
	var this_ = $(this_);
	//是否展开
	if (this_.find('.fa-plus').is(':visible')){
		//折叠状态
		this_.find('.fa-plus').hide();
		this_.find('.fa-minus').show();
	}else {
		//展开状态
		this_.find('.fa-plus').show();
		this_.find('.fa-minus').hide();
	}
	this_.closest('li').find('.dd-list').slideToggle();
}

$(function() {
	
	vm.mounted();

	//选中第一个菜单
	setTimeout(function() {
		vm.chooseMenu(vm.menuList[0]);
	}, 500);
	
	$('.action-buttons a').click(function(event) {
		event.stopPropagation();
	});
	
	$('#form-horizontal').validate({
		errorElement : 'div',
		errorClass : 'help-block',
		focusInvalid : true,
		ignore : "",
		rules : {
			name : {
				required : true,
				remote: {//验证菜单是否存在
	                type:"post",
	                url:"commMods/ajax?action=menuAction&verb=isNotExist&token="+token,
	                data : {
	                	menuid : function() {
	                		return $('#menuid').val()
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
});
