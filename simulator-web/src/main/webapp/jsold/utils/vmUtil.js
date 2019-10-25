var vmUtil = {
	divTable:'#dynamic-table',
	// 选中改变
	checkChanged : function() {
		vm.ids=[];
		vm.hallIds=[];
//		vm.deviceIds=[];
		$(vmUtil.divTable).find('td input[type=checkbox]').each(function() {
			if (this.checked) {
				vm.ids.push(this.id);
				vm.hallIds.push($(this).attr("hall_Id"));
//				vm.deviceIds.push(this.id);
			}
		}); 
	},
	// 清空选中
	clearChecked: function() {
		$(vmUtil.divTable).find('input[type=checkbox]:checked').removeAttr('checked');
    	vm.ids = [];
	},
	// 选中全部
	checkAll: function() {
		$(vmUtil.divTable).on('click', 'th input[type=checkbox]', function() {
			var th_checked = this.checked;
			$(vmUtil.divTable).find('td input[type=checkbox]').each(function() {
				this.checked = th_checked;
			});
			vmUtil.checkChanged();
		});
	}
}

var vmEditUtil = {
	divForm:'#validation-form',
	// 验证表单
	valid : function() {
		return $(vmEditUtil.divForm).valid();
	},
	datePicker: function (elementId,fmt) {
        WdatePicker({
            el: elementId,
            dateFmt: fmt,//日期格式，可以只显示年或年月，也可以额外显示时间
            onpicked: function () {
                vmEdit.item[elementId] = $("#" + elementId).val();
            },
            oncleared: function () {
            	vmEdit.item[elementId] = null;
            },
            isShowClear: true
        });
    },
	//更新item,例如： 使vue兼容Wdate时间时使用
	updateItem : function(inputName) {
		vmEdit.item[inputName] = $(vmEditUtil.divForm).find('[name='+inputName+']').val();
	}
}



