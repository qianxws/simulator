//select切换风格开关，true为默认select风格
var selectOk = true;
//初始化树开关
var initOneTree_ = true;
var initOneTree = true;
//初始化select开关
var initOneSelect = true;
var initOneSelect_ = true;
//修改排序开关
var ok = true;
//记录ids与names，数组下标为0代表ids，1代表names
var shareArr = [",", ","];
var twoShareArr = [",", ","];

//缓存select左侧数据，用于模糊搜索
var shareMap = [];
var shareMapO = [];
var twoShareMap = [];
//查询组织机构下岗位数据时，记录组织机构id，当前id只执行一次查询 
var record = "";
//查询排序集合时记录pid，当前Pid只执行一次查询 
var recordPid = "";
//指定实施人（true:选择多人，false：选择一个人）
var issome = "";
//页面存在指定input框下拉左右风格，则自动添值
var sInput;
//记录新的Ids和Names
function add_Ids_Names(selectLeft, addType) {
	if (selectLeft == "selectLeft") {//默认select
		shareArr = setIdsAndNames(selectLeft, shareArr, addType);
	} else {//页面第二个select
		useShareArr = setIdsAndNames(selectLeft, twoShareArr, addType);
	}
	
}
//添加新的Ids和Names公共方法
function setIdsAndNames(selectLeftId, arr , type){
	var lst1 = $("#" + selectLeftId)[0];
	for(var i = 0;i<lst1.options.length; i++){
		if(type){//添加选中
			if(lst1.options[i].selected){
				if (arr[0].indexOf("," + lst1.options[i].value + ",") == -1) {
					arr[0] = arr[0] + lst1.options[i].value + ",";
					arr[1] = arr[1] + lst1.options[i].text + ",";
				}
			}
		} else {//添加所有
			if (arr[0].indexOf("," + lst1.options[i].value + ",") == -1) {
				arr[0] = arr[0] + lst1.options[i].value + ",";
				arr[1] = arr[1] + lst1.options[i].text + ",";
			}
		}
	}
	return arr;
}


// 根据全局shareArr数组，记录select右侧数据
function recordShareIds(selectRight) {
	if (selectRight == "selectRight") {
		shareArr = recordShareIdsFunc(selectRight, shareArr);
	} else {
		twoShareArr = recordShareIdsFunc(selectRight, twoShareArr);
	}
}
function recordShareIdsFunc(selectRightId, arr) {
	var lst2 = $("#" + selectRightId)[0];
	arr[0] = ",";
	arr[1] = ",";
	for(var i = 0;i<lst2.options.length; i++){
		arr[0] = arr[0] + lst2.options[i].value + ",";
		arr[1] = arr[1] + lst2.options[i].text + ",";
	}
	var names = flushStr(shareArr[1]);
	if (sInput.length > 0) {
		$("#nameId").val(names);
	} 
	return arr;
}
// 初始化多选select右侧数据
function addRightSelect (selectRight) {
	if (selectRight == "selectRight") {
		addRightSelectFunc (selectRight, shareArr);
	} else {
		addRightSelectFunc (selectRight, twoShareArr);
	}
}
function addRightSelectFunc (selectRightId, arr) {
	$("#" + selectRightId + " option").remove();
	var lst2 = $("#" + selectRightId)[0];
	var ids = arr[0];
	var names = arr[1];
	if(ids != ","){
		ids = "@@" + ids + "@@";
		ids = ids.replace("@@,", "").replace(",@@", "");
		names = "@@" + names + "@@";
		names = names.replace("@@,", "").replace(",@@", "");
	}
	var ids_A = ids.split(",");
	var names_A = names.split(",");
	if (sInput.length > 0) {
		$("#nameId").val(names_A);
	}
	for(var i in ids_A){
		var opp = new Option(names_A[i], ids_A[i]);
		lst2.add(opp);
	}
}

//是否确认全部删除
function delAll(){
	var msg = "是否确认全部移除?";
	if (confirm(msg) == true) {
		return true;
	} else {
		return false;
	}
}

//公共select操作事

//select判断单选时是否执行添加人员
function selectIsOK (selectLeftId, selectRightId) { 
	var lst2 = $("#" + selectRightId)[0];
	//判断右侧select是否存在数据
	if (lst2.options.length < 1) {
		//若右侧无数据则查看左侧选中个数
		var lst1 = $("#" + selectLeftId)[0];
		var n = 0;
		for (var i = 0;i<lst1.options.length; i++) {
			if (lst1.options[i].selected) {
				n++;
			}
		}
		if ( n > 1) {//不添加
			return false;
		} else {//添加
			return true;
		}
	} else {//不添加
		return false;
	}
}
//添加
function selectAdd (selectLeft, selectRight) {
	//判断是否有选中项
	if(!$("#" + selectLeft + " option").is(":selected")){
		alert("请选择需要添加的选项");
	}else {
		add_Ids_Names(selectLeft, true);
		addRightSelect(selectRight);
	}
}
//删除
function selectRemove (selectRight) {
	//判断是否有选中项
	if(!$("#" + selectRight + " option").is(":selected")){
		alert("请选择需要移除的选项");
	}else {
		$("#" + selectRight + " option:selected").remove();
		recordShareIds(selectRight);
	}
}
//添加所有
function selectAddAll(selectLeft, selectRight){
	add_Ids_Names(selectLeft, false);
	addRightSelect(selectRight);
}
//删除所有
function selectRemoveAll(selectRight){
	if(delAll()){
		$("#" + selectRight + " option").remove();
		if(selectRight == "selectRight"){
			shareArr = [",", ","];//当前页面第一个select
		} else {//当前页面第2个select
			twoShareArr = [",", ","];
		}
		if (sInput.length > 0) {
			$("#nameId").val("");
		}
	}
}
//双击添加
function selectClickAdd(selectLeft, selectRight){
	add_Ids_Names(selectLeft, true);
	addRightSelect(selectRight);
}
//双击移除
function selectClickRemove(selectRight){
	$("#" + selectRight + " option:selected").remove();
	recordShareIds(selectRight);
}	

//search搜索框公共方法
//IE调用清空搜索框
function removeSearch(){
	 removeSearchs("");
}

//非IE调用清空搜索框
function removeSearchs(val_){
	removeSearchsFunc(val_, true);
}

//清空搜索框事件处理
function removeSearchsFunc(val_, isVue){
	$("#searchName").val("");
	$("#searchName_").val("");
	if (isVue) {
		if (val_ == "positions") {
			vmEdit.sharePositionOptions = twoShareMap;
		} else {
			vmEdit.shareOptions = shareMap;//填充到select左右风格中的左侧 框
		}
	} else {
		// jquery
		if (val_ == "positions") {
			var lst = $("#positionSelect1")[0];
			$("#positionSelect1").empty();
			setSelectLeft(lst, twoShareMap);
		} else {
			var lst = $("#selectLeft")[0];
			$("#selectLeft").empty();
			setSelectLeft(lst, shareMap);
			var lst = $("#selectLeft_")[0];
			$("#selectLeft_").empty();
			setSelectLeft(lst, shareMapO);
		}
	}
}

//填充左侧select方法
function setSelectLeft(lst, mapArr){
	for(var i in mapArr){
		var opp = new Option(mapArr[i].text, mapArr[i].value);
		lst.add(opp);
	}
}
//搜索匹配vue
function getSearchMap(mapArr, name){
	var selectLeftMap = [];
	for(var i in mapArr){
		if (mapArr[i].text.indexOf(name) != -1) {
			var subM = {
					value : mapArr[i].value, 
					text : mapArr[i].text
				};
			selectLeftMap.push(subM);
		}
	}
	return selectLeftMap;
}

//搜索匹配关键字
function getSearchMap_Ie(lst, mapArr, name){
	var arr = [];
	for(var i in mapArr){
		var name_ = makePy(mapArr[i].text)+"";
		name_ = name_.toLowerCase();
		if (mapArr[i].text.indexOf(name) != -1 
				|| name_.indexOf(name.toLowerCase()) != -1
				|| codefans_net_CC2PY(mapArr[i].text).indexOf(name.toLowerCase()) != -1
					){
			var opp = new Option(mapArr[i].text, mapArr[i].value);
			var subM = {
					value : mapArr[i].value, 
					text : mapArr[i].text+"["+makePy(mapArr[i].text)+"]"
				};
			arr.push(subM);
			lst.add(opp);
		} else {
			if (mapArr[i].value.indexOf(name) != -1) {
				var opp = new Option(mapArr[i].text, mapArr[i].value);
				var subM = {
						value : mapArr[i].value, 
						text : mapArr[i].text
					};
				arr.push(subM);
				lst.add(opp);
			}
		}
	}
	return arr;
}

//查询功能
function shareSearchsFunc(val_, isVue){
	var searchName = $("#searchName").val();
	var searchName_ = $("#searchName_").val();
	if(isVue){
		if(searchName.length>0){
			if(val_ == "positions"){
				vmEdit.sharePositionOptions = getSearchMap(twoShareMap);
			}else{
				vmEdit.shareOptions = getSearchMap(shareMap);
			}
		} else if (searchName_.length>0) {
			if(val_ == "positions"){
				vmEdit.sharePositionOptions = getSearchMap(twoShareMap);
			}else{
				vmEdit.shareOptions = getSearchMap(shareMap);
			}
		} else{
			if(val_ == "positions"){
				vmEdit.sharePositionOptions = twoShareMap;
			}else{
				vmEdit.shareOptions = shareMap;//填充到select左右风格中的 左侧  框
			}
		}
	} else {
		if (searchName) {
			getSearchMap_IeFunc(val_, searchName);
		} else if (searchName_) {
			var searchName =  searchName_;
			getSearchMap_IeFuncO(val_, searchName);
		}
	}
}

//查询功能调用：ie查询方法
function getSearchMap_IeFunc(val_, searchName){
	if(searchName.length>0){
		if(val_ == "positions"){
			var lst = $("#positionSelect1")[0];
			$("#positionSelect1").empty();
			getSearchMap_Ie(lst, twoShareMap, searchName)
		}else{
			var lst = $("#selectLeft")[0];
			$("#selectLeft").empty();
			getSearchMap_Ie(lst, shareMap, searchName)
		}
	}else{
		if(val_ == "positions"){
			removeSearchsFunc(val_, false);
		}else{
			removeSearchsFunc(val_, false);//填充到select左右风格中的 左侧  框
		}
	}
}

function getSearchMap_IeFuncO(val_, searchName){
	if(searchName.length>0){
		if(val_ == "positions"){
			var lst = $("#positionSelect1")[0];
			$("#positionSelect1").empty();
			getSearchMap_Ie(lst, twoShareMap, searchName)
		}else{
			var lst = $("#selectLeft_")[0];
			$("#selectLeft_").empty();
			getSearchMap_Ie(lst, shareMapO, searchName)
		}
	}else{
		if(val_ == "positions"){
			removeSearchsFunc(val_, false);
		}else{
			removeSearchsFunc(val_, false);//填充到select左右风格中的 左侧  框
		}
	}
}

function searchNames (selectLeft, name_one, name_two){
	var one = $("#" + name_one).val(); 
	var two = $("#" + name_two + " option:selected").text();
	if(two == "全部"){
		two = "";
	}
	var lst = $("#"+selectLeft)[0];
	$("#"+selectLeft).empty();
	//先查姓名再查部门
	if (one && one != "") {
		var arr = getSearchMap_Ie(lst, shareMap, one);
		if (two && two != "") {
			$("#"+selectLeft).empty();
			getSearchMap_Ie(lst, arr, two);
		}
		return ;
	}
	//先查部门 再查姓名
	if (two && two != "") {
		var arr = getSearchMap_Ie(lst, shareMap, two);
		if (one && one != "") {
			$("#"+selectLeft).empty();
			getSearchMap_Ie(lst, arr, one);
		}
		return ;
	}
	//清空条件
	if (one == "" && two == "") {
		getSearchMap_IeFunc("", "");
	}
}

//ie调用查询功能
function shareSearch(){
	shareSearchs( "");
}

//vue调用查询功能
function shareSearchs(val_){
	shareSearchsFunc(val_, true);
}
//下拉树显示隐藏设置
function ztreeShowOrHide(e, divId, inputId, buttonId, isZtree, ztreeId){
	var targetId = e.target.id;
	if (isZtree) {//ztree下拉风格显示隐藏控制
		if (!(targetId && targetId.indexOf(ztreeId)!= -1)) {
			if (!targetId || targetId != divId) { 
				if ($("#" + divId).is(":hidden") && (targetId == buttonId || targetId == inputId)) {
					$("#" + divId).show();
				} else {//alert(1);
					$("#" + divId).hide();
				}
		  	}
		}
		
	} else {//select风格显示隐藏控制
		if (targetId == buttonId || targetId == inputId) {
			if ($("#" + divId).is(":hidden")) {
				$("#" + divId).show();
			} else {
				$("#" + divId).hide();
			}
		}
	}
}
//事件设置
$(function(){
	sInput = jQuery('#nameId');
	//添加
	$("#selectAdd").click(function(){
		if(issome == "false"){
			if(!selectIsOK("selectLeft", "selectRight")){
				alert("只支持选择一个人"); 
				return ;
			}
		}
		selectAdd("selectLeft", "selectRight");
	});
	
	//双击事件绑定
	$("#selectLeft").dblclick(function(){//绑定双击事件
		if (issome == "false") {
			if($("#selectRight")[0].options.length > 0){
				alert("只支持选择一个人"); 
				return ;
			}
		}
		selectClickAdd("selectLeft", "selectRight");
	});
	
	//全部添加
	$("#selectAddAll").click(function(){
		if(issome == "false"){
			var Left = $("#selectLeft")[0].options.length;
			var Right = $("#selectRight")[0].options.length;
			if(Right > 0 || (Right < 1 && Left > 1)){
				alert("只支持选择一个人"); 
				return ;
			} 
		}
		selectAddAll("selectLeft", "selectRight");
	});
	
	//移除
	$("#selectRemove").click(function(){
		selectRemove("selectRight")
	});
	//全部移除
	$("#selectRemoveAll").click(function(){
		selectRemoveAll("selectRight");
	});
	//双击移除
	$("#selectRight").dblclick(function(){
		selectClickRemove("selectRight");
	});
	
	
	
	//添加
	$("#selectAdd_").click(function(){
		if(issome == "false"){
			if(!selectIsOK("selectLeft_", "selectRight_")){
				alert("只能选择一个人"); 
				return ;
			}
		}
		selectAdd("selectLeft_", "selectRight_");
	});
	
	//双击事件绑定
	$("#selectLeft_").dblclick(function(){//绑定双击事件
		if (issome == "false") {
			if($("#selectRight_")[0].options.length > 0){
				alert("只能选择一个人"); 
				return ;
			}
		}
		selectClickAdd("selectLeft_", "selectRight_");
	});
	
	//全部添加
	$("#selectAddAll_").click(function(){
		if(issome == "false"){
			var Left = $("#selectLeft")[0].options.length;
			var Right = $("#selectRight")[0].options.length;
			if(Right > 0 || (Right < 1 && Left > 1)){
				alert("只能选择一个人"); 
				return ;
			} 
		}
		selectAddAll("selectLeft_", "selectRight_");
	});
	
	//移除
	$("#selectRemove_").click(function(){
		selectRemove("selectRight_")
	});
	//全部移除
	$("#selectRemoveAll_").click(function(){
		selectRemoveAll("selectRight_");
	});
	//双击移除
	$("#selectRight_").dblclick(function(){
		selectClickRemove("selectRight_");
	});
});

//模糊搜索事件
function searchName_Task(){
	searchNames("selectLeft","search_name" ,"orgName");
}

//实现select模糊搜索公共方法
function searchNodeFunc(action, method, parameter, selectId, tree_){
	if(parameter != ""){
		JqdeMods.ajax(action, method, {"name": parameter}).then(function (result) {
         	if (result.success && result.rows) {
    			$("#" + selectId).empty();
    			var html = "";
    			$(result.rows).each(function(i) {
    				html += "<li onclick=\"setSelectVal('"+this.id+"','"+ this.name +"','"+(tree_?tree_:"")+"')\"><a>"+this.name+"</a></li>";
    			});
    			$("#" + selectId).append(html);
    			//隐藏树，显示select下拉
    	        $("#rolesTree").hide();
    	        $("#nodesSelectId").show();
             } else {
                 JqdeBox.message(false, result.message);
             }
         });
	}else{
		$("#nodesSelectId").hide();
	    $("#rolesTree").show();
	}
	
}

//自定义select下拉赋值
function setSelectVal(id, name, tree_){
	var name_ = $("#name").val();
	if (name == name_) {
		alert("上级节点不能选择自己！");
	} else {
		$("#pid").val(id);
		$("#pname").val(name);
		$("#nodesSelectId").hide();
		if(tree_){
			$("#"+tree_).hide();
		}
		vmEdit.item.edit = true;
		vmEdit.item.pid = id;
		vmEdit.item.pname = name;
		//获得角色下拉树
//		vmEdit.fetchAllRoles(vmEdit.item);
	}
}

//格式化文本框数据，根据ztree返回公共数据提供数据
function flushStr(v) {
	var newArr = v;
	if(newArr != ","){
		newArr = "@@" + newArr + "@@";
		newArr = newArr.replace("@@,", "").replace(",@@", "");
	} else {
		newArr = "";
	}
	return newArr;
}