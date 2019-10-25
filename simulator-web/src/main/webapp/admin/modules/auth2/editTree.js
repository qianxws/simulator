var vmEditTree={
		treeId:"authsTree",
		treeObj:{},
		treeRoot:{"id": "0", "name": "根结点","isParent" : true,"nocheck" : true},
		init:function (){
			this.treeObj = $.fn.zTree.init($("#"+this.treeId), this.setting);
		},
		setting:{
			view: {
				selectedMulti: false
			},
		data: {
			simpleData : {enable : true, idkey : "id", pIdkey : "pId", rootPid : 0 }
		},
	    async: {
	        enable: true,
	        url: Config.apiPath+"commMods/ajax?action=authAction&verb=getZtreeWithTree&token="+token,
	        autoParam:[ "id", "pId", "level" ],
	        dataFilter: function filter(treeId, parentNode, childNodes) {
				return childNodes.rows;
			}
	    },
		callback: { 
			onClick: function(e, treeId, treeNode) {
				$("#authTree").fadeOut("fast");
				vmEdit.model.parentId=treeNode.id==""||treeNode.id=="-1"?"0":treeNode.id;
				$("#parentId").val(vmEdit.model.parentId);
				$("#pname").val(treeNode.name);
			}
		}
	},
};
