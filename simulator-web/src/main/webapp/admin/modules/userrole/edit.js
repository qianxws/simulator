/*
$('#myTab a[data-toggle="tab"]').on('shown.bs.tab', function(e) {
	
});
*/
var ztreeNodes = [];
var vmEdit = {
	item : {},
	ajaxPramas : {},
	options : [],
	shareOptions : [],
	selected: "",
	mounted : function() { // 初始化执行
		var $this = this;
		//用户
		selectAllUsers();
		//菜单权限
		initSetPermissions();
		//影院权限
		loadHallTree();
		
		//验证表单
		$('#validation-form').validate({
			errorElement : 'div',
			errorClass : 'help-block',
			focusInvalid : true,
			ignore : "",
			rules : {
				name : {
					required : true,
					remote: {//验证角色是否存在
		                type:"post",
		                url:"commMods/ajax?action=checkAction&verb=checkRoleExists"
		            } 
				},
				pid : {required: true}
			},
			messages : {
				name : {required : "角色名称不能为空", remote:"角色已存在"},
				pid: {required: "上级节点不能为空"}
			},
			highlight : function(e) {
				$(e).closest('.form-group').removeClass('has-info').addClass('has-error');
			},
			success : function(e) {
				$(e).closest('.form-group').removeClass('has-error');//.addClass('has-info');
				$(e).remove();
			},
			errorPlacement : function(error, element) {
				error.insertAfter(element);
			}
		});
		//树点击事件
		$("#pname").keyup(function(){
			$this.fetchSearchRoles(); 
			return false;
		});
		$("#pname").click(function(){
			showMenu(); 
			return false;
		});
		$("#roleTreeBtn").click(function(){
			showMenu(); 
			return false;
		});
	},
	// 验证表单
	valid : function() {
		// refresh ajaxprams
		this.updateAjaxPramas();
		return $('#validation-form').valid();
	},
	// 获取全部角色数据
	fetchAllRoles : function(item) {
		JqdeMods.ajax("roleAction", "getRolesWithTree", {}).then(function (result) {
			if (result.success) {
				// 缓存节点数据
				ztreeNodes = result.rows;
				setZtreeFunc("rolesTree", ztreeNodes);
			}
        });
	},
	// 通过模糊搜索设置角色数据
	fetchSearchRoles : function() {
		// 根据关键字文本、首字母、拼音进行模糊匹配
		var kw = $("#pname").val();
		var nodes_ = [];
		for (var node_ in ztreeNodes) {
			var node_name = ztreeNodes[node_].name;
			// 获取节点名称拼音
			var py_name = makePy(node_name) + "";
			py_name = py_name.toLowerCase();
			// 获取节点名称首字母
			var a_name = codefans_net_CC2PY(node_name) + "";
			if (node_name.indexOf(kw) != -1 
					|| py_name.indexOf(kw.toLowerCase()) != -1
					|| a_name.indexOf(kw.toLowerCase()) != -1
			) {
				nodes_.push(ztreeNodes[node_]);
			}
		}
		setZtreeFunc("rolesTree", nodes_);	
	},
	// 获取全部权限数据
	fetchAllAuths : function(item) {
		//根节点默认不包含checkbox
		var rootNode = { "id" : "0", "name" : "权限设置管理", "pid" : "9999", "pId" : "9999", "open" : true, "isParent" : true, "nocheck" : true, "checked" : false };
		var authNodes = [rootNode];
		var authSetting = {
			view : { async : true, dblClickExpand : false, showLine : true, selectedMulti : false, expandSpeed : 400
			},
			data : { simpleData : { enable : true, idkey : "id", pIdkey : "pId", rootPid : 0 } },
			async : {
				enable : true,
				url : "commMods/ajax?action=roleAction&verb=noSession_getAuthsByRole", // 根据pid查询对应值集合
				autoParam : [ "id", "pId" ],
				otherParam : {
					"ids" : item.roleid, "page" : "1",
					"rows" : "9999", "enabled" : true
				},
				type : "post",
				dataFilter : null
			},
			callback : {
				onClick : Ztree.reLoadOpenCheckedURL, //节点点击时
				onAsyncError : Ztree.onAsyncError,//异步加载失败时
				onAsyncSuccess : Ztree.zTreeOnAsyncSuccessFunc,
				onCheck :Ztree.zTreeOnCheck
			},
			check : {enable : true,chkboxType : {"Y" : "","N" : ""}}
		};
		var authTreeObj = $.fn.zTree.init($("#role_Auths"), authSetting, authNodes);
		setTimeout(function() {
			var node = authTreeObj.getNodeByParam("id", "0", null);
			Ztree.reLoadOpenCheckedURL(null, "role_Auths", node);
		}, 10);
	},
	getAllRoleCseqs : function(pid, cseq_){
		if (pid && recordPid != pid) {
			pid = (pid == -1 ? 0 : pid);
			var $this = this;
            JqdeMods.ajax('roleAction', 'getAllRoleCseqs', {
            	"pid": pid 
			}).then(function (result) {
				$('#cseq').empty();
				if (result.roles.length > 0) {
					$(result.roles).each(function(i) {
						$('#cseq').append('<option value="'+this+'"' + (cseq_==this?" selected":"") + '>'+this+'</option>');
					});
					$('#cseq').append('<option value="'+(result.roles[result.roles.length-1]+1)+'">'+(result.roles[result.roles.length-1]+1)+'</option>');
				}
				if (vmEdit.item.edit) {
					//显示排序 
	            	$('#roleCseq').show();
				}
            });
            recordPid = pid;
		}
	},
	// 更新ajaxPramas
	updateAjaxPramas : function() {
		var roleAuthsMap = [];
		if(shareArr[0] != ","){
			var ids = shareArr[0];
			ids = "@@" + ids + "@@";
			ids = ids.replace("@@,", "").replace(",@@", "");
			var authIdsA = ids.split(",");
			for (var i in authIdsA) {
				var node = authIdsA[i];
				roleAuthsMap.push(node);
			}
		}
		
		// 自动将form表单封装成json
		var data = $("#validation-form").serializeObject();
		this.item = $.extend({}, this.item, data);
		var id_ = "@@"+twoShareArr[0]+"@@";
		id_ = id_.replace("@@,","").replace(",@@","").replace("@@","");
		vmEdit.id_ = id_;
		this.ajaxPramas = {
			dataItem : this.item,
			roleAuths : roleAuthsMap,
			id_ : id_
		};

        //影院权限
        var hallTree = $.fn.zTree.getZTreeObj('hallAuthZtree');
        var nodes = hallTree.getCheckedNodes(true);
        var ref_array = {};
        //循环选择的一级节点 level：0
        for(var i in nodes) {
        	if (nodes[i].level == 0){
        		ref_array[nodes[i].id] = {};
        	}
        }
        var three_node = {};
        //循环三级节点
        for (var i in nodes){
        	if (nodes[i].level == 2){
        		var pId = nodes[i].pId;
        		if (three_node[pId]){
        			three_node[pId].push(nodes[i].id);
        		}else {
        			three_node[pId] = [nodes[i].id];
        		}
        	}
        }
        //循环二级节点
        for (var i in nodes){
        	if (nodes[i].level == 1){
        		var pId = nodes[i].pId;
        		if (ref_array[pId]){
        			ref_array[pId][nodes[i].id] = three_node[nodes[i].id] || null;
        		}
        	}
        }
        vmEdit.ajaxPramas['ref_array'] = ref_array;
	}
};

// 获取全部权限数据 初始化执行1次 select风格调用 
function selectAllAuths() {
    var $this = this;
    JqdeMods.ajax('authAction', 'getAllAuths', {
		'rows' : 9999,
		'page' : 1
	}).then(function (result) {
		var authMap = [];
		if (result.success) {
			for (var i in result.rows) {
				var id_ = result.rows[i].authid;
				var name_ = result.rows[i].name;
				var subM = {
					value : id_, 
					text : name_
				};
				authMap.push(subM);
			}
			//填充到select左右风格中的左侧框
			var html_ = "";
			$('#selectLeft').empty();
			$(result.rows).each(function(i) {
				$('#selectLeft').append('<option value="'+result.rows[i].authid+'">'+result.rows[i].name+'</option>');
			});
		}
		shareMap = authMap; //缓存
    });
}

// 获取当前角色的所有权限
function getAuthsByCurRole(item){
	if (vmEdit.item.roleid) {
		JqdeMods.ajax(
       		'authAction',//Action类
       		'getAuthsByCurRole',//类中方法
       		{'roleId' : item.roleid}
		).then(function (result) {
		    if (result.success) {
		    	if (result.authIds && result.authIds.length > 0) {
		    		shareArr[0] = shareArr[0] + result.authIds + ",";
		    		shareArr[1] = shareArr[1] + result.authNames + ",";
		    		addRightSelect("selectRight");
		    	}
            } else {
                JqdeBox.message(false, result.message);
            }
        });
	}
}

//获取当前角色挂载的所有用户
function getUsersByRole(item){
	if (vmEdit.item.roleid) {
		JqdeMods.ajax(
       		'roleAction',//Action类
       		'getUsersByCurRole',//类中方法
       		{'roleId' : item.roleid}
		).then(function (result) {
		    if (result.success) {
		    	if (result.userIds && result.userIds.length > 0) {
		    		twoShareArr[0] = twoShareArr[0] + result.userIds + ",";
		    		twoShareArr[1] = twoShareArr[1] + result.userNames + ",";
		    		addRightSelect("selectRight_");
		    	}
            } else {
                JqdeBox.message(false, result.message);
            }
        });
	}
}

//设置用户角色
function selectAllUsers() {
    var $this = this;
    JqdeMods.ajax('userAction', 'getAllUsers_', {
		'rows' : 9999,
		'page' : 1
	}).then(function (result) {
		var userMap = [];
		if (result.success) {
			for (var i in result.rows) {
				var id_ = result.rows[i].userId;
				var name_ = result.rows[i].name;
				var subM = {
					value : id_, 
					text : name_
				};
				userMap.push(subM);
			}
			//填充到select左右风格中的左侧框
			var html_ = "";
			$('#selectLeft_').empty();
			$(result.rows).each(function(i) {
				if (result.rows[i].userId != "root" && result.rows[i].enabled) {
					$('#selectLeft_').append('<option value="'+result.rows[i].userId+'">'+result.rows[i].name+'</option>');
				}
			});
		}
		shareMapO = userMap; //缓存
    });
}

//初始化加载数据
function initSetPermissions(){
	// 初始化数据
	if (vmEdit.item.roleid && vmEdit.item.roleid != "") {
		// 初始化排序下拉菜单
		vmEdit.getAllRoleCseqs(vmEdit.item.pid, vmEdit.item.cseq);
		//获取角色关联数据
		getAuthsByCurRole(vmEdit.item);
		getUsersByRole(vmEdit.item);
	}
	// 获得角色下拉树
	vmEdit.fetchAllRoles(vmEdit.item);
	//初始化ztree或select风格加载
	switchStyle();
}

/*添加中角色设置风格切换*/
function switchStyle(){
	if(selectOk){
		//初始化select风格数据
		if(initOneSelect){
			//获得select左侧框数据
			selectAllAuths();
			initOneSelect = false;
		}
		removeSearchName();
		addRightSelect("selectRight");
		$("#authsSelect").show();
		$("#searchId").show();
		$("#role_Auths").hide();
		$("#authsSelect_").show();
		$("#searchId_").show();
		$("#role_Auths_").show();
		selectOk = false;
	}else {
		//初始化ztree风格数据
		if (initOneTree) {
			vmEdit.fetchAllAuths(vmEdit.item);
			initOneTree = false; 
		} else {
			//为ztree树打钩-缓存数据
			var zTree = $.fn.zTree.getZTreeObj("role_Auths");
			Ztree.checkNodeShareIds(zTree, shareArr);
		}
		$("#role_Auths").show();
		$("#authsSelect").hide();
		$("#searchId").hide();
		$("#role_Auths_").show();
		$("#authsSelect_").show();
		$("#searchId_").show();
		selectOk = true;
	}
}

//模糊搜索事件
function searchName(){
	shareSearchsFunc("", false);
}

//清空搜索框
function removeSearchName(){
	removeSearchsFunc("", false);
}

// 设置ztree下拉菜单
function setZtreeFunc(id_Tree, zNodes) {
	var roleSetting = {
		view: { dblClickExpand: false },
		data: { simpleData: { enable: true } },
		callback: { 
			beforeClick: function(treeId, treeNode) {
				if (vmEdit.item.edit) {
					if (treeNode && vmEdit.item.roleid && treeNode.id == vmEdit.item.roleid) {
						alert("不能选择当前名称为父节点");
						return false;
					}
				}
				return true;
			},
			onClick: function(e, treeId, treeNode) {
				hideMenu();
				$("#pid").val(treeNode.id=="-1"?"0":treeNode.id);
				$("#pname").val(treeNode.name);
				if (vmEdit.item.edit) {
					vmEdit.getAllRoleCseqs($("#pid").val(), vmEdit.item.cseq);
				}
			}
		}
	};
	$.fn.zTree.init($("#" + id_Tree), roleSetting, zNodes);
	if (vmEdit.item.edit) {
		//指定选中ID的节点  
		var zTree_Menu = $.fn.zTree.getZTreeObj(id_Tree);
	    var node = zTree_Menu.getNodeByParam("id", (vmEdit.item.pid == 0 ? -1 : vmEdit.item.pid)); 
	    zTree_Menu.selectNode(node, true);
	    vmEdit.item.edit = false;
	}
}

//自定义下拉选样式
function showMenu() {
	var pname = $("#pname");
	$("#roleTree").css({top:(pname.outerHeight() + "px")}).slideDown("fast");
	$("body").bind("mousedown", onBodyDown);
}

function hideMenu() {
	$("#roleTree").fadeOut("fast");
	$("body").unbind("mousedown", onBodyDown);
}

function onBodyDown(event) {
	if (!(event.target.id == "pname" || event.target.id == "roleTreeBtn" || $(event.target).parents("#roleTree").length>0)) {
		hideMenu();
	}
}

//加载影厅权限树型结构
function loadHallTree() {
	//根节点默认不包含checkbox
	var rootNode = { "id" : "0", "name" : "全国", "open" : true, "isParent" : true, "nocheck" : true, "checked" : false };
	var hallNodes = [rootNode];
	var authSetting = {
		view : { async : true, dblClickExpand : false, showLine : true, selectedMulti : false, expandSpeed : 400},
		data : { simpleData : { enable : true, idkey : "id", pIdkey : "pId", rootPid : 0 } },
		check : {enable : true,chkboxType : {"Y" : "ps", "N" : "ps"}},
		async: {
			enable : true,
			url : "commMods/ajax?action=roleAction&verb=getAllHallTree", // 根据pid查询对应值集合
			autoParam : [ "id", "pId", 'level'],//
			otherParam : {'ajaxParams' : JSON.stringify({roleId : vmEdit.item.roleid})},
			type : "post",
			dataFilter : null
		}
	};
	var authTreeObj = $.fn.zTree.init($("#hallAuthZtree"), authSetting);
}
