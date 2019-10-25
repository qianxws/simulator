
var vm = new Vue({
	el : '#vm',
	data : {
		ids : [],
		tbodyList : []
	},
	methods : {
		mounted : function() {
			var $this = this;
			// 初始化分页
			/*htmlPage("pageInfo", 1, 0, 'vm.fetchData', Config.rows);*/
			//初始化页码
			initHtmlPage("pageInfo",Config.rows);
			$('#keyWord').val('');
			this.fetchData();
			// check all
			var $table = $('#dynamic-table');
			$table.on('click', 'th input[type=checkbox]', function() {
				var th_checked = this.checked;
				$table.find('td input[type=checkbox]').each(function() {
					this.checked = th_checked;
				});
				$this.checkChanged();
			});
		},
		fetchData : function(page) {
			$('#dynamic-table').find('input[type=checkbox]:checked').removeAttr('checked');
			this.ids = [];
			/*currentPage = currentPage || $('#currentPage').val();*/
			page = page || $("#currentPage").val();
			var rows = $('#pageSelect').val();
			JqdeBox.loading();
			JqdeMods.ajax('dictionaryAction', 'getDictionarys', {
				 rows : rows,
    			/*'page' : currentPage,*/
    			 page : page,
    			 name : $('#name_').val(),   			
			}).then(function(result) {
				if (result && result.success){					
					vm.tbodyList = result.list;
					htmlPage("pageInfo", page, result.total, 'vm.fetchData', rows);					
				} else {
					JqdeBox.message(false, result.message);
				}			
				var  name1=document.getElementById('name_').value;
				if(!(name1==''||name1==null)){									
					for(var i = 0; i<result.list.length;++i){
						var id = result.list[i].id;
						vm.fold(id);
					}					
					
				}				
			});					
			JqdeBox.unloading();
		},
		//选中改变
		checkChanged : function() {
			var ids = [];
			$('#dynamic-table').find('td input[type=checkbox]').each(function() {
				if (this.checked) {
					ids.push(this.value);
				}
			});
			this.ids = ids;
		},
		add : function() {
			JqdeBox.dialog({
				title : '新增字典',
				url : 'modules/dictionary/edit.html',
				init : function() {
	                vmEdit.mounted();
				},
				confirm : function() { // 确认事件
					if (vmEdit.valid()) {
						JqdeMods.ajax('dictionaryAction', 'add', vmEdit.ajaxPramas).then(function(result) {
							if (result.success) {
								vm.fetchData();// 更新页面
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
		edit : function(item) {
			JqdeBox.dialog({
				title : '修改字典',
				url : 'modules/dictionary/edit.html',
				init : function() {
					vmEdit.item = item;
	                vmEdit.mounted();
				},
				confirm : function() {
					if (vmEdit.valid()) {
						JqdeMods.ajax('dictionaryAction', 'update', vmEdit.ajaxPramas).then(function(result) {
							if (result.success) {
								vm.fetchData();// 更新页面
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
		del : function(item) {
			JqdeBox.confirm('您确定要删除[<b class="green">' + item.name + '</b>]吗？', function(result) {
				if (result) {
					JqdeMods.ajax('dictionaryAction', 'delete', {"ids" : [ item.id ]}).then(function(result) {
						if (result.success) {
							var currentPage = $('#currentPage').val();
							vm.fetchData();// 更新页面
							JqdeBox.message(true, '删除成功！');
						} else {
							JqdeBox.message(false, result.message);
						}
					});
				}
			});
		},
		//删除选中
		removeSelected : function() {
			var ids = this.ids;
			JqdeBox.confirm('您确定要删除选中权限吗？', function(result) {
				if (result) {
					JqdeMods.ajax('dictionaryAction', 'delete', {"ids" : ids}).then(function(result) {
						if (result.success) {
	                    	vm.fetchData();// 更新页面
							JqdeBox.message(true, '删除成功！');
						} else {
							JqdeBox.message(false, result.message);
						}
					});
				}
			});
		},
		fold : function(id) {
			var td = $('#td_' + id);
			//是否展开
			if (td.find('.fa-plus').is(':visible')){
				//折叠状态
				td.find('.fa-plus').hide();
				td.find('.fa-minus').show();
				$('.dic_' + id).show();
			}else {
				//展开状态
				td.find('.fa-plus').show();
				td.find('.fa-minus').hide();
				$('.dic_' + id).hide();
			}
		}		
	}
});

$(function() {
	vm.mounted();
});
