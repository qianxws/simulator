var vm = avalon.define({
    $id: "vm",
    searchFormId:'#fetchDataForm',
	ids : [],
	tbodyList : [],
	pName : [],
	isParent : [],
	init : function (){
//		this.model =$.extend($(this.searchFormId).serializeObject(), this.model);
//		this.options =$.extend($(this.searchFormId).serializeOptions(), this.options);
		avalon.scan(document.getElementById(this.$id));//重新扫描新加入的dom
		
		biz.getTreeList();
		// check all
		var $table = $('#dynamic-table');
		$table.on('click', 'input[type=checkbox]', function() {
			var th_checked = this.checked;
			$table.find('input[type=checkbox]').each(function() {
				this.checked = th_checked;
			});
			$this.checkChanged(th_checked);
		});
	},
	//选中改变
	checkChanged : function(th_checked) {
		if(th_checked){
			vm.ids = [];
			var zTree = $.fn.zTree.getZTreeObj("dataTree");
			zTree.checkAllNodes(true);
			var nodes = zTree.getCheckedNodes(true);
			for ( var i in nodes) {
				if(nodes[i].isParent){
					vm.pName.push(nodes[i].name);
				}
				vm.ids.push(nodes[i].id)
				vm.isParent.push(nodes[i].isParent)
			}
		}else{
			vm.ids = [];
			vm.pName = [];
			vm.isParent = [];
			var zTree = $.fn.zTree.getZTreeObj("dataTree");
			zTree.checkAllNodes(false);
		}
	},
	getTreeList : function() {
		biz.getTreeList();
	},
	add : function() {
		biz.add();
	},
	delSelected : function() {
		biz.delSelectedZtree();
	},
	
})


vm.init();

