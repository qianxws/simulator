var vmEdit = avalon.define({
    $id: "vmEdit",
    formId:'#editForm',
	model : {},
	options:{},
	edit_simTypeArray:[],
	
		init : function() {// 初始化执行
			debugger
			vmEdit.getSimTypeList();
			this.model =$.extend($(this.formId).serializeObject(), this.model);
			this.options =$.extend($(this.formId).serializeOptions(), this.options);
			avalon.scan(document.getElementById(this.$id));//重新扫描新加入的dom
			
			biz.setValid();
			
		
		},
		//产品类型列表
		getSimTypeList:function () {
			JqdeMods.ajax('simTypeAction', 'getList', {}).then(function(result) {
				if (result){
					vmEdit.edit_simTypeArray=result.list;
					/*var list=result.list;
					var select_html = '<option value="">-全部-</option>', value_array = '';
					for (var i in list){
						value_array += list[i].typeId + ",";
						select_html += '<option value="'+list[i].typeId+'">'+list[i].name+'</option>';
					}
					$('#typeselect').html(select_html);*/
				}else {
					JqdeBox.message(false, result.message);
				}
			});
		},
	
	
	
})
