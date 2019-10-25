var href_data = {};
var vmEdit = new Vue({
	el : '#vmEdit',
	data : {
		id : '',
		roleData : [],
		userList : [],
		selectNode : {},//用户操作选中的节点，用来初始化子节点
		ajaxPramas : {}
	},
	methods : {
		mounted : function() {
			//从地址栏获得参数
			var parm = window.location.hash;
			parm = parm.substring(parm.indexOf('?') + 1);
			var parm_array = parm.split("&");
			for ( var i in parm_array) {
				var array = parm_array[i].split("=");
				href_data[array[0]] = array[1];
			}
			this.id = href_data.id;
			//获得角色基本信息
			this.getRoleInfo();
			//权限
			this.getAuth();
			//影厅权限树
			this.loadHallTree();
			//用户
			this.loadAllUser();
		},
		getRoleInfo : function() {
			if (this.id){
				JqdeMods.ajax('roleAction', 'getRoleInfo', {
					id : this.id
				}).then(function (result) {
					if (result.success){
						$('#role-name').val(result.roleInfo.name);
						$('#role-des').val(result.roleInfo.description);
					}
				});
			}
		},
		loadAllUser : function() {
			//获得全部用户
			JqdeMods.ajax('roleAction', 'getAllUser', {
				id : this.id
			}).then(function (result) {
				if (result.success){
					vmEdit.userList = result.allUser;
				}
				
				setTimeout(function () {
					var roleUser = result.roleUser;
					if (roleUser){
						for (var i in roleUser){
							$('#duallist').find('option[value="' + roleUser[i].userId + '"]').attr('selected', true);
						}
					}
					
					$('select[name="duallistbox_demo1"]').bootstrapDualListbox({
				 		infoTextFiltered: '',
				 		selectorMinimalHeight : 260,
				 		infoText : '共 {0} 条',
				 		filterTextClear : '显示全部',
				 		filterPlaceHolder : '搜索',
				 		infoTextEmpty : '空'
					});
				}, 500);
			});
		},
		//加载权限信息
		/*getAuth : function() {
			JqdeMods.ajax('roleAction', 'getAllAuth', {
				id : this.id
			}).then(function (result) {
				if (result.success){
					vmEdit.roleData = result.allAuth;
					if (result.roleAuth){
						setTimeout(function () {
							var roleAuth = result.roleAuth;
							for (var i in roleAuth) {
								$('#checkbox_' + roleAuth[i]).attr('checked', true);
							}
						}, 500);
					}
				}else {
					JqdeBox.message(false, '权限信息查询失败！');
				}
			});
		},*/
//		getAuth : function() {
//			//根节点默认不包含checkbox
//			var rootAuthNode = { "id" : "0", "name" : "全国", "open" : true, "isParent" : true, "nocheck" : true, "checked" : false };
//			var allAuthNodes = [rootAuthNode];
//			var authSetting = {
//				view : { async : false, dblClickExpand : false, showLine : true, selectedMulti : false, expandSpeed : 400},
//				data : { simpleData : { enable : true, idkey : "id", pIdkey : "pId", rootPid : 0 } },
//				check : {enable : true,chkboxType : {"Y" : "ps", "N" : "ps"}},
//				async: {
//					enable : true,
//					url :Config.apiPath+ "commMods/ajax?action=roleAction&verb=getAllAuthTree&token="+token, // 根据pid查询对应值集合
//					autoParam : [ "id", "pId", 'level'],//
//					otherParam : {'ajaxParams' : JSON.stringify({id : vmEdit.id})},
//					type : "post",
//					dataFilter : function(treeId, node, data) {
//						if (node && node.id){
//							for (var i in data){
//								node.checked = data[i].checked;
//							}
//						}
//						return data;
//					}
//				}
//			};
//			var authTreeObj2 = $.fn.zTree.init($("#baseAuthZtree"), authSetting);
//		},
		getAuth : function() {
			//ztree配置参数
			var treeOperation = {
				edit: {drag: false,enable: false,showRemoveBtn: false,showRenameBtn: false},
				view : { async : false, dblClickExpand : false, showLine : true, selectedMulti : false, expandSpeed : 400},
				check : {enable : true,chkboxType : {"Y" : "ps", "N" : "ps"}},
				data: {
					simpleData : {enable : true, idKey : "id", pIdKey: "parentId", rootPId: 0 }
				},
				callback : {}
			};
			//同步树
			JqdeMods.ajax('roleAction', 'getAllAuthTree', {
				id : vmEdit.id,
			}).then(function (result) {
//				alert(JSON.stringify(result))
				var tree = $.fn.zTree.init($("#baseAuthZtree"), treeOperation,result);
				//设置收起所有节点
//				tree.expandAll(false);
			});
			
		},
		//点击根节点
		checkPitem : function(pItem){
			var checked = $('#checkbox_' + pItem.authId)[0].checked;
			var childContent = $('#child_' + pItem.authId);
			var childAuth = pItem.childAuth;
			if (childAuth){
				for (var i in childAuth){
					var auth = childAuth[i];
					document.getElementById('checkbox_' + auth.authId).checked = checked;
				}
			}
		},
		//点击子节点
		checkItem : function(pItemId) {
			$('#child_' + pItemId).find('input[type="checkbox"]').each(function(i, v) {
				if (v.checked){
					document.getElementById('checkbox_' + pItemId).checked = true;
					return false;
				}
			});
			var len = $('#child_' + pItemId).find('input[type="checkbox"]:checked').length;
			if (len == 0){
				document.getElementById('checkbox_' + pItemId).checked = false;
			}
		},
		loadHallTree : function() {
			//根节点默认不包含checkbox
			var rootNode = { "id" : "0", "name" : "全国", "open" : true, "isParent" : true, "nocheck" : true, "checked" : false };
			var hallNodes = [rootNode];
			var authSetting = {
				view : { async : true, dblClickExpand : false, showLine : true, selectedMulti : false, expandSpeed : 400},
				data : { simpleData : { enable : true, idkey : "id", pIdkey : "pId", rootPid : 0 } },
				check : {enable : true,chkboxType : {"Y" : "ps", "N" : "ps"}},
				async: {
					enable : true,
					url :Config.apiPath+  "commMods/ajax?action=roleAction&verb=getAllHallTree&token="+token, // 根据pid查询对应值集合
					autoParam : [ "id", "pId", 'level'],//
					otherParam : {'ajaxParams' : JSON.stringify({id : vmEdit.id})},
					type : "post",
					dataFilter : function(treeId, node, data) {
						if (node && node.id){
							for (var i in data){
								node.checked = data[i].checked;
							}
						}
						return data;
					}
				}
			};
			var authTreeObj = $.fn.zTree.init($("#hallAuthZtree"), authSetting);
		},
		//更新页面数据到param
		updateAjaxPramas :function() {
			//菜单权限
			//表格方式
			/*var menu_role = [];
			$('#menu-role').find('input[type="checkbox"]:checked').each(function(i, v) {
				var id = v.id;
				if (id){
					menu_role.push(id.substring(id.indexOf('_') + 1));
				}
			});
	        this.ajaxPramas['menu_role'] = menu_role;*/
			//ztree方式
			var authTree = $.fn.zTree.getZTreeObj('baseAuthZtree');
	        var firstLevelNodes = authTree.getCheckedNodes(true);
	        var ref_auth_array = {};
	        var checkedNodes = [];
	        for(var i in firstLevelNodes){
	        	var node = firstLevelNodes[i];
	        	checkedNodes.push(node.id);
	        }
	        this.ajaxPramas['menu_role'] = checkedNodes;
	        
			//影院权限
	        var hallTree = $.fn.zTree.getZTreeObj('hallAuthZtree');
	        var nodes = hallTree.getCheckedNodes(true);
	        var ref_array = {};
	        for (var i in nodes){
	        	var node = nodes[i];
	        	if (!node.checked) continue;
	        	if (node.level == 0){
	        		var city_obj = {}
	        		var city = node.children;
        			for (var j in city){
        				var cityNode = city[j];
    		        	if (!cityNode.checked) continue;
        				var cinema = cityNode.children;
        				var cin_obj = {};
        				for (var n in cinema){
        					var cinemaNode = cinema[n];
        		        	if (!cinemaNode.checked) continue;
        					var hall = cinemaNode.children;
        					var hall_obj = [];
        					for (var m in hall){
        						var hallNode = hall[m];
            		        	if (!hallNode.checked) continue;
        						hall_obj.push(hallNode.id);
        					}
        					cin_obj[cinema[n].id] = hall_obj;
        				}
        				city_obj[city[j].id] = cin_obj;
        			}
        			ref_array[node.id] = city_obj
	        	}
	        }
	        this.ajaxPramas['ref_array'] = ref_array;
	        
	        //角色用户
	        var user_array = [];
	        $('#bootstrap-duallistbox-selected-list_duallistbox_demo1').find('option').each(function(i, v) {
	        	user_array.push($(v).val());
	        });
	        this.ajaxPramas['user_array'] = user_array;
		},
		rcursion : function () {
			
		},
		save : function() {
			var name = $('#role-name').val();
			if (!name){
				alert("角色名称不能为空！");return false;
			}
			var des = $('#role-des').val();
			this.ajaxPramas['id'] = this.id;
			this.ajaxPramas['name'] = name;
			this.ajaxPramas['des'] = des;
			this.updateAjaxPramas();
			JqdeMods.ajax('roleAction', 'saveRole', this.ajaxPramas).then(function (result) {
				if (result.success){
					JqdeBox.message(true, '保存成功！');
					window.location.href =  '#/role'
				}else {
					JqdeBox.message(false, '保存失败,请稍后再试！');
				}
			});
		},
		//返回
		callBack : function() {
			window.location.href =  '#/role'
		}
	}
});

vmEdit.mounted();
