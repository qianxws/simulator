var vmTree={
		treeObj:{},
		treeRoot:{"id": "0", "name": "根结点","isParent" : true,"nocheck" : true},
		init:function (){
			this.treeObj = $.fn.zTree.init($("#dataTree"), this.setting);
	    	//添加表头
	    	var li_head = '<li class="head"><a> \
	    		<div id="dynamic-table" class="divTh" style="width:30%;text-align:left;padding-left:27px;">\
		            <label class="pos-rel">\
		                <input type="checkbox" class="ace" onclick="vm.checkChanged(this.checked)"/>\
		                <span class="lbl"></span>\
					</label>\
	    		名称</div> \
	    		<div class="divTh" style="width:10%">编码</div> \
	    	 	<div class="divTh" style="width:15%">创建时间</div> \
	    	 	<div class="divTh" style="width:10%" class="center">创建人</div> \
	    	 	<div class="divTh" style="width:10%" class="center">状态</div> \
	    		<div class="divTh" style="width:10%" class="center">缺省权限</div> \
	    	 	<div class="divTh" style="width:15%">操作</div> \
	    	 	</a></li>';
	    	$("#dataTree").prepend(li_head);
		},
		setting:{
		 	view: { showLine: false, addDiyDom: addDiyDomFunc },
		 	data: { simpleData : { enable : true, idkey : "id", pIdkey : "pId", rootPid : -1 } },
		 	check : {enable : true,chkboxType : {"Y" : "s", "N" : "ps"}},
			async: {
				enable : true,
				contentType :"application/x-www-form-urlencoded; charset=UTF-8",
				url : Config.apiPath+"commMods/ajax?action=authAction&verb=getTreeList&token="+token, // 根据pid查询对应值集合
				autoParam : [ "id", "pId" ],
				otherParam : {"ids": "","page": "1","rows": "9999","enabled": true,"name" : function() { return $('#name').val();},
					"code" :function() {return $('#code').val()},"state":function() {return $('#repStatus').val()}},
				type : "post",
				dataFilter : null
			},
			callback : {
				onCheck :function() {
					vm.ids = [];
					vm.pName = [];
					vm.isParent = [];
					var zTree = $.fn.zTree.getZTreeObj("dataTree");
					var nodes = zTree.getCheckedNodes(true);
					for ( var i in nodes) {
						if(nodes[i].isParent){
							vm.pName.push(nodes[i].name);
						}
						vm.ids.push(nodes[i].id)
						vm.isParent.push(nodes[i].isParent)
					}
				}
			}
			
		}

};

//自定义DOM节点
function addDiyDomFunc(treeId, treeNode) {
	var editNode = {};
	var spaceWidth = 15;
	var liObj = $("#" + treeNode.tId);
	var aObj = $("#" + treeNode.tId + "_a");
	var switchObj = $("#" + treeNode.tId + "_switch");
	var checkObj = $("#" + treeNode.tId + "_check");
	var icoObj = $("#" + treeNode.tId + "_ico");
	var spanObj = $("#" + treeNode.tId + "_span");
	aObj.attr('title', '');
	aObj.append('<div class="divTd" style="width:30%"></div>');
	var firstDivObj = $(liObj).find('div').eq(0);
	//图标垂直居中
	icoObj.css("margin-top","11px");
	switchObj.css("margin-top","-3px");
	
	//从默认的位置移除
	switchObj.remove();
	checkObj.remove();
	spanObj.remove();
	icoObj.remove();
	//在指定的div中添加
	firstDivObj.append(switchObj);
	firstDivObj.append(checkObj);
	firstDivObj.append(icoObj);
	firstDivObj.append(spanObj);
	
	//隐藏了层次的span
	var spaceStr = "<span style='height:1px;display: inline-block;width:" + (spaceWidth * treeNode.level) + "px'></span>";
	switchObj.before(spaceStr);
	
	var editStr = '';
	
	for (var key in treeNode.attributes) {
		editNode[key] = treeNode.attributes[key];
	}
	editNode.authId = treeNode.id;
	editNode.name = treeNode.name;
	editNode.pId = treeNode.parentId;
	editNode.isParent = treeNode.isParent;
	//宽度需要和表头保持一致
	editStr += '<div class="divTd" style="width:10%">' + (editNode.code == null ? "--" : editNode.code ) + '</div>\
				<div class="divTd" style="width:15%">' + (editNode.createTime == null ? "--" : editNode.createTime ) + '</div>\
				<div class="divTd" style="width:10%">' + (editNode.creatorName == null ? "--" : editNode.creatorName ) + '</div>\
				<div class="divTd" style="width:10%">' + (editNode.state == true ? '<span class="label label-success">正常</span>' : '<span class="label label-warning">禁用</span>' ) + '</div>\
				<div class="divTd" style="width:10%">' + (editNode.isDefault == true ? '<span class="label label-success">是</span>' : '<span class="label label-warning">否</span>' ) + '</div>\
				<div class="divTd" style="width:15%"> \
			        <div class="hidden-sm hidden-xs action-buttons"> \
					    <a class="green" href="javascript:;"> \
						    <i class="ace-icon fa fa-pencil  bigger-130" onclick="biz.edit(\''+encodeURIComponent(JSON.stringify(editNode))+'\')"></i> \
						</a> \
						<a class="red" > \
						<i class="ace-icon fa fa-trash-o  bigger-130" onclick="biz.del(\''+editNode.authId+ '\',\'' +editNode.name+'\',\'' +editNode.isParent+'\')"></i> \
						</a> \
					</div> \
			    </div>';
	aObj.append(editStr);
}