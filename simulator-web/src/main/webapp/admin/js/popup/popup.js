//复用此功能需有参数：flowway，flowid，issome；流程配置文件；
//弹窗
//定义回调函数
var callback;
var userid = "";
//实施人员
var userArr = [",", ","];
//审批人员
var approveArr = [",", ","];
//辅助人员
var staffArr = [",", ","];
//上传文件集合
var files = [",",","];
//辅助部门数据
var staffOrg = "";
//部门数据
var customerId = "";
var idLists;
//任务添加页面附件ul的id
var attrsId = "";
//set任务类型/节点名称
var flowName = "";
var flowKey = "";
var popover = {
	//指派人员弹窗（单选）
	inputassignUser : function (title_){
		show_projectLeader(title_);
	},
	//指派项目负责人弹窗（单选）
	getLeader : function (title_){
		show_leader(title_);
	},
	//指派实施人员弹窗(多选)
	assignUsers : function (title_){
		show_assignUser(title_);
	},
	//添加联系人弹窗
	addClientLinkman : function (title_){
		show_addClientLinkman(title_);
	},
	//添加辅助人员弹窗
	addAuxiliaryUser : function(){
		show_addAuxiliaryUser();
	},
	//指派辅助人员弹窗
	AuxiliaryUser : function(){
		//orgname可为空
		show_AuxiliaryUser();
	}
};

//显示添加联系人
function show_addClientLinkman(title_){
     JqdeBox.dialog({
         title: title_,
         url: 'js/popup/addLink.html',
         init: function(){
        	 linkVmEdit.item = {
         		"name": "",
                "phone": "",
                "address" : "",
                "position" : "",
             };
             linkVmEdit.mounted();
             $("#linkCustomerId").val(customerId);
         },
         confirm: function(){ // 确认事件
             if (linkVmEdit.valid()) { 
                 // 后台交互
                 JqdeMods.ajax('contactsAction', 'addContactss', linkVmEdit.ajaxPramas).then(function (result) {
                 	if (result.success) {
                 		getContactss();//刷新联系人下拉
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
}

var outsourceOrgId = "";
var outsourceOrgName = "";
//添加辅助人员
function addAuxiliaryUser(){
	outsourceOrgId = $("#orgName").val();
	outsourceOrgName = $("#orgName option:selected").text();
	if (outsourceOrgId && outsourceOrgId != "") {
		//调用公共的添加联系人
		popover.addAuxiliaryUser();
	} else {
		alert("请先选择外协单位");
	}
}

//显示辅助人员
function show_addAuxiliaryUser(){
     JqdeBox.dialog({
         title: '添加辅助人员',
         url: 'js/popup/addtask_link.html',
         init: function(){
        	 linkVmEdit.item = {
         		"name": "",
                "phone": "",
                "address" : "",
                "position" : "",
             };
             linkVmEdit.mounted();
             $("#outsourceOrgId").val(outsourceOrgId);
         },
         confirm: function(){ // 确认事件
             if (linkVmEdit.valid()) { 
                 // 后台交互
                 JqdeMods.ajax('outsourceStaffAction', 'addOutsourceStaff', linkVmEdit.ajaxPramas).then(function (result) {
                 	if (result.success) {
                 		var value = result.staff.outsourceStaffId;
                 		var text = result.staff.name + "[" + outsourceOrgName + "]";
                 		//缓存新加辅助人
						var subM = {
								value : value, 
								text : text
							};
						shareMap.push(subM);
                 		$('#selectLeft').append('<option value="'+value+'">'+text+'</option>');
                 		outsourceOrgId = "";
                 		outsourceOrgName = "";
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
}

//指派负责人
function show_projectLeader(title_){
	JqdeBox.dialog({
        title: title_,
        url: 'js/popup/assignUser.html',
        init : function(){
        	//初始化selectLeft数据
        	getOrgIdsNames();
	  	 	$("#addAuxiliaryUser").hide();
	  	 	$("#OutSourceOrg").hide();
            $("#search").hide();
            issome = "false";
        },
        confirm: function(){
        	// 确认事件
        	if(shareArr[1] != ","){
        		$("#leadUserName").html(flushStr(shareArr[1]));
        		$("#leadUser").val(flushStr(shareArr[0]));
        	}
        }
    });	
}

//指派负责人(choose two)
function show_leader (title_){
	JqdeBox.dialog({
        title: title_,
        url: 'js/popup/assignUser.html',
        init : function(){
        	inputElementFunc("fetchDataForm", "setUserSelectLeft");
        	//初始化selectLeft数据
        	getOrgIdsNames();
	  	 	if(implLeader[0] != ","){
	  	 		addRightSelectFunc("selectRight", implLeader);
	  	 		recordShareIdsFunc("selectRight", shareArr);
	  	 	}
	  	 	$("#addAuxiliaryUser").hide();
	  	 	$("#OutSourceOrg").hide();
            $("#search").hide();
        },
        confirm: function(){ // 确认事件
        	setOrg();//获取选中的单位
//        	$("#applicantId").val(taskinfo.userId);
//    		$("#applicantName").val(taskinfo.name);
        	implLeader = ulAddLi("ulLeaders");
        }
    });	
}

//指派实施人员页面
function show_assignUser (title_){
	JqdeBox.dialog({
        title: title_,
        url: 'js/popup/assignUser.html',
        init : function(){
        	//初始化selectLeft数据
        	//条件查询回车事件绑定
        	inputElementFunc("fetchDataForm", "setUserSelectLeft");
        	getOrgIdsNames();
	  	 	if(userArr[0] != ","){
	  	 		addRightSelectFunc("selectRight", userArr);
	  	 		recordShareIdsFunc("selectRight", shareArr);
	  	 	}
	  	 	$("#addAuxiliaryUser").hide();
	  	 	$("#OutSourceOrg").hide();
            $("#search").hide();
        },
        confirm: function(){ // 确认事件
        	setOrg();//获取选中的单位
        	userArr = ulAddLi("ulUsers");
        	//验证实施人员是否存在,任务添加页面
        	if (userArr[0] != ",") {
        		$("#ulUsers_span1").hide();
        	}
//        	if(callback != null){
//        		callback();
//        	}
        }
    });	
}

//指派辅助人员页面
function show_AuxiliaryUser(){
	JqdeBox.dialog({
        title: '指定辅助人员',
        url: 'js/popup/assignUser.html',
        init : function(){
        	inputElementFunc("fetchDataForm", "searchName_Task");
        	//初始化数据select左侧数据
        	getOutsourceOrg();
	  	 	if(staffArr[0] != ","){
	  	 		addRightSelectFunc("selectRight", staffArr);
	  	 		recordShareIdsFunc("selectRight", shareArr);
	  	 	}
	  	 	$("#org").hide();
	  	 	$("#search_").hide();
        },
        confirm: function(){ // 确认事件
        	setOrg();//获取选中的单位
        	staffArr = ulAddLi("ulAuxiliaryUser");
        	//验证辅助人员是否存在  任务添加页面
        	if (staffArr[0] != ",") {
        		$("#ulAuxiliaryUser_span1").hide();
        	}
        }
        	
    });	
}

//获取选中的单位
function setOrg(){
	var clientOrgId = $("#orgName").val();
	var clientOrgName = $("#orgName option:selected").text();
	staffOrg = clientOrgId + "," + clientOrgName;
}

//根据ul标签的Id在页面拼接选择确定的用户名
function ulAddLi (ulId) {
	if (shareArr[1] != ",") {
		var names = flushStr(shareArr[1]);
		var NameLists = names.split(",");
		var ids = flushStr(shareArr[0]);
		idLists = ids.split(",");
		var html = "";
		$("#" + ulId).empty();
		for (var i in NameLists) {
			html += "<li id="+ulId+"_"+i+">"+ NameLists[i] +"<i onclick=\"removeLi('"+ulId+"_"+i+"','"+ NameLists[i] +"','"+ idLists[i] +"')\">×</i></li>";
		}
		$("#" + ulId).append(html);
	} else {
		$("#" + ulId).empty();
	}
	return shareArr;
}

//删除指定实施人
function removeLi (id_, name, id) {
	if (confirm("确认移除吗?")) {
		// 项目负责人
		if (id_.indexOf("ulLeaders") != -1) {
			if(implLeader[0].indexOf("," + id + ",") != -1){
				implLeader[0] = implLeader[0].replace("," + id + ",", ",");
				implLeader[1] = implLeader[1].replace("," + name + ",", ",");
			}
		}
		// 外协人员
		if (id_.indexOf("ulAuxiliaryUser") != -1) {
			if(staffArr[0].indexOf("," + id + ",") != -1){
				staffArr[0] = staffArr[0].replace("," + id + ",", ",");
				staffArr[1] = staffArr[1].replace("," + name + ",", ",");
			}
			//添加外协人员验证
			if (staffArr[0] == ",") {
        		$("#ulAuxiliaryUser_span1").show();
        	}
		}
		// 实施人员
		if (id_.indexOf("ulUsers") != -1) {
			if(userArr[0].indexOf("," + id + ",") != -1){
				userArr[0] = userArr[0].replace("," + id + ",", ",");
				userArr[1] = userArr[1].replace("," + name + ",", ",");
			}
			//验证实施人员是否存在 任务添加页面
        	if (userArr[0] == ",") {
        		$("#ulUsers_span1").show();
        	}
		}
		
		// 审批人员
		if (id_.indexOf("ulApps") != -1) {
			if(approveArr[0].indexOf("," + id + ",") != -1){
				approveArr[0] = approveArr[0].replace("," + id + ",", ",");
				approveArr[1] = approveArr[1].replace("," + name + ",", ",");
			}
			//验证实施人员是否存在 任务添加页面
        	if (approveArr[0] == ",") {
        		$("#checkApp").show();
        	}
		}
		
		removeOk = false;
		$("#" + id_).remove();
	}
}

//添加附件
function add_att(){
	attrsId = "attrs";
	UploadAttach.addFileCommon(function (data){
		if (data.success){
			//添加附件成功，页面拼接
			add_attHtml(data.relativePath, data.fileName, data.oldName); 
		}
		//验证是否存在附件  任务添加页面
		if (files[0] != ",") {
			$("#attrs_span").hide();
		}
	});
}
var attrId = 1; 
//只适用于图片
function add_image() {
	attrsId = "attrs";
	UploadAttachs.addFileCommons(function (data){
		if (data.success){
			add_attHtml_img(data.relativePath, data.fileName, data.oldName, data.subNamePath);
		}
		//验证是否存在附件  任务添加页面
		if (files[0] != ",") {
			$("#attrs_span").hide();
		}
	});
}
function add_attHtml_img(relativePath, fileName, oldName, subNamePath){
	var path = relativePath + "/" + fileName;
	files[0] = files[0] + subNamePath + ",";
	files[1] = files[1] + oldName + ",";
	var attach_html = "<li id='"+attrId+"'>"+"<img alt='"+oldName+"' src='"+subNamePath+"' onclick=searchImg('"+subNamePath+"')>"+"&nbsp&nbsp&nbsp&nbsp"+ oldName+"<a class='red' href='javascript:;'><i class='ace-icon fa fa-trash-o  bigger-130' style='float:right;width:7%;' onclick=\"removeAttFunc('"+attrId+"','"+ path +"','"+ oldName +"','"+ subNamePath +"')\"></i></a></li>";
	$("#"+attrsId).append(attach_html);
	attrId++;
	$("#attrs_id").show();
	$("#filesName").hide();
	$("#checkAtt").hide();
	//验证是否存在附件  任务添加页面
	if (files[0] != ",") {
		$("#attrs_span").hide();
	}
}

//添加附件成功，页面拼接
function add_attHtml(relativePath, fileName, oldName){
	var path = relativePath + "/" + fileName;
	files[0] = files[0] + path + ",";
	files[1] = files[1] + oldName + ",";
	var attach_html = "<li id='"+attrId+"'>"+ oldName +"<a class='red' href='javascript:;'><i class='ace-icon fa fa-trash-o  bigger-130' style='float:right;width:7%;' onclick=\"removeAtt('"+attrId+"','"+ path +"','"+ oldName +"')\"></i></a></li>";
	$("#"+attrsId).append(attach_html);
	attrId++;
	$("#attrs_id").show();
	$("#filesName").hide();
	$("#checkAtt").hide();
	//验证是否存在附件  任务添加页面
	if (files[0] != ",") {
		$("#attrs_span").hide();
	}
}

//查看图片 
function searchImg(filePath) {
	$("#reback").show();
	var oldPath = filePath.substring(0,filePath.indexOf("_"))+filePath.substring(filePath.indexOf("."));
	$("#orPath").attr("src",oldPath);
	return oldPath;
}

var removeOk = false;

//删除附件
function removeAttFunc(liId, path, name, subNamePath) {
	delete_attr(path);
	if(subNamePath != ""){
		path = subNamePath;
	}
	if(files[0].indexOf("," + path + ",") != -1){
		files[0] = files[0].replace("," + path + ",", ",");
		files[1] = files[1].replace("," + name + ",", ",").replace(name, "");
	}
	$("#"+liId).remove();
	$("#"+name).remove();
	//验证是否存在附件  任务添加页面
	if (files[0] == ",") {
		$("#attrs_id").hide();
		$("#attrs_span").show();
	}	
}

function removeAtt (liId, path, name) {
	removeAttFunc(liId, path, name, "");
}

//删除报告
function removeAtt_ (liId, path, name) {
	if(files[0].indexOf("," + path + ",") != -1){
		files[0] = files[0].replace("," + path + ",", ",");
		files[1] = files[1].replace("," + name + ",", ",");
	}
	$("#"+liId).remove();
	if(files[0] == ","){
		$("#attrs_id").hide();
	}
}

//获取全部用户数据
function getRoleUser (orgs){
	if(issome && issome != ""){
		//是否多选，selectType.js中用到；
		iss = issome;
	}
	if (flowway && flowway !="") {
		JqdeMods.ajax('userAction', 'getImplementPeoples' , {'flowway':flowway, "groupId":groupId, "flowid":flowid}).then(function (result) {
			if (result.success) {
				//填充到select左右风格中的左侧框
				var html_ = "";
				$('#selectLeft').empty();
				var str = ",";
				$(result.rows).each(function(i) {
					if(str.indexOf("," + this.value + ",") == -1){
						str = str + this.value + ",";
						for (var o in orgs) {
							var org = orgs[o];
							if(this.orgid == orgs[o].value){
								this.text = this.text+" ["+orgs[o].text+"]";
								$('#selectLeft').append('<option value="'+this.value+'">'+this.text+'</option>');
							}
						}
						//缓存用户数据查询时
						var subM = {
								value : this.value, 
								text : this.text
							};
						shareMap.push(subM);
					}
				});
			} else {
				 JqdeBox.message(false, result.message);
			}
	    });
	}
}

//获取所有外协单位数据
function getOutsourceOrg(){
	JqdeMods.ajax('outsourceOrgAction', 'getOrgIdsNames').then(function (result) {
		if (result.success) {
			//填充到select左右风格中的左侧框
			var html_ = "";
			$('#orgName').empty();
			$('#orgName').append('<option  value="" selected>全部</option>');
			$(result.orgs).each(function(i) {
				$('#orgName').append('<option value="'+this.value+'">'+this.text+'</option>');
			});
			getOutsourceStaff (result.orgs);
		} else {
			 JqdeBox.message(false, result.message);
		}
    });
}

//获取所有辅助人员数据
function getOutsourceStaff (orgs) {
	JqdeMods.ajax('outsourceStaffAction', 'getStaffIdsNames').then(function (result) {
		if (result.success) {
			//填充到select左右风格中的左侧框
			var html_ = "";
			$('#selectLeft').empty();
			$(result.rows).each(function(i) {
				for (var o in orgs) {
					var org = orgs[o];
					if(this.orgid == orgs[o].value){
						this.text = this.text+" ["+orgs[o].text+"]";
						$('#selectLeft').append('<option value="'+this.value+'">'+this.text+'</option>');
					}
				}
				//缓存用户数据查询时
				var subM = {
						value : this.value, 
						text : this.text
					};
				shareMap.push(subM);
			});
		} else {
			 JqdeBox.message(false, result.message);
		}
    });
}

var orgs;

//获取组织机构
function getOrgIdsNames(){
	JqdeMods.ajax('orgAction', 'getOrgIdsNames').then(function (result) {
		if (result.success) {
			//填充到select左右风格中的左侧框
			var html_ = "";
			$('#orgName').empty();
			$('#orgName').append('<option  value="" selected>全部</option>');
			$(result.orgs).each(function(i) {
				$('#orgName').append('<option value="'+this.value+'">'+this.text+'</option>');
			});
			$('#orgName').val("");
			orgs = result.orgs;
			userid = result.userId;
			setUserSelectLeft();
		} else {
			 JqdeBox.message(false, result.message);
		}
    });
}

//获取培训讲师
function getOrgIdsNamesTeacher() {
	JqdeMods.ajax('orgAction', 'getOrgIdsNames').then(function (result) {
		if (result.success) {
			//填充到select左右风格中的左侧框
			var html_ = "";
			$('#orgName').empty();
			$('#orgName').append('<option  value="" selected>全部</option>');
			$(result.orgs).each(function(i) {
				$('#orgName').append('<option value="'+this.value+'">'+this.text+'</option>');
			});
			$('#orgName').val(result.userOrg);
			orgs = result.orgs;
			userid = result.userId;
			setUserSelectLeftTeacher();
		} else {
			 JqdeBox.message(false, result.message);
		}
    });
}

//获取审批人员
function getApproveUser() {
	JqdeMods.ajax('orgAction', 'getOrgIdsNames').then(function (result) {  
		if (result.success) {
			//填充到select左右风格中的左侧框
			var html_ = "";
//			debugger;
			$('#orgName_').empty();
			$('#orgName_').append('<option  value="" selected>全部</option>');
			$(result.orgs).each(function(i) {
				$('#orgName_').append('<option value="'+this.value+'">'+this.text+'</option>');
			});
			
			//$('#orgName_').val(result.userOrg);
			orgs = result.orgs;
			userid = result.userId;
			$("#checkApp").hide();
			setApproveUser();
		} else {
			 JqdeBox.message(false, result.message);
		}
    });
}

//查询事件
function setUserSelectLeft(){
	var orgName = $("#orgName option:selected").text();
	var orgId = $("#orgName").val()==""?"":$("#orgName").val();
	var userName = $("#search_name").val()==""?"":$("#search_name").val();
	JqdeMods.ajax('userAction','getOrgIdByUsers',{'orgId':orgId, 'userName':userName}).then(function (result) {
		if (result.success) {
			//填充到select左右风格中的左侧框
			var html_ = "";
			$('#selectLeft').empty();
			$(result.users).each(function(i) {
				if(orgId == ""){
					for (var o in orgs) {
						if(this.orgid == orgs[o].value){
							this.text = this.text+" ["+orgs[o].text+"]";
							$('#selectLeft').append('<option value="'+this.value+'">'+this.text+'</option>');
						}
					}
				}else{
					this.text = this.text+" ["+orgName+"]";
					$('#selectLeft').append('<option value="'+this.value+'">'+this.text+'</option>');
				}
			});
		} else {
			 JqdeBox.message(false, result.message);
		}
    });
}

//查询事件(培训讲师)
function setUserSelectLeftTeacher() {
	checkImpl();
	var orgName = $("#orgName option:selected").text();
	var orgId = $("#orgName").val()==""?"":$("#orgName").val();
	var userName = $("#userName").val()==""?"":$("#userName").val();
	var teacherRole = "27fcea4635b94289a85752c81318607d";
	JqdeMods.ajax('userAction','getOrgIdByUsersTeacher',{'orgId':orgId, 'userName':userName, 'teacherRole': teacherRole}).then(function (result) {
		var teacherInfo = result.users;
		if (result.success) {
			//填充到select左右风格中的左侧框
			var html_ = "";
			$('#selectLeft').empty();
			$(teacherInfo).each(function(i) {
				if(orgId == ""){
					for (var o in orgs) {
						if(this.orgid == orgs[o].value){
							this.text = this.text+" ["+orgs[o].text+"]";
							$('#selectLeft').append('<option value="'+this.value+'">'+this.text+'</option>');
						}
					}
				}else{
					this.text = this.text+" ["+orgName+"]";
					$('#selectLeft').append('<option value="'+this.value+'">'+this.text+'</option>');
				}
			});
		} else {
			 JqdeBox.message(false, result.message);
		}
    });
}

//查询事件(审批人)
function setApproveUser() {
	var orgName_ = $("#orgName_ option:selected").text();
	var orgId = $("#orgName_").val()==""?"":$("#orgName_").val();
	var userName = $("#userName").val()==""?"":$("#userName").val();
	var groupId = "121d9597-c547-447f-b2bc-72d28d77939b";
	JqdeMods.ajax('userAction','getApproveUser',{'orgId':orgId, 'userName':userName, "flowName":flowName, "flowKey":flowKey, "groupId":groupId}).then(function (result) {
		var teacherInfo = result.users;
		var flowConfig = result.flowConfig;
		if(flowConfig && flowConfig.issome){
			issome = flowConfig.issome;
		}
		if (result.success) {
			//填充到select左右风格中的左侧框
			var html_ = "";
			$('#selectLeft').empty();
			$(teacherInfo).each(function(i) {
				if(orgId == ""){
					for (var o in orgs) {
						if(this.orgid == orgs[o].value){
							if (this.value != "root") {
								this.text = this.text+" ["+orgs[o].text+"]";
								$('#selectLeft').append('<option value="'+this.value+'">'+this.text+'</option>');
							}
						}
					}
				}else{
					this.text = this.text+" ["+orgName_+"]";
					$('#selectLeft').append('<option value="'+this.value+'">'+this.text+'</option>');
				}
			});
		} else {
			 JqdeBox.message(false, result.message);
		}
    });
}

function flushStrFunc (v) {
	var newArr = v;
	if(newArr != ","){
		newArr = "@@" + newArr + "@@";
		newArr = newArr.replace("@@,", "").replace(",@@", "").replace("@@", "");
	} else {
		newArr = "";
	}
	return newArr;
}