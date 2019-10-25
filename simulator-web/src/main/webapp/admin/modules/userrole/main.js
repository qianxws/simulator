/**
 * role角色模块js
 * 支持ie8，jquery版本
 * 2017-08-09
 */
function fetchData(page) { // // --分页（3）--
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
		htmlPage("pageInfo", 1, 0, 'fetchData', 15);
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
    	$('#dynamic-table').find('input[type=checkbox]:checked').removeAttr('checked');
    	JqdeBox.loading();
    	if ($('#roleName').val() == "" && $('#roleCreator').val() == "" 
    		&& ($('#startTime').val()=="" || $('#endTime').val()=="") && $('#repStatus').val() == "-1") { 
    		$("#data_table").hide();
        	$("#tree_table").show();
        	$("#removeSelected").hide();
//        	$("#copy").hide();
        	this.queryHandler(null);
        	$("#pageInfo").hide();
        	return false;
    	} else {
    		$("#data_table").show();
        	$("#tree_table").hide();
        	$("#removeSelected").show();
//        	$("#copy").show();
        	$("#pageInfo").show();
    	}
        var $this = this;
        this.checkChanged();
        var currentPage = $('#currentPage').val();
        var params = {
			'rows' : $('#pageSelect').val(),
			'page' : currentPage,
			//获取查询条件：获取角色名、创建人、创建时间、状态
			'roleName':$('#roleName').val()==""?"":$('#roleName').val(),
			'roleCreator':$('#roleCreator').val()==""?"":$('#roleCreator').val(),
			'date-range' : $('#startTime').val()=="" || $('#endTime').val()=="" ? "" : $('#startTime').val() + "--" + $('#endTime').val(),
			'repStatus':$('#repStatus').val()==""?"":$('#repStatus').val()
		};
        JqdeMods.ajax( 'roleAction', 'getAllRoles', params).then(function (result) {
            JqdeBox.unloading();
            if (result.success) {
            	$('#list').empty();
            	if (result.rows && result.rows.length > 0) {
            		var html_ = "";
            		viewModule.list = result.rows;
            		$(result.rows).each(function(index){
            			var item = this;
            			html_ = '<tr ondblclick="viewModule.edit(\''+encodeURIComponent(JSON.stringify(item))+'\', '+index+')"> \
		                    <td class="center"> \
		                        <label class="pos-rel"> \
		                            <input type="checkbox" class="ace checkadmin" value="'+item.roleid+'" onclick="viewModule.checkChanged()"/> \
		                            <span class="lbl"></span> \
		                        </label> \
		                    </td> \
	            			<td style="display:none;">'+item.pid+'</td> \
	                        <td style="display:none;">'+item.roleid+'</td> \
	                        <td style="display:none;">'+item.oldCseq+'</td> \
	                        <td>'+item.name+'</td> \
	                        <td class="hidden-480">'+(item.description?item.description:"")+'</td> \
	                        <td>'+item.pname+'</td> \
	                        <td>'+item.cseq+'</td> \
	                        <td class="hidden-480">'+item.createTime+'</td> \
		                    <td>'+item.creatorName+'</td> \
		                     <td class="center">';
		                    if (item.enabled) {
		                    	html_ += '<span class="label label-success">正常</span>';
            		        } else {
            		        	html_ += '<span class="label label-warning">禁用</span>';
            				}
		                    html_ += '</td> \
		                    <td class="center"> \
		                        <div class="hidden-sm hidden-xs action-buttons"> \
		                            <a class="green" href="javascript:;" title="修改"> \
		                                <i class="ace-icon fa fa-pencil  bigger-130" onclick="viewModule.edit(\''+encodeURIComponent(JSON.stringify(item))+'\', '+index+')"></i> \
		                            </a> \
		                            <a class="red" href="javascript:;" title="删除"> \
		                                <i class="ace-icon fa fa-trash-o  bigger-130" onclick="viewModule.remove(\''+item.roleid+'\', '+index+')"></i> \
		                            </a> \
		                        </div> \
		                    </td> \
		                </tr>';
            			$('#list').append(html_);
            		});
            	}
                htmlPage("pageInfo", currentPage, result.total, 'fetchData');
            } else {
                JqdeBox.message(false, result.message);
            }
        });
    },
    // 添加
    add: function () {
        var $this = this;
        JqdeBox.dialog({
            title: '添加角色',
            url: 'modules/role/edit.html',
            init: function () {
                vmEdit.item = {
            		"name": "",
                    "description": "",
                    "pid" : "",
                    "cseq" : "",
                    "enabled": true,
                    "pname": "",
                    "roleid": ""
                };
                //单独设置checkbox选中
				$("input:radio[value='true']").attr('checked',true);
                vmEdit.item.edit = false;
                $("#jqu-enabled").show();
            	$("#vue-enabled").hide();
            	//初始化操作
                vmEdit.mounted();
            },
            confirm: function () { // 确认事件
                if (vmEdit.valid()) {
                    // 后台交互
                    JqdeMods.ajax('roleAction', 'addRole', vmEdit.ajaxPramas).then(function (result) {
                    	if (result.success) {
                    		var currentPage = $('#currentPage').val();
							if (roleName == "" && roleCreator == "" && date_range == "" && repStatus == "-1") {
                    			viewModule.queryHandler(null);
                        	} else {
                        		this.fetchData(currentPage);// 更新页面
                        	}
                            JqdeBox.message(true, '添加成功！');
                        } else {
                            JqdeBox.message(false, result.message);
                        }
                    });

                    return true;
                }else {
                	alert("存在未填项！");
                }
                return false;
            }
        });
    },
    // 修改
    edit: function (item, index) {
        var $this = this;
        JqdeBox.dialog({
            title: '修改角色',
            url: 'modules/role/edit.html',
            init: function () {
            	vmEdit.item = $.extend({}, eval("(" + decodeURIComponent(item) + ")"));
				vmEdit.item.edit = true;
        		// 编辑时填充表单
        		var f = $("#roleVmEdit").find('form');
        		for (var key in vmEdit.item) {
        			if (key == "enabled") {
                    	// 单独设置checkbox选中
        				$("input:radio[value='"+vmEdit.item.enabled+"']").attr('checked',true);
        			} else {
        				f.find('input[name='+key+']').val(vmEdit.item[key]);
        			}
        		}
        		$("#jqu-enabled").show();
                $("#vue-enabled").hide();
            	//用户权限的初始化操作
                vmEdit.mounted();
            },
            confirm: function () {
                if (vmEdit.valid()) {
                    // 后台交互
                    JqdeMods.ajax('roleAction', 'updateRole', vmEdit.ajaxPramas).then(function (result) {
                        if (result.success) {
                        	var currentPage = $('#currentPage').val();
                        	if ($('#roleName').val() == "" && $('#roleCreator').val() == "" 
                        		&& ($('#startTime').val()=="" || $('#endTime').val()=="") && $('#repStatus').val() == "-1") { 
                    			viewModule.queryHandler(null);
                        	} else {
                        		this.fetchData(currentPage);// 更新页面
                        	}
                            JqdeBox.message(true, '修改成功！');
                        } else {
                            JqdeBox.message(false, result.message);
                        }
                    });
                    return true;
                }
                return false;
            }
        });
    },
    // 删除
    remove: function (item, index) {
        var $this = this;
        JqdeBox.confirm('您确定要删除吗？', function (result) {
            if (result) {
                // 后台交互
                JqdeMods.ajax('roleAction', 'deleteRole', {"ids": [item]}).then(function (result) {
                    if (result.success) {
                    	var currentPage = $('#currentPage').val();
                    	if ($('#roleName').val() == "" && $('#roleCreator').val() == "" 
                    		&& ($('#startTime').val()=="" || $('#endTime').val()=="") && $('#repStatus').val() == "-1") { 
                			viewModule.queryHandler(null);
                    	} else {
                    		this.fetchData(currentPage);// 更新页面
                    	}
                        JqdeBox.message(true, '删除成功！');
                    } else {
                        JqdeBox.message(false, result.message);
                    }
                });
            }
        });
    },
    // 删除选中
    removeSelected: function () {
        var $this = this;
        var ids = $this.ids;
        JqdeBox.confirm('您确定要删除吗？', function (result) {
            if (result) {
                // 后台交互
                JqdeMods.ajax('roleAction', 'deleteRole', {"ids": ids}).then(function (result) {
                    if (result.success) {
                    	var currentPage = $('#currentPage').val();
                    	if (roleName == "" && roleCreator == "" && date_range == "" && repStatus == "-1") {
                			viewModule.queryHandler(null);
                    	} else {
                    		this.fetchData(currentPage);// 更新页面
                    	}
                        JqdeBox.message(true, '删除成功！');
                    } else {
                        JqdeBox.message(false, result.message);
                    }
                });
            }
        });
    },
    // 复制
	copy : function() {
		var $this = this;
		var roleId_ = $this.ids;
		if (roleId_.length > 1) {
			alert("只能选择一条记录！");
			return false;
		}
		JqdeBox.dialog({
			title : '添加角色',
			url : 'modules/role/edit.html',
			init : function() {
				var list_ = $this.list;
				for (var i = 0; i < list_.length; i++) {
					if (list_[i].roleid == roleId_[0]) {
						vmEdit.item = $.extend({}, list_[i]);
						vmEdit.item.edit = true;
						break;
					}
				}
        		//复制添加时填充表单
        		var f = $("#roleVmEdit").find('form');
        		for (var key in vmEdit.item) {
        			if (key == "enabled") {
                    	//单独设置checkbox选中
        				$("input:radio[value='"+vmEdit.item.enabled+"']").attr('checked',true);
        			} else {
        				f.find('input[name='+key+']').val(vmEdit.item[key]);
        			}
        		}
                $("#jqu-enabled").show();
            	$("#vue-enabled").hide();
            	//用户权限的初始化操作
                vmEdit.mounted();
			},
			confirm : function() {
				if (vmEdit.valid()) {
					// 后台交互
					JqdeMods.ajax('roleAction', 'addRole', vmEdit.ajaxPramas).then(function(result) {
						if (result.success) {
							var currentPage = $('#currentPage').val();
							this.fetchData(currentPage);// 更新页面
							JqdeBox.message(true, '添加成功！');
						} else {
							JqdeBox.message(false, result.message);
						}
					});
					return true;
				}
				return false;
			}
		});
	},
    //选中改变
    checkChanged: function () {
        var ids = [];
        $('#dynamic-table').find('td input[type=checkbox]').each(function () {
            if (this.checked) {
                ids.push(this.value);
            }
        });
        this.ids = ids;
        if (ids.length > 0) {
        	 $("#removeSelected").removeAttr("disabled");
//        	 $("#copy").removeAttr("disabled");
        } else {
        	$("#removeSelected").attr('disabled', "true");
//        	$("#copy").attr('disabled', "true");
        }
    },
    //初始化tree_table列表
    queryHandler: function(zTreeNodes){
    	//初始化树
    	$.fn.zTree.init($("#dataTree"), setting, zTreeNodes);
    	JqdeBox.unloading();
    	//添加表头
    	var li_head = ' <li class="head"><a> \
    		<div class="divTh no-border-left" style="width:15%">角色名称</div> \
    		<div class="divTh" style="width:15%">角色描述</div> \
    	 	<div class="divTh" style="width:12%">父节点名称</div> \
    		<div class="divTh" style="width:8%">排序</div> \
    	 	<div class="divTh" style="width:14%">创建日期</div> \
    	 	<div class="divTh" style="width:12%" class="center">创建人</div> \
    	 	<div class="divTh" style="width:12%" class="center">状态</div> \
    	 	<div class="divTh" style="width:12%">操作</div> \
    	 	</a></li>';
    	var rows = $("#dataTree").find('li');
    	if (rows.length > 0) {
    	 	rows.eq(0).before(li_head)
    	} else {
    	 	$("#dataTree").append(li_head);
    	 	//$("#dataTree").append('<li ><div style="text-align: center;line-height: 38px;" >暂无数据</div></li>')
    	}
    }
};

var setting = {
 	view: { showLine: false, addDiyDom: addDiyDom },
 	data: { simpleData : { enable : true, idkey : "id", pIdkey : "pId", rootPid : 0 } },
	async: {
		enable : true,
		url : "commMods/ajax?action=roleAction&verb=getWithTreeTable", // 根据pid查询对应值集合
		autoParam : [ "id", "pId" ],
		otherParam : {"ids": "","page": "1","rows": "9999","enabled": true},
		type : "post",
		dataFilter : null
	}
 	//,check: { enable : true, chkboxType : { "Y": "", "N": "" } }
};

var editNode = {};

/**
 * 自定义DOM节点
 */
function addDiyDom(treeId, treeNode) {
	var spaceWidth = 15;
	var liObj = $("#" + treeNode.tId);
	var aObj = $("#" + treeNode.tId + "_a");
	var switchObj = $("#" + treeNode.tId + "_switch");
	//var checkObj = $("#" + treeNode.tId + "_check");
	var icoObj = $("#" + treeNode.tId + "_ico");
	var spanObj = $("#" + treeNode.tId + "_span");
	aObj.attr('title', '');
	aObj.append('<div class="divTd" style="width:15%"></div>');
	var div = $(liObj).find('div').eq(0);
	//从默认的位置移除
	switchObj.remove();
	//checkObj.remove();
	spanObj.remove();
	icoObj.remove();
	//在指定的div中添加
	div.append(switchObj);
	div.append(spanObj);
	//隐藏了层次的span
	var spaceStr = "<span style='height:1px;display: inline-block;width:" + (spaceWidth * treeNode.level) + "px'></span>";
	switchObj.before(spaceStr);
	//图标垂直居中
	icoObj.css("margin-top","11px");
	switchObj.css("margin-top","-3px");
	switchObj.after(icoObj);//checkObj
	//checkObj.after(icoObj);
	var editStr = '';
	
	for (var key in treeNode.attributes) {
		editNode[key] = treeNode.attributes[key];
	}
	editNode.roleid = treeNode.id;
	editNode.name = treeNode.name;
	editNode.pid = treeNode.pid;
	if(!treeNode.attributes["description"]){
		editNode["description"] = "";
	}
	//宽度需要和表头保持一致
	editStr += '<div class="divTd" style="width:15%">' + (editNode.description == null ? "--" : editNode.description ) + '</div>';
	editStr += '<div class="divTd" style="width:12%">' + (editNode.pname == null ? "--" : editNode.pname ) + '</div>';
	editStr += '<div class="divTd" style="width:8%">' + (editNode.cseq == null ? "--" : editNode.cseq ) + '</div>';
	editStr += '<div class="divTd" style="width:14%">' + (editNode.createTime == null ? "--" : editNode.createTime ) + '</div>';
	editStr += '<div class="divTd" style="width:12%">' + (editNode.creatorName == null ? "--" : editNode.creatorName ) + '</div>';
	editStr += '<div class="divTd" style="width:12%">' + (editNode.enabled == 1 ? '<span class="label label-success">正常</span>' : '<span class="label label-warning">禁用</span>' ) + '</div>';
	editStr += '<div class="divTd" style="width:12%"> \
			        <div class="hidden-sm hidden-xs action-buttons"> \
					    <a class="green" href="javascript:;"> \
						    <i class="ace-icon fa fa-pencil  bigger-130" onclick="viewModule.edit(\'' + encodeURIComponent(JSON.stringify(editNode)) + '\',\'' + editNode.roleid + '\')"></i> \
						</a> \
						<a class="red" > \
						    <i class="ace-icon fa fa-trash-o  bigger-130" onclick="viewModule.remove(\'' + editNode.roleid + '\',\'' + editNode.roleid + '\')"></i> \
						</a> \
					</div> \
			    </div>';
	aObj.append(editStr);
}

$(function(){
	//初始化控件
	viewModule.mounted();
	//添加事件
	$("#add").click(function(){
		viewModule.add();
	});
	//删除事件
	$("#removeSelected").click(function(){
		viewModule.removeSelected();
	});
	//刷新事件
	$("#fetchData").click(function(){
		viewModule.fetchData();
	});
//	//复制添加事件
//	$("#copy").click(function(){
//		viewModule.copy();
//	});
	//条件查询事件
	$("#fetchDataTemp").click(function(){
		viewModule.fetchDataTemp();
	});
	//条件查询回车事件绑定
	inputElementFunc("fetchDataForm", "viewModule.fetchDataTemp");
});