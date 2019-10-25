var vmTree={
		treeObj:{},
		treeRoot:{"id": "0", "name": "根结点","isParent" : true,"nocheck" : true},
		init:function (){
			this.treeObj = $.fn.zTree.init($("#treeDemo"), this.setting);
			this.treeObj.expandNode(this.treeObj.getNodes()[0], true);
		},
		setting:{
				view: {
					selectedMulti: false
				},
				data: {
					simpleData : {enable : true, idkey : "id", pIdkey : "parentId", rootPid : 0 }
				},
			    async: {
			        enable: true,
			        url: Config.apiPath+ "commMods/ajax?action=treeAction&verb=getTypeTree&token="+token+"&maxLevel="+3, // 根据pid查询对应值集合
			        autoParam:[ "id", "parentId", "level" ],
			        dataFilter: function filter(treeId, parentNode, childNodes) {
						if (!childNodes) return null;
						return childNodes;
					}
			    },
			    callback : {
			        onClick : function(event, treeId, treeNode, clickFlag) {
			        	vm.model.nodeId=treeNode.id;
			        	vm.model.nodeName=treeNode.name;
			            biz.getList();
			        },
			        onRightClick:function(event, treeId, treeNode, clickFlag) {
			            // 判断是否父节点
			            if(!treeNode.isParent){
			                alert("treeId自动编号：" + treeNode.tId + ", 节点id是：" + treeNode.id + ", 节点文本是：" + treeNode.name);
			            }
			        },
			        onAsyncSuccess:function(event, treeId, treeNode, msg) {
					}
			    }
		},
};

