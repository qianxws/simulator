var vmEdit = avalon.define({
    $id: "vmEdit",
    formId:'#editForm',
	model : {},
	options:{},
    dependencys : [],
	init : function() {
		this.model =$.extend($(this.formId).serializeObject(), this.model);
		this.options =$.extend($(this.formId).serializeOptions(), this.options);
		avalon.scan(document.getElementById(this.$id));//重新扫描新加入的dom

		biz.getDependencyList();
		biz.setValid();
	},
})
