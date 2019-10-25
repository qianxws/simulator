/**
 * log\日志
 * 支持ie8，jquery版本
 * 2017-08-08
 */
function fetchData(page) {
	$('#currentPage').val(page);
	viewModule.fetchData();
};
var viewModule = {
    data: {
        list: [],
        ids: []
    },
    mounted: function () {
        var $this = this;
        // 初始化分页
		htmlPage("pageInfo", 1, 0, 'fetchData', Config.rows);
		$('#keyWord').val('');
        this.fetchData();
        // check all
        var $table = $('#dynamic-table');
        $table.on('click', 'th input[type=checkbox]', function () {
            var th_checked = this.checked;
            $table.find('td input[type=checkbox]').each(function () {
                this.checked = th_checked;
            });
            $this.checkChanged();
        });
    },
	fetchDataTemp : function() {
		$('#currentPage').val(1);
		this.fetchData();
	},
	// 抓取列表数据
    fetchData: function () {
        var $this = this;
        JqdeBox.loading();
        var currentPage = $('#currentPage').val();
        //组织参数
        var params = {
        		'rows' : $('#pageSelect').val(),
    			'page' : currentPage,
    			//获取查询条件：获取操作方式、登录人、执行时间段、操作结果
    			'alias': $('#alias_').val(),
				'userName': $('#user_Name').val(),
				'startTime' : $('#startTime').val(),
				'endTime' : $('#endTime').val()
    		};
        JqdeMods.ajax('logAction', 'getAllLogs', params).then(function (result) {
            JqdeBox.unloading();
            if (result.success) {
            	$('#list').empty();
            	if (result.rows && result.rows.length > 0) {
            		var html_ = "";
            		$(result.rows).each(function(index){
            			var item = this;
            			html_ = '<tr ondblclick="viewModule.edit(eval(this), '+index+')"> \
                            <td>'+item.alias+'</td> \
                            <td>'+item.userName+'</td> \
                            <td class="center">'+item.logtime+'</td> \
                            <td class="center">';
            			 if (item.rep == "正常") {
		                    html_ += '<span class="label label-success">正常</span>';
	      		        } else {
	      		        	html_ += '<span class="label label-warning">失败</span>';
	      				}
            			 var remark = item.remark;
            			 if(remark && remark.indexOf(";")!=-1){
            				 remark = remark.split(";")[0];
            			 }
	         			 html_ += '</td><td>' + (remark || '无') + '</td></tr>';
            			$('#list').append(html_);
            		});
            	}
                htmlPage("pageInfo", currentPage, result.total, 'fetchData');
            } else {
                JqdeBox.message(false, result.message);
            }
        });
    },
};

$(function(){
	viewModule.mounted();
	$("#fetchDataTemp").click(function(){
		viewModule.fetchDataTemp();
	});
	//条件查询回车事件绑定
	inputElementFunc("fetchDataForm", "viewModule.fetchDataTemp");
});