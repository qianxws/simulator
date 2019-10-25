var vm = new Vue({
	el : '#vm',
	data : {
		list : [],
		ids : [],
		dataSourceId:[],driver:[],url:[],username:[],password:[],initialsize:[],maxactive:[],maxwait:[]
	},
	methods : {
		init : function() {
			vm.checkAll();
			initHtmlPage("pageInfo",Config.rows);
			vm.getList();
		},
		//分页获得数据
		getList:function (page) {
			vm.clearChecked();
			page = page || 1;
			JqdeBox.loading();
			var rows = $('#pageSelect').val();
			JqdeMods.ajax('DbConfigAction', 'getDbConfigsPage', {
				'rows' : rows,
				'page' : page,
				'data_source_id' :$("#data_source_id").val()
			}).then(function(result) {
				JqdeBox.unloading();
				if (result.success) {
					vm.list = result.list;
					htmlPage("pageInfo",page, result.total, 'vm.getList',rows);
				} else {
					JqdeBox.message(false, result.message);
				}
			});
		},
		// 添加
		add : function() {
			BootDialog.dialog({
				title : '添加院线',
				url : 'modules/dbconfig/edit.html',
				init : function() {
					vmEdit.init();
				},
				confirm : function() { 
					if (vmEditUtil.valid()) {
						JqdeMods.ajax('DbConfigAction', 'addDbConfig', {dataItem : vmEdit.item}).then(function(result) {
							if (result.success) {
								vm.getList();// 更新页面
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
		// 修改
		edit : function(item) {
			BootDialog.dialog({
				title : '修改数据库配置' + '[<b class="green">' + item.dataSourceId + '</b>]' ,
				url : 'modules/dbconfig/edit.html',
				init : function() {
					vmEdit.item = $.extend({}, item);
	                vmEdit.init();
				},
				confirm : function() {
					if (vmEditUtil.valid()) {
						JqdeMods.ajax('DbConfigAction', 'updateDbConfig', {dataItem : vmEdit.item}).then(function(result) {
							if (result.success) {
								vm.getList();// 更新页面
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
		// 删除
		del : function(item) {
			JqdeBox.confirm('您确定要删除[<b class="green">' + item.dataSourceId + '</b>] 吗？', function(result) {
				if (result) {
					JqdeMods.ajax('DbConfigAction', 'delDbConfig', {"ids" : [ item.dbconfigId ]}).then(function(result) {
						if (result.success) {
							vm.getList();// 更新页面
							JqdeBox.message(true, result.message);
						} else {
							JqdeBox.message(false, result.message);
						}
					});
				}
			});
		},
		// 删除选中
		delSelected : function() {
			JqdeBox.confirm('您确定要删除配置吗？', function(result) {
				if (result) {
					JqdeMods.ajax('DbConfigAction', 'delDbConfig', {"ids" : vm.ids}).then(function(result) {
						if (result.success) {
							vm.getList();// 更新页面
							JqdeBox.message(true, result.message);
						} else {
							JqdeBox.message(false, result.message);
						}
					});
				}
			});
		},
		// 选中全部
		checkAll: function() {
			$('#dynamic-table').on('click', 'th input[type=checkbox]', function() {
				var th_checked = this.checked;
				$('#dynamic-table').find('td input[type=checkbox]').each(function() {
					this.checked = th_checked;
				});
				vm.checkChanged();
			});
		},
		// 选中改变
		checkChanged : function() {
			vm.ids = [];vm.driver = [];vm.url = [];vm.username = [];vm.password = [];vm.initialsize = [];
	    	vm.maxactive = [];vm.maxwait = [];vm.dataSourceId=[];
			$('#dynamic-table').find('td input[type=checkbox]').each(function() {
				if (this.checked) {
					vm.ids.push(this.id);
					vm.dataSourceId.push($(this).attr("dataSourceId"));
					vm.driver.push($(this).attr("driver"));
					vm.url.push($(this).attr("url"));
					vm.username.push($(this).attr("username"));
					vm.password.push($(this).attr("password"));
					vm.initialsize.push($(this).attr("initialsize"));
					vm.maxactive.push($(this).attr("maxactive"));
					vm.maxwait.push($(this).attr("maxwait"));
				}
			}); 
		},
		// 清空选中
		clearChecked: function() {
			$('#dynamic-table').find('input[type=checkbox]:checked').removeAttr('checked');
	    	vm.ids = [];vm.driver = [];vm.url = [];vm.username = [];vm.password = [];vm.initialsize = [];
	    	vm.maxactive = [];vm.maxwait = [];vm.dataSourceId=[];
		},
		// 一键生成
		generate : function() {
			//所有配置文件信息
			var config_html="";
			//单个配置文件信息
			var this_html="";
			//先清空 
			$("#info").html("");
			//设置固定模板 
			var templete='<bean id="${jdbc.dataSourceId}" '
				+'class="org.apache.commons.dbcp.BasicDataSource" destroy-method="close">\r\n'
				+'<property name="driverClassName" value="${jdbc.driver}" />\r\n'
				+'<property name="url" value="${jdbc.url}" />\r\n'
				+'<property name="username" value="${jdbc.username}" />\r\n'
				+'<property name="password" value="${jdbc.password}" />\r\n'
				+'<property name="initialSize" value="${jdbc.initialsize}" />\r\n'
				+'<property name="maxActive" value="${jdbc.maxactive}" />\r\n'
				+'<property name="maxWait" value="${jdbc.maxwait}" />\r\n'
				+'</bean>\r\n';
			
			//循环取值，遍历到html中
			for (var i = 0; i < vm.ids.length; i++) {
				this_html=templete.replace("${jdbc.dataSourceId}",vm.dataSourceId[i])
				.replace("${jdbc.driver}",vm.driver[i])
				.replace("${jdbc.username}",vm.username[i])
				.replace("${jdbc.password}",vm.password[i])
				.replace("${jdbc.url}",vm.url[i])
				.replace("${jdbc.initialsize}",vm.initialsize[i])
				.replace("${jdbc.maxactive}",vm.maxactive[i])
				.replace("${jdbc.maxwait}",vm.maxwait[i]);
				
				config_html+=this_html;
			}
			//生成配置文件模板
			BootDialog.dialog({
				title :  '生成配置文件模板',
				url : 'modules/dbconfig/info.html',
				init : function() {
					$("#info").html(config_html);
				}
			});
		},
		
		AutoGeneration: function() {
			JqdeMods.ajax('DbConfigAction', 'autoGeneration'
					).then(function(result) {
				if (result.success) {
					JqdeBox.message(true, result.message);
				} else {
					JqdeBox.message(false, result.message);
				}
			});
		}

	}
});

vm.init();
