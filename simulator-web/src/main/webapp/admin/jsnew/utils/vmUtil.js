/**
 * 列表分页
 *
 * @param divId
 * @param currentPage
 *            当前页 page
 * @param pageSize
 *            每页数量 rows
 * @param totalNumber
 *            总页数
 * @param func
 *            方法
 * @param view
 *            显示页数
 */
var vmPageUtil={
		//初始化分页
		init:function (rows,divId) {
			rows=rows||Config.rows;
			divId=divId||"pageInfo";
			this.show(1, 0, '', rows);
		},
		//显示分页
		show:function (currentPage, totalNumber, func, pageSize,divId) {
			divId=divId||"pageInfo";
		    currentPage = parseInt(currentPage);
		    totalNumber = parseInt(totalNumber);
		    if(pageSize == undefined) pageSize = parseInt($('#pageSelect').val());
		    // 如果没有数据，显示共一页
		    if (totalNumber == 0) {
		        totalNumber = 0;
		    }
		    var totalPage = Math.floor(totalNumber/pageSize) + (totalNumber%pageSize > 0 ? 1 : 0);
		    // 分页数
		    var showPage = '<select id="pageSelect" class="form-control input-sm" onchange="'+ func +'(1);" style="width: 55px; float: left; margin: 3px 0px; height: 25px; ">' +
		        '<option value="5">5</option><option value="10">10</option><option value="15" selected>15</option><option value="25">25</option><option value="50">50</option>' +
		        '</select>';
		    // 总条数显示
		    var stotal = (currentPage-1)*pageSize;
		    var etotal = currentPage*pageSize;
		    if (totalNumber < etotal){
		    	etotal = totalNumber;
		    }
		    if(totalNumber < pageSize) etotal = totalNumber;
		    stotal++;
		    showPage += '<div style="float: left; margin: 5px 15px;">显示'+ stotal +'-'+ etotal +'条，共<span> '
		        + Math.floor(totalNumber) + ' </span>条<input id="currentPage" value="'+ currentPage +'" type="hidden"/></div>';
		    if(totalNumber <= pageSize) {
		        // 如果总条数小于分页数
		        $("#" + divId).html(showPage);
		        $('#pageSelect').val(pageSize);
		        if(pageSize != undefined) $('#pageSelect').val(pageSize);
		        return;
		    }
		    /**
		     * 分页详细
		     */
		    var view = 5;// 显示多少个页码
		    if (!isNotBlank(view)) {
		        view = 5;
		    }
		    showPage += '<ul class="pagination pull-right no-margin">';
		    // 首页
		    if (totalPage > view && currentPage > Math.floor(view/2)+1) {
		        showPage += "<li class=\"paginate_button\"><a href=\"javascript:void(0)\" ";
		        showPage += "onclick=\"" + func + "(1)\">首页</a></li>";
		    }
		    var s = 0; // 从第几个页码开始
		    var e = 0; // 到第几个页码结束
		    if (Math.floor(currentPage) <= DivMath(view, 2) + 1) {
		        s = 1;
		    } else {
		        s = Math.floor(currentPage) - DivMath(view, 2);
		    }
		    if (s + view - 1 >= Math.floor(totalNumber)) {
		        e = Math.floor(totalNumber);
		    } else {
		        e = s + view - 1;
		    }
		    if (e >= totalPage) {
		        s = s-(e-totalPage);
		        e = totalNumber;
		    }
		    if (s <= 0) {
		        s = 1;
		    }
		    // 中间页数
		    for ( var i = s; i <= e; i++) {
		        if (Math.floor(currentPage) == i) {
		            showPage += ' <li class="paginate_button active"><a href="javascript:void(0);" onclick="'
		                + func + '(' + i + ')">' + (i) + '</a></li>';
		        } else {
		            if(i <= totalPage){
		                showPage += ' <li class="paginate_button"><a href="javascript:void(0);" onclick="' + func + '('
		                    + i + ')">' + (i) + '</a></li>';
		            }
		        }
		    }
		    if (totalPage > view && e < totalPage) {
		        showPage += "<li class=\"paginate_button\"><a href=\"javascript:void(0)\" ";
		        showPage += 'onclick=\"' + func + '(' + totalPage + ')\">尾页</a></li>';
		    }
		    showPage += '</ul>';
		    $("#" + divId).html(showPage);
		    $('#pageSelect').val(pageSize);
		    $('#currentPage').val(currentPage);
		}

}

var vmCheckUtil = {
		// 选中全部
		init: function() {
			$this=this;
			$(vm.tableId).on('click', 'th input[type=checkbox]', function() {
				var th_checked = this.checked;
				$(vm.tableId).find('td input[type=checkbox]').each(function() {
					this.checked = th_checked;
				});
				$this.checkChanged();
			});
		},
		// 选中改变
		checkChanged : function() {
			vm.ids=[];
			vm.hallIds=[];
			$(vm.tableId).find('td input[type=checkbox]').each(function() {
				if (this.checked) {
					vm.ids.push(this.id);
				}
			}); 
		},
		// 清空选中
		clearChecked: function() {
			$(vm.tableId).find('input[type=checkbox]:checked').removeAttr('checked');
	    	vm.ids = [];
		}
	}

var vmEditDateUtil = {
	datePicker: function (elementId,fmt) {
        WdatePicker({
            el: elementId,
            dateFmt: fmt,//日期格式，可以只显示年或年月，也可以额外显示时间
            onpicked: function () {
                vmEdit.model[elementId] = $("#" + elementId).val();
            },
            oncleared: function () {
            	vmEdit.model[elementId] = '';
            },
            isShowClear: true
        });
    },
}



