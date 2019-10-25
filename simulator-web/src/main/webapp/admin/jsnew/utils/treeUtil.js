//树型层级和节点id
var doubleTreeUtil = {
		
		showAll:false,//true:查询全部;false:查询选中节点
		nodeLevel:null, nodeId:null, tabType:null, hasChecked:false, href_data:{},
		provinceTreeVerb:null, nodeId:null,
		//加载左侧树型结构
		initTree:function (maxProvinceLevel,maxCompanyLevel) {
			
			maxProvinceLevel=maxProvinceLevel==null?3:maxProvinceLevel;
			maxCompanyLevel=maxCompanyLevel==null?2:maxCompanyLevel;
			doubleTreeUtil.nodeLevel=null;
			doubleTreeUtil.nodeId=null;
			doubleTreeUtil.tabType=null;
			doubleTreeUtil.hasChecked=false;
			doubleTreeUtil.href_data={};
			var parm = window.location.hash;
			parm = parm.substring(parm.indexOf('?') + 1);
			var parm_array = parm.split("&");
			for ( var i in parm_array) {
				var array = parm_array[i].split("=");
				doubleTreeUtil.href_data[array[0]] = array[1];
			}
			//位置树
			var localSet = {
				view : { dblClickExpand : false, showLine : true, expandSpeed : 100},
				data : { simpleData : { enable : true, idkey : "id", pIdkey : "parentId", rootPid : 0 } },
				callback : {beforeClick : doubleTreeUtil.treeClick, onAsyncSuccess: doubleTreeUtil.onAsyncSuccess},
				async: {
					enable : true,
					url : "commMods/ajax?action=treeAction&verb=getProvinceTree&token="+token+"&maxLevel="+maxProvinceLevel, // 根据pid查询对应值集合
					autoParam : [ "id", "parentId", 'level'],
					type : "post",
					dataFilter : null
				}
			};
			$.fn.zTree.init($("#hallTree"), localSet);
			
			//影院树
			var cinemaSet = {
				view : { dblClickExpand : false, showLine : true, expandSpeed : 100},
				data : { simpleData : { enable : true, idkey : "id", pIdkey : "parentId", rootPid : 0 } },
				callback : {beforeClick : doubleTreeUtil.treeClick},
				async: {
					enable : true,
					url : "commMods/ajax?action=treeAction&verb=getCompanyTree&token="+token+"&maxLevel="+maxCompanyLevel, // 根据pid查询对应值集合
					autoParam : [ "id", "parentId", 'level'],
					type : "post",
					dataFilter : null
				}
			}
			$.fn.zTree.init($("#cinemaTree"), cinemaSet);
			doubleTreeUtil.switchTree();
		},
		//切换树
		switchTree:function () {
			$('.widget-title').on('click', function(event) {
				$('.widget-header').find('.active').removeClass('active');
				var target = $(event.target); 
				target.addClass('active');
				if (target.attr('ul-id') == 'hallTree'){
					$('#hallTree').show();
					$('#cinemaTree').hide();
					treeId="hallTree";
				}else {
					$('#hallTree').hide();
					$('#cinemaTree').show();
					treeId="cinemaTree";
				}
				if(doubleTreeUtil.showAll){
					treeNode ="";
					$("#cinemaTree  li a").removeClass("curSelectedNode");
					$("#hallTree  li a").removeClass("curSelectedNode");
				}
				else{
					var my_tree = $.fn.zTree.getZTreeObj(treeId);
					var nodes = my_tree.getNodes();
					treeNode = nodes[0];
					my_tree.selectNode(treeNode);
				}
				doubleTreeUtil.treeClick(treeId, treeNode);
			});
		},
		//树点击事件
		treeClick:function (treeId, treeNode) {
			doubleTreeUtil.nodeLevel = treeNode.level;
			doubleTreeUtil.nodeId = treeNode.id;
			doubleTreeUtil.tabType = treeId;
			doubleTreeUtil.hasChecked = true;
			if(typeof vm.treeClick==='function'){
				vm.treeClick(treeNode);
			}
		},
		//加载树型结构以后(或者切换显示树后执行)
		onAsyncSuccess:function (tree, treeId, pNode, data){
			if (doubleTreeUtil.hasChecked){
				return false;
			}
			var my_tree = $.fn.zTree.getZTreeObj(treeId);
			var nodes = my_tree.getNodes();
			if (nodes.length > 0){
				if (doubleTreeUtil.href_data.cinemaId){
					if (!pNode){
						var node = my_tree.getNodeByParam('id', doubleTreeUtil.href_data.provinceId);
						my_tree.expandNode(node, true);
						//setting.callback.onClick = onClick;
					}else if (pNode.level == 0){
						var node = my_tree.getNodeByParam('id', doubleTreeUtil.href_data.cityId);
						my_tree.expandNode(node, true);
					}else if (pNode.level == 1){
						var node = my_tree.getNodeByParam('id', doubleTreeUtil.href_data.cinemaId);
						my_tree.selectNode(node, true);
						doubleTreeUtil.nodeLevel = node.level;
						doubleTreeUtil.nodeId = node.id;
						doubleTreeUtil.tabType = 'hallTree';
						//加载数据
						vm.getList();
					}
				}else {
					if(doubleTreeUtil.showAll){
						doubleTreeUtil.nodeLevel = "";
						doubleTreeUtil.nodeId = "";
						doubleTreeUtil.tabType = '';
					}
					else{
						var node = nodes[0];
						my_tree.selectNode(node);
						doubleTreeUtil.nodeLevel = node.level;
						doubleTreeUtil.nodeId = node.id;
						doubleTreeUtil.tabType = 'hallTree';	
					}
					vm.getList();
				}
			}
		}
}






