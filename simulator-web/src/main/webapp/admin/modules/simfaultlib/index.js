var vm = avalon.define({
    $id: "vm",
    tableId:'#listTable',
    searchFormId:'#searchForm',
	list : [],
	ids : [],
	model:{},
	options:{},
	simTypeArray:[],
	init : function (){
		this.model =$.extend($(this.searchFormId).serializeObject(), this.model);
		this.options =$.extend($(this.searchFormId).serializeOptions(), this.options);
		avalon.scan(document.getElementById(this.$id));//重新扫描新加入的dom

		vmCheckUtil.init();
		vmPageUtil.init();
		biz.getList();
		biz.getSimTypeList();
	},
	//列表
	getList:function (page) {
		biz.getList(page);
	},
	// 添加
	add : function() {
		biz.add();
	},
	// 修改
	edit : function(item) {
		biz.edit(item);
	},
	// 删除
	del : function(item) {
		biz.del(item);
	},
	// 删除选中
	delSelected : function() {
		biz.delSelected();
	},	
})


vm.init();
