var vmEdit = avalon.define({
    $id: "vmEdit",
    formId:'#validation-form',
	model : {state:1,isDefault:false},
	options:{},
	init : function() {
		this.model =$.extend($(this.formId).serializeObject(), this.model);
		this.options =$.extend($(this.formId).serializeOptions(), this.options);
		avalon.scan(document.getElementById(this.$id));//重新扫描新加入的dom
		
		
		vmEditTree.init();
		biz.setValid();
	},

})
//off()局部 解绑，防止出现多次循环的问题 
$('#home').off().click(function(e) {
	//参数顺序为：操作的DIVid，inputId，按钮Id，类型, ztree树Id
	ztreeShowOrHide(e, "authTree", "pname", "authTreeBtn", true, "authsTree");
});
