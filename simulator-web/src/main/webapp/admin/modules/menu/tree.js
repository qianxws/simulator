var tree_root = {"menuid": "0", "name": "根节点","isParent" : true,"nocheck" : true,"isHidden":false};
//初始化树
var setting = {
		edit: {
			enable:true,
			showRemoveBtn: false,
			showRenameBtn: false,
			drag:{
				isCopy:true,
				isMove:true,
				prev:true,
				next:true,
				inner:true
			}
		},
		view: {
			selectedMulti: false
		},
		data: {
			simpleData : {enable : true, idkey : "menuid", pIdkey : "pid", rootPid : 0 }
		},
		
	    async: {
	        enable: true,
	        url: Config.apiPath+"commMods/ajax?action=menuAction&verb=getMenusBypid&token=" + token,
	        autoParam:[ "menuid", "pid", "level" ],
	        dataFilter: function filter(treeId, parentNode, childNodes) {
				if (!childNodes) return null;
				for (var i=0, l=childNodes.length; i<l; i++) {
					if(childNodes[i].menuid=='0'){
						continue;
					}else{
						childNodes[i]['menuid'] = childNodes[i].menuid;
						childNodes[i]['isParent'] = childNodes[i].isParent;
					}
				}
				return childNodes;
			}
	    },
	    
	    callback : {
	        onClick : function(event, treeId, treeNode, clickFlag) {
	        	vm.selectedMenu=treeNode;
	        },
	        //onRightClick : rightTree,
	        onAsyncSuccess:function(event, treeId, treeNode, msg) {
			},
			beforeDrop: function(event,treeId,targetNode,moveType,treeNode ){
				if (moveType == "inner"){
					if(targetNode.pid != '0'){
						JqdeBox.message(false, "二级菜单不允许有子菜单");
						return false;
					}
				}
				if(moveType=="next" && targetNode.pid==null){
					JqdeBox.message(false, "根节点不允许有并列菜单");
					return false;
				}
			},
			onDrop:onDr
	    }
};

function onDr(event,treeId,treeNode,targetNode, moveType){
	var nodeIds = [];
	if (moveType == "inner"){
		JqdeMods.ajax('menuAction', 'updateMenus', 
				{'id':treeNode[0].menuid,'pid':targetNode.menuid});
	}else {
		var pNode = targetNode.getParentNode();
		var childNode = pNode.children;
		for (var i in childNode){
			nodeIds.push(childNode[i].menuid);
		}
		JqdeMods.ajax('menuAction', 'updateCseq', 
				{'id':treeNode[0].menuid,'pid':targetNode.pid,'nodeIdList':nodeIds});
	}
}

function initTree(){
	
	var tree = $.fn.zTree.init($("#treeDemo"), setting , tree_root);
	tree.expandNode(tree.getNodes()[0], true);
	
}

initTree();

function updateTreeNode(dataTree, levelIdList, i) {
	setTimeout(function(){
		if (i < levelIdList.length){
			var nodeId = levelIdList[i++];
			var dataNode = dataTree.getNodeByParam('id', nodeId);
			if (dataNode){
				clickDataTree(null, 'data-tag', dataNode);
				dataTree.reAsyncChildNodes(dataNode, "refresh", false);
				updateTreeNode(dataTree, levelIdList, i);
			}
		}
	}, 300);
}


//右键树型结构
function rightTree(event, treeId, treeNode) {
	if (!treeNode) return false;
	if (treeNode.menuid==0) {
		$("#rMenu").hide();
		return false;
	}
	var x = event.clientX - $('#sidebar').width();
	var y = event.clientY + $(document).scrollTop() - 90;
	var menus = [];
	if(treeNode.pid=='0'){
		menus.push({name : '添加节点', funName : 'saveNode'});
		//menus.push({name : '修改节点', funName : 'editNode'});
		menus.push({name : '删除节点', funName : 'delNode'});
	}else{
		menus.push({name : '删除节点', funName : 'delNode'});
		//menus.push({name : '修改节点', funName : 'editNode'});
	}
	showRightMenu(x, y, menus, treeId, treeNode.menuid,treeNode.pid,treeNode);
	
}

//显示右键菜单
function showRightMenu(x, y, menus,treeId, nodeId,pid) {
	if (!menus || menus.length == 0) 
		return false;
	var rmenu = $('#rMenu');
	var menu_html = '<ul>';
	for (var i in menus){
		menu_html += '<li onclick="'+menus[i].funName+'(\''+nodeId+'\',\''+ pid +'\')">' 
			+ menus[i].name + '</li>';
	}
	menu_html += '</ul>';
	rmenu.html(menu_html);
	rmenu.show();
	rmenu.css({"top":y+"px", "left":x+"px", "visibility":"visible"});
	
}

function saveNode(nodeId,pid){
	//alert("在节点 "+nodeId+" 下添加节点");
	vm.addMenu(nodeId);
}
function editNode(nodeId,pid){
	vm.editMenu(nodeId);
}

function delNode(nodeId,pid,treeNode){
	//alert("删除 "+nodeId+" 节点");
	vm.deleteMenu(nodeId,pid);
}
