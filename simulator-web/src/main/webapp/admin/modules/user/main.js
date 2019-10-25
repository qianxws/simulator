var vm = new Vue({
	el : '#vmModule',
	data : {
		ids : [],
		tbodyData : []
	},
	methods : {
		 mounted: function () {
	        var $this = this;
	        // 初始化分页
			htmlPage("pageInfo", 1, 0, 'fetchData', Config.rows);
	        this.fetchData();

	        // check all
	        var $table = $('#dynamic-table');
	        $table.on('click', 'th input[type=checkbox]', function () {
	            var th_checked = this.checked;
	            $table.find('td input[type=checkbox]').each(function () {
	                this.checked = th_checked;
	            });
	            $this.checkChanged();
	        });
	    },
		// 抓取列表数据
	    fetchData: function (page) {
	    	$('#dynamic-table').find('input[type=checkbox]:checked').removeAttr('checked');
			this.ids = [];
	        JqdeBox.loading();
	        var currentPage = page || $('#currentPage').val();
	        var params = {
				'rows' : $('#pageSelect').val(),
				'page' : currentPage,
				'id': $('#id_').val(),
				'name': $('#trueName').val(),
				'repStatus': $('#repStatus').val(),
			};
	        JqdeMods.ajax('userAction', 'getAllUsers', params).then(function (result) {
	            JqdeBox.unloading();
	            if (result.success) {
	            	vm.tbodyData = result.rows;
	                htmlPage("pageInfo", currentPage, result.total, 'vm.fetchData');
	            } else {
	                JqdeBox.message(false, result.message);
	            }
	        });
	    },
	    // 选中改变
	    checkChanged: function () {
	        var ids = [];
	        $('#dynamic-table').find('td input[type=checkbox]').each(function () {
	            if (this.checked) {
	                ids.push(this.value);
	            }
	        });
	        this.ids = ids;
	    },
	    // 删除
	    remove: function (id, name) {
	        var $this = this;
	        JqdeBox.confirm('您确定要删除['+name+']吗？', function (result) {
	            if (result) {
	                // 后台交互
	                JqdeMods.ajax('userAction', 'delUser', {
	                	"ids": [id]
	                }).then(function (result) {
                        if (result.success) {
							vm.fetchData($('#currentPage').val());// 更新页面
	                        JqdeBox.message(true, result.message);
	                    } else {
	                    	JqdeBox.message(false, result.message);
	                    }
	                });
	            }
	        });
	    },
	    // 删除选中
	    removeSelected: function () {
	        JqdeBox.confirm('您确定要删除吗？', function (result) {
	            if (result) {
	                // 后台交互
	                JqdeMods.ajax('userAction', 'delUser', {"ids": vm.ids}).then(function (result) {
	                    if (result.success) {
	                    	var currentPage = $('#currentPage').val();
							vm.fetchData(currentPage);// 更新页面
	                        JqdeBox.message(true, result.message);
	                    } else {
	                    	JqdeBox.message(false, result.message);
	                    }
	                });
	            }
	        });
	    },
	    // 修改
	    edit: function (item, index) {
	    	var $this = this;
	        JqdeBox.dialog({
	            title: '修改用户',
	            url: 'modules/user/edit.html',
	            init: function () {
	        		vmEdit.item = $.extend({}, item);
	        		// 编辑时填充表单
	        		var f = $("#userVmEdit").find('form');
	        		for (var key in vmEdit.item) {
	        			if (key == "sex") {
	        				// 单独设置radio选中
	                    	$("input:radio[value='"+vmEdit.item.sex+"']").attr('checked',true);
	        			} else if (key == "enabled") {
	                    	// 单独设置checkbox选中
	        				$("input:radio[value='"+vmEdit.item.enabled+"']").attr('checked',true);
	        			} else {
	        				f.find('input[name='+key+']').val(vmEdit.item[key]);
	        			}
	        		}
	        		f.find("#password").val('');
	            	$("#item-id").html(vmEdit.item.id);
	                // 用户权限的初始化操作
	                vmEdit.mounted();
	            },
	            confirm: function () {
	                if (vmEdit.valid()) {
	                    // 后台交互
	                    JqdeMods.ajax('userAction', 'updateUser', vmEdit.ajaxPramas).then(function (result) {
	                        if (result.success) {
	                        	var currentPage = $('#currentPage').val();
								vm.fetchData(currentPage);// 更新页面
	                            JqdeBox.message(true, result.message);
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
	    // 添加
	    add: function () {
	        var $this = this;
	        JqdeBox.dialog({
	            title: '添加用户',
	            url: 'modules/user/edit.html',
	            init: function () {
	                // 单独设置radio选中
	            	$("input:radio[value='M']").attr('checked',true);
	            	// 单独设置checkbox选中
					$("input:radio[value='true']").attr('checked',true);
	            	// 初始化操作
	                vmEdit.mounted();
	            },
	            confirm: function () {
	            	if (vmEdit.valid()) {
	            		JqdeMods.ajax('userAction', 'addUser', vmEdit.ajaxPramas).then(function (result) {
	                        if (result.success) {
	                        	var currentPage = $('#currentPage').val();
								vm.fetchData(currentPage);// 更新页面
	                            JqdeBox.message(true, result.message);
	                        } else {
	                            JqdeBox.message(false, result.message);
	                        }
	                    });
	            		return true;
	            	}else {
	            		return false;
	            	}
	            }
	        });
	    }
	}
});

vm.mounted();
