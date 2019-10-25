var upload_file = {};
var url = "";
var ajaxParams = ""
var callbackFunction;
var curBrowser = "";//记录访问浏览器类型	
var isImage = false;
var UploadAttach = {
	addFileCommon : function (callback){
		upload_file = {};
    	var apiPath = Config.apiPath.replace(/\/?$/, '');
		url = apiPath + '/download/uploadAttachment'
		callbackFunction = callback;
		show_att();
	},
	addFile : function(action, verb, params, callback) {
		upload_file = {};
    	var apiPath = Config.apiPath.replace(/\/?$/, '');
		url = apiPath + '/commMods/ajax?action=' + action + '&verb=' + verb;
		ajaxParams = params;
		callbackFunction = callback;
		show_att();
	}
};

var UploadAttachs = {
	addFileCommons : function (callback){
		isImage = true;
		upload_file = {};
    	var apiPath = Config.apiPath.replace(/\/?$/, '');
		url = apiPath + '/download/uploadPic'
		callbackFunction = callback;
		show_attimg();
	},
	addFile : function(action, verb, params, callback) {
		upload_file = {};
    	var apiPath = Config.apiPath.replace(/\/?$/, '');
		url = apiPath + '/commMods/ajax?action=' + action + '&verb=' + verb;
		ajaxParams = params;
		callbackFunction = callback;
		show_attimg();
	}
};

//确认取消事件
function show_att(){
	JqdeBox.dialog({
        title: '上传文件',
        url: 'js/addAttachment/add_attachment.html',
        init : function(){
        	
        },
        confirm: function(){ // 确认事件
        	upload();
            return true;
        },
        cancel: function(){//(非h5浏览器取消上传按钮事件)
        	if(curBrowser != "HTML5_attrs"){//不支持h5
        		for (var i in upload_file){
        			//传入路径，删除物理路径文件
        			delete_attr (upload_file[i].relativePath+"/"+upload_file[i].nowName);
        		}
        	}
        }
    });	
}

//备品备件上传图片
function show_attimg(){
	JqdeBox.dialog({
        title: '上传文件',
        url: 'js/addAttachment/add_productimg.html',
        init : function(){
        	
        },
        confirm: function(){ // 确认事件
        	upload();
            return true;
        },
        cancel: function(){//(非h5浏览器取消上传按钮事件)
        	if(curBrowser != "HTML5_attrs"){//不支持h5
        		for (var i in upload_file){
        			//传入路径，删除物理路径文件
        			delete_attr (upload_file[i].relativePath+"/"+upload_file[i].nowName);
        		}
        	}
        }
    });	
}
//点击添加文件增加图片(改造支持非h5浏览器)
function file_changeimg() {
	if(curBrowser == "HTML5_attrs" && false){//支持h5的浏览器
		var isPost = 0;
		var files = document.getElementById("flow_file").files;
		for (var j = 0; j < files.length; j++){
			var fileType = files[j].name;
			fileType = fileType.substring(fileType.indexOf(".")+1);
			if(("gif,jpg,jpeg,png,bmp").indexOf(fileType.toLowerCase()) == -1){
				alert("只支持上传图片格式文件!");
				isPost = 1;
				break;
			}
		}
		if(isPost == 0){
			add_file(files);
		}
	}else{//不支持h5
		var fileType = $("#flow_file").val();
		fileType = fileType.substring(fileType.indexOf(".")+1);
		if(("gif,jpg,jpeg,png,bmp").indexOf(fileType.toLowerCase()) == -1){
			alert("只支持上传图片格式文件!");
			$('#flow_file').replaceWith('<input name="flow_file" type="file" id="flow_file" multiple="multiple" onchange="file_changeimg()" />');
			return false;
		}
		notHtml5_attrs();
	}
}

//点击添加文件增加图片(改造支持非h5浏览器)
function file_change() {
	if(curBrowser == "HTML5_attrs"){//支持h5的浏览器
		var files = document.getElementById("flow_file").files;
		add_file(files);
	}else{//不支持h5
		notHtml5_attrs();
	}
}

//不支持html5的浏览器上传文件(新加支持非h5浏览器)
function notHtml5_attrs(){
	$.ajaxFileUpload({
        url: url, //用于文件上传的服务器端请求地址
        secureuri: false, //一般设置为false
        fileElementId: 'flow_file', //文件上传空间的id属性  <input type="file" id="addFile" name="file" />
        dataType: 'json', //返回值类型 一般设置为json
        success: function (data, status){
        	if(data.success){
        		var attrs_file = {};
        		var key = new Date().getTime() + Math.floor(Math.random()*1000)*10;
        		//img_file.img = window.webkitURL.createObjectURL(files[j]);
        		//文件名称
        		attrs_file.filename = data.oldName;
        		//文件大小
        		attrs_file.filesize = Math.floor(data.fileSize);
        		//文件状态
        		attrs_file.state = "等待上传";
        		attrs_file.relativePath = data.relativePath;
        		attrs_file.nowName = data.fileName;
        		attrs_file.subNamePath = data.subNamePath;
        		upload_file[key] = attrs_file;
        		joint_html();
        		$("#flow_file").val("");
        	}else{
        		alert("上传失败");
        	}
        },
        error: function (data, status, e){
            alert(e);
        }
	});
	return false;
}

//增加上传文件
function add_file (files){
	if (files.length == 0){
		return false;
	}

	for (var j = 0; j < files.length; j++){
		var img_file = {};
		var key = new Date().getTime() + Math.floor(Math.random()*1000)*10;
		//img_file.img = window.webkitURL.createObjectURL(files[j]);
		img_file.filename = files[j].name;
		img_file.filesize = Math.floor((files[j].size));
		img_file.file = files[j];
		img_file.state = "等待上传";
		//以下两参数为不支持html5浏览器使用(改造支持非h5浏览器)
		img_file.relativePath = "1";
		img_file.nowName = "2";
		img_file.subNamePath = "2";
		upload_file[key] = img_file;
	}
	joint_html();
}
//拼接页面信息(改造支持非h5浏览器)
function joint_html(){
	var img_html = "";
	if (upload_file != null && upload_file.length != ""){
		$("#drop_area").hide();
		for (var i in upload_file){
			var is_delete = "";
			if (upload_file[i].state != "上传成功"){
				is_delete = "	<div class='img_info img_delete' onclick='delete_file(\""+i+"\",\""+upload_file[i].relativePath+"\",\""+upload_file[i].nowName+"\")'><i class='red fa fa-trash-o bigger-140'></i></div>";
			}
			var name = upload_file[i].filename;
			img_html += "<div class='img_div' id='file_" + i + "'>"
					 +"	<div class='img_info img_name' title='" + name + "'>" + name + "</div>"
					 +"	<div class='img_info img_type'>" + name.substring(name.lastIndexOf(".") + 1) + "</div>"
					 +"	<div class='img_info img_size'>" + change_size_type(upload_file[i].filesize) + "</div>"
					 +"	<div class='img_info img_state'>" + upload_file[i].state + "</div>"
					 + is_delete
					 +"</div>";
		}
		$("#img_list_div").html(img_html);	
	}else {
		$("#drop_area").show();
	}
}

//计算文件大小
function change_size_type (file_size){
	if (file_size){
		if (file_size < 1024){
			return file_size + 'B';
		}else if (file_size < 1024*1024){
			return (file_size/1024).toFixed(2) + 'KB';
		}else if (file_size < 1024*1024*1024){
			return (file_size/(1024*1024)).toFixed(2) + 'MB';
		}else  if (file_size < 1024*1024*1024*1024){
			return (file_size/(1024*1024*1024)).toFixed(2) + 'GB';
		}else {
			return '未知';
		}
	}else {
		return '未知';
	}
}

//删除文件(改造支持非h5浏览器)
function delete_file (id, relativePath, nowName){
	delete upload_file[id];
	if(curBrowser == "notHTML5_attrs"){//不支持h5的浏览器
		//删除物理路径文件
		delete_attr (relativePath+"/"+nowName);
	}
	joint_html();
}

//上传(改造支持非h5浏览器)
function upload(){
	if(curBrowser == "HTML5_attrs"){//支持h5的浏览器
		for (var i in upload_file){
			if (upload_file[i].state == "等待上传"){
				uploadToService(upload_file[i], i, url, ajaxParams);
			}
		}
	}else{//不支持h5
		if(isImage){
			//页面图片
			for (var i in upload_file){
				add_attHtml_img(upload_file[i].relativePath, upload_file[i].nowName, upload_file[i].filename, upload_file[i].subNamePath); 
			}
		}else{
			//附件
			for (var i in upload_file){
				add_attHtml(upload_file[i].relativePath, upload_file[i].nowName, upload_file[i].filename);
			}
		}
	}
}

//上传文件
function uploadToService (file, id, url, ajaxParams){
	var imgdiv = $("#file_" + id);
	imgdiv.find(".img_state").html("上传中");
	upload_file[id].state = "上传中";
	
	var imgfile = file.file;
	//1.创建XMLHttpRequest组件
	var xhr = new XMLHttpRequest();
    //3.初始化XMLHttpRequest组件     
    xhr.open("POST", url, true);//"commMods/ajax?action=imgPessAction&verb=uploadImg"
    xhr.setRequestHeader('X-Requested-With', 'XMLHttpRequest', 'Content-Type', 'multipart/form-data;');
	var formData = new FormData();
	formData.append("files", imgfile);
	
	var data = "";
	if (ajaxParams) {
		if ($.type(ajaxParams) === "string") {
			data =  ajaxParams;
		} else {
			data = JSON.stringify(ajaxParams);
		}
		formData.append("ajaxParams", data);
	}
	
    //设置回调函数    
    xhr.onload = function (e) {
        if(xhr.readyState == 4 && xhr.status == 200){
            var txt = xhr.responseText;    
            // 记录上传成功图片的相对路径
            var data = eval("("+txt+")");
        	callbackFunction(data);
            if (data.success) {
            	$(imgdiv).find(".img_state").html("<span class='label label-success'>上传成功<\sapn>");
            	$(imgdiv).find(".img_delete").html("");
            	upload_file[id].state = "上传成功";
            } else {
            	$(imgdiv).find(".img_state").html("<span class='label label-warning'>上传失败<\sapn>");
            	upload_file[id].state = "上传失败";
            }
        } else {
        	$(imgdiv).find(".img_state").html("<span class='label label-warning'>上传失败<\sapn>");
        	upload_file[id] .state= "上传失败";
        }   
    };   
    xhr.send(formData);
}
//删除已经上传的附件
function delete_attr (path){
	$.ajax({
		type : 'post',
		url : 'download/deleteAttachment',
		data : {'path' : path},
		cache : false,
		dataType : 'json',
		success : function(data) {
			
		}
	});
}

