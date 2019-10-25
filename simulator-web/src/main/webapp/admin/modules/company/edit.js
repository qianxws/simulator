var vmEdit = avalon.define({
    $id: "vmEdit",
    formId:'#editForm',
	model : {},
	options:{},
	init : function() {
		this.model =$.extend($(this.formId).serializeObject(), this.model);
		this.options =$.extend($(this.formId).serializeOptions(), this.options);
		avalon.scan(document.getElementById(this.$id));//重新扫描新加入的dom
		
		biz.getProvinceOptions(this.options);
		biz.setValid();
		if(isNotBlank(this.model.provinceId)){
			biz.getCityOptions(this.options,this.model.provinceId);
		}
	},
	onProvinceChanged : function() {
		biz.getCityOptions(this.options,this.model.provinceId);
	},
})
