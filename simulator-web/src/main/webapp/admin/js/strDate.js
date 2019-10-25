$(function(){
	var strDate = new Date();
	var year = strDate.getFullYear()
	var month = strDate.getMonth()+1;
	var day = strDate.getDate()
	if (month < 10) {
		month = "0" + month;
	}
	if (day < 10) {
		day = "0" + day;
	}
	$("#startTime").val(year+"-"+month+"-"+day);
	$("#endTime").val(year+"-"+month+"-"+day);
	$("#startTime_").val(year+"-"+month+"-"+day);
	$("#endTime_").val(year+"-"+month+"-"+day);
});

//时间格式转字符串格式
function changeTime(time) {
	var year=time.substr(0,4); 
	var index1=time.indexOf("-"); 
	var index2=time.lastIndexOf("-"); 
	var cha=parseInt(index2)-(parseInt(index1)+1); 
	var month=time.substr((parseInt(index1)+1),cha); 
	var kg=time.indexOf(" "); 
	cha=parseInt(kg)-parseInt(index2); 
	var day=time.substr(parseInt(index2)+1,cha); 
	return year + '-' + month + '-' + day;
}
