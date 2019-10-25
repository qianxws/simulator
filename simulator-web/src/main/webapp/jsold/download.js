//下载
function downloadByPath(path, fileName) {
	var inputs = "<input type='hidden' name='fileName' value='"+fileName+"'>";

	inputs += "<input type='hidden' name='path' value='" + path + "'>";
		
	$("<form action='download/downloadByPath' method='post' target='_blank'>"+inputs+"</form>").appendTo('body').submit().remove();
}