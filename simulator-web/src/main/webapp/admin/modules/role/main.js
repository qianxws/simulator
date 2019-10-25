
var vm = new Vue({
	el : '#vmModule',
	data : {
		tbodyData : [],
		ids : []
	},
	methods : {
		mounted : function() {
			 // 初始化分页
			htmlPage("pageInfo", 1, 0, 'vm.fetchData', Config.rows);
	        this.fetchData(1);

	        // check all
	        var $table = $('#dynamic-table');
	        $table.on('click', 'th input[type=checkbox]', function () {
	            var th_checked = this.checked;
	            $table.find('td input[type=checkbox]').each(function () {
	                this.checked = th_checked;
	            });
	            vm.checkChanged();
	        });
		},
		//加载页面数据
		fetchData : function(page) {
			$('#dynamic-table').find('input[type=checkbox]:checked').removeAttr('checked');
			page = page || $('#currentPage').val();
			var rows = $('#pageSelect').val();
			JqdeBox.loading();
			JqdeMods.ajax('roleAction', 'getRolePage', {
				name : $('#search-name').val(),
				startTime : $('#startTime').val(),
				endTime : $('#endTime').val(),
				repStatus : $('#repStatus').val(),
				page : page,
				rows : rows
			}).then(function (result) {
				JqdeBox.unloading();
				if (result.success){
					vm.tbodyData = result.rows;
					htmlPage("pageInfo", page, result.total, 'vm.fetchData', rows);
				}else {
					JqdeBox.message(false, result.message);
				}
			});
		},
		deleteRole : function(item) {
			JqdeBox.confirm('您确定要删除角色[<b class="green">' + item.name + '</b>] 吗？', function(result) {
				if (result) {
					// 后台交互
					JqdeMods.ajax('roleAction', 'deleteRole', {"ids" : [ item.id ]}).then(function(result) {
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
		removeSelected : function() {
			var ids = this.ids;
			JqdeBox.confirm('您确定要删除吗？', function(result) {
				if (result) {
					// 后台交互
					JqdeMods.ajax('roleAction', 'deleteRole', {"ids" : ids}).then(function(result) {
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
		//选中改变
	    checkChanged: function () {
	        var ids = [];
	        $('#dynamic-table').find('input[type=checkbox]').each(function () {
	            if (this.checked) {
	                ids.push(this.value);
	            }
	        });
	        this.ids = ids;
	    },
	    addRole : function() {
	    	window.location.href =  '#/role/edit.html'
	    },
	    editRole : function(item) {
	    	window.location.href =  '#/role/edit.html?id=' + item.id;
	    }
	}
});

vm.mounted();
