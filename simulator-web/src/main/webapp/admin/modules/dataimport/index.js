//重新初始化影片导入
function init_file1() {
	$('#file-1-div').html('<input name="excelFile" type="file" id="file-1" onchange="checkFileType(this, \'f1-error\')"/>');
	$('#file-1').ace_file_input({
		no_file : '请选择...',
		btn_choose : '选择文件',
		btn_change : '更改文件',
		droppable : false,
		onchange:null,
		thumbnail : false
	});
	$('#file-1-div .remove').on('click',function(){
		$('#f1-error').hide();		
 	});
}
//重新初始化分厅分场导入
function init_file2() {
	$('#file-2-div').html('<input name="excelFile" type="file" id="file-2" onchange="checkFileType(this, \'f2-error\')"/>');
	$('#file-2').ace_file_input({
		no_file : '请选择...',
		btn_choose : '选择文件',
		btn_change : '更改文件',
		droppable : false,
		onchange:null,
		thumbnail : false
	});
	$('#file-2-div .remove').on('click',function(){
		$('#f2-error').hide();		
	});
}

init_file1();
init_file2();

//校验文件类型
function checkFileType(this_, err_div) {
	$('#' + err_div).html('');
	var files = this_.files;
	if (files && files.length > 0){
		var file = files[0];
		var name = file.name;
		var type = name.substring(name.lastIndexOf('.'));
		if (type == '.xls' || type == '.xlsx'){
			$(this_).attr('name',name);
			return true;
		}else{
			$('#' + err_div).html("文件类型不正确请选择xls或xlsx类型文件！");
			return false;
		}
	}
	return false;
}
