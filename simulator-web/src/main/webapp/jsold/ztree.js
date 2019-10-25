/**
 * Application Ztree 
 */
//判断是否为打钩ztree还是下拉树
ztreeok = true;
//流程树开关
flowZtree = false;
//记录初始化各个模块树id，已存在则证明初始化过，不再初始化
var ztreeCache = ",";
var Ztree = {
	// 如果是父节点不处理，是子节点打开对应的连接
	shareReLoadOpenURL : function (event, treeId, treeNode) {
		Ztree.reLoadOpenURL (event, treeId, treeNode, false, true);
	},
	//非打钩的树点击时执行
    reLoadOpenURL : function (event, treeId, treeNode, isAuto, isVue) {
    	// 编辑时初始化
	    if (isAuto && vmEdit.item.edit) {
			//不作任何处理			    	
	    } else {
	    	if(treeNode && treeNode.name){
		    	if(vmEdit.item.name != treeNode.name){
		    		if (isVue) {
		    			if(treeNode.id == "-1"){
			    			vmEdit.item.pid = "0";
			    		}else{
			    			vmEdit.item.pid = treeNode.id;
			    		}
			    		vmEdit.item.pname = treeNode.name;
		    		} else {
		    			if(treeNode.id == "-1"){
			    			$("#pid").val("0");
			    		}else{
			    			$("#pid").val(treeNode.id);
			    		}
		    			$("#pname").val(treeNode.name);
		    		}
		    	}else {
		    		alert("上级节点不能选择自己！");
		    	}
	    	}
	    }
	    //下拉树
	    ztreeok = true;
		Ztree.reLoadOpenURLFcun(event, treeId, treeNode, false);
		Ztree.zTreeIdIsIds(treeId, null, false, true);
	},
	//打钩的树点击时执行
	reLoadOpenCheckedURL : function (event, treeId, treeNode){
		//打钩树
		ztreeok = false;
		Ztree.reLoadOpenURLFcun(event, treeId, treeNode, true);
	},
	// 如果是父节点不处理，是子节点打开对应的连接
	reLoadOpenURLFcun : function (event, treeId, treeNode, isExpandNode) {
		var zTree = $.fn.zTree.getZTreeObj(treeId);
		//ztree树打钩事件 OnClick点击节点 ，自动打钩事件
		if((treeNode && treeNode.id != 0) || flowZtree == true){
			Ztree.zTreeOnClick_(event, treeId, treeNode ,zTree);
		}
		if (treeNode && treeNode.isParent) { // 如果是父节点
			if (isExpandNode && treeNode.open) { // 父节点为展开状态, 折叠父节点
				//zTree.expandNode(treeNode, false, true, true, false);
			} else { // 父节点是折叠的
				if(flowZtree == true){
					zTree.reAsyncChildNodes(treeNode, "refresh");
				}
				if(treeNode.id == 0 && ztreeCache.indexOf("," + treeId + ",") == -1){
					ztreeCache = ztreeCache + treeId + ",";
					zTree.reAsyncChildNodes(treeNode, "refresh");
				} else {
					if(isExpandNode){
						//zTree.expandNode(treeNode, true, false, true, false);
					}
				} 
			}
			return false;
		} else {// 不是父节点，打开对应连接
			//alert("http:///xxxxxx");
			return false;
		}
	},
	// 用于捕捉节点被展开后的事件回调函数
	zTreeOnExpand : function (event, treeId, treeNode) {
		//alert(treeNode.tId + ", " + treeNode.name);
	},
	// 过滤方法
	filter : function (treeId, parentNode, childNodes) {
		if (!childNodes) {
			return null;
		}
		return childNodes;
	},
	// 异步加载失败时
	onAsyncError : function (event, treeId, treeNode, XMlHttpRequest, textStatus, errorThrown) {
		alert("加载失败！");
	},
	zTreeOnAsyncSuccessFunc : function (event, treeId, treeNode) {
		var zTree = $.fn.zTree.getZTreeObj(treeId);
		// 没有root节点，代表是下拉树,设置根节点选中
		var zTreeNodes = zTree.getNodes();
 		if (treeNode) {
 			// 根据缓存用户的打钩记录，进行打钩
 			var arr = Ztree.zTreeIdIsIds(treeId, null, false, false);
 	 		Ztree.checkNodeShareIds(zTree, arr);
 	 		// 默认打根节点
 	 		if (treeNode && treeNode.id == 0) {
 	 			var childNodes = zTree.transformToArray(treeNode);
 	 			zTree.expandNode(childNodes[0], true);
 	 		}
 	 		// 根据父节点设置子节点选中 设置根节点下的子节点选中
 	 		zTreeNodes = treeNode.children;
 		} 
 		//判断是否为打钩ztree还是下拉树
 		if(ztreeok){
 	 		Ztree.shareSelectNodes(zTree, zTreeNodes);
	 	}
	},
	//设置节点选中函数
	shareSelectNodes : function (zTree, zTreeNodes){
		if(zTreeNodes && zTreeNodes.length>0){
			for (var i = 0; i < zTreeNodes.length; i++) {
				// 修改时默认选中当前节点
				if (zTreeNodes[i].id && vmEdit.item && vmEdit.item.edit && 
						(zTreeNodes[i].id == vmEdit.item.pid ||
						 zTreeNodes[i].id == vmEdit.item.orgId || 
						(vmEdit.item.pid == "0" && zTreeNodes[i].id == "-1"))) {
					//判断是否为IE浏览器
					if (document.all && window.external) {//IE
						if (zTreeNodes[i].pid == "0" || zTreeNodes[i].pId == "0") {
							zTree.selectNode(zTreeNodes[i]);
						}
					} else {//非IE
						zTree.selectNode(zTreeNodes[i]);
					}
				}
			}
		}
	},
	//根据缓存用户的打钩记录，进行打钩
    checkNodeShareIds : function (zTree, arr){
		zTree.checkAllNodes(false);
		var nodes = zTree.getCheckedNodes(false);
		if(arr[0]){
			for (var i in nodes) {
				if (arr[0].indexOf("," + nodes[i].id + ",") != -1) {
					zTree.checkNode(nodes[i], true, true);
				} 
			} 
		}
    },
    //ztree树打钩事件 OnClick点击节点 ，自动打钩事件
	zTreeOnClick_ : function (event, treeId, treeNode, zTree) {
		//获取ids与names数组
		var arr = Ztree.zTreeIdIsIds(treeId, null, false, false);
		arr = Ztree.zTreeOnClickFunc(event, treeId, treeNode, zTree, arr);
		Ztree.zTreeIdIsIds(treeId, arr, true, false);
	},
	zTreeOnClickFunc : function (event, treeId, treeNode, zTree, arr){
		if (arr[0] && treeNode) {
			if (arr[0].indexOf("," + treeNode.id + ",") != -1) {
				arr[0] = arr[0].replace("," + treeNode.id + ",", ",");
				arr[1] = arr[1].replace("," + treeNode.name + ",", ",");
				zTree.checkNode(treeNode, false, false);
			} else if(treeNode.id != 0){
				arr[0] = arr[0] + treeNode.id + ",";
				arr[1] = arr[1] + treeNode.name + ",";
				zTree.checkNode(treeNode, true, true);
			} 
		}
		return arr;
	},
    //ztree树打钩事件
	zTreeOnCheck : function (event, treeId, treeNode) {
		//获取ids与names数组
		var arr = Ztree.zTreeIdIsIds(treeId, null, false, false);
		arr = Ztree.zTreeOnCheckFunc(event, treeId, treeNode, arr);
		Ztree.zTreeIdIsIds(treeId, arr, true, false);
	},
	zTreeOnCheckFunc : function (event, treeId, treeNode, arr){
		var treeObj = $.fn.zTree.getZTreeObj(treeId);
		var nodes = treeObj.getCheckedNodes(true);
		if(treeNode.checked){//打 钩：1、父节点打钩，子节点同时打钩；2、子节点打钩，父节点打钩
			for (var i in nodes) {
				var node = nodes[i];
				if (arr[0].indexOf("," + node.id + ",") == -1) {
					arr[0] = arr[0] + node.id + ",";
					arr[1] = arr[1] + node.name + ",";
				}
			}
		} else {//取消打钩，执行一次
			nodes = treeObj.getCheckedNodes(false);
			for (var i in nodes) {
				var node = nodes[i];
				if (arr[0].indexOf("," + node.id + ",") != -1) {
					arr[0] = arr[0].replace("," + node.id + ",", ",");
					arr[1] = arr[1].replace("," + node.name + ",", ",");
				} 
			}
		}
		return arr;
	}, 
	/**
	 * 根据ztreeid 处理相应ids和div隐藏显示
	 * 如果新模块里增加ztree树，则需要在此根据树id配置全局变量
	 */
	zTreeIdIsIds : function (treeId, arr, okArr, Okhide){
		switch (treeId) {
			//组织机构模块
			case "orgsTree" :
					if(Okhide){
						$('#orgTree').hide();
					}
				break;
			//角色模块	
			case "rolesTree" :
					if(Okhide){
						$('#roleTree').hide();
					}
				break;
			//岗位模块	
			case "positionsTree" :
					if(Okhide){
						$('#positionTree').hide();
					}
				break;
			//权限模块
			case "authsTree" : 
				if(Okhide){
					$('#authTree').hide();
				}
				break;
			//菜单模块
			case "menusTree" : 
				if(Okhide){
					$('#menuTree').hide();
				}
				break;
			//用户模块第二棵树		
			case "user_positions" :
				if(okArr){
					twoShareArr = arr;
				}else{
					return twoShareArr;
				}
			break;
			//数据字典	
			case "dictionarysTree" :
				if(Okhide){
					$('#dictionaryTree').hide();
				}
				break;
			//指派人员	
			case "assignUserzTree" :
				if(okArr){
					userArr = arr;
				}else{
					return userArr;
				}
				break;
			default:
				if(okArr){
					shareArr = arr;
				}else{
					return shareArr;
				}
				$('#orgTree').hide();
				break;
		}
		return "";
	}
};

//下拉树显示隐藏设置
function showOrHideZtree(e, divId, inputId, buttonId, isZtree, ztreeId){
	var targetId = e.target.id;
	if (isZtree) {//ztree下拉风格显示隐藏控制
		if (!(targetId && targetId.indexOf(ztreeId)!= -1)) {
			if (!targetId || targetId != divId) {
				if ($("#" + divId).is(":hidden") && (targetId == buttonId || targetId == inputId)) {
					$("#" + divId).show();
				} else {//alert(1);
					$("#" + divId).hide();
				}
		  	}
		}
	}
}
