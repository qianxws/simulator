var menuUtil={
		//隐藏右键菜单
		bindHideRightMenu:function(){
			$("body").bind("mousedown", function(event) {
				if (!(event.target.id == "rMenu" || $(event.target).parents("#rMenu").length>0)) {
					$('#rMenu').css({"visibility" : "hidden"});
				}
			});
		},
		//显示右键菜单
		showRightMenu:function (x, y, menus, treeId, nodeId) {
			if (!menus || menus.length == 0) 
				return false;
			
			var rmenu = $('#rMenu');
			var menu_html = '<ul>';
			
			for (var i in menus){
				menu_html += '<li onclick="'+menus[i].funName+'(\''+treeId+'\', \''+nodeId+'\', \''+menus[i].type+'\')">' 
					+ menus[i].name + '</li>';
			}
			
			menu_html += '</ul>';
			rmenu.html(menu_html);
			rmenu.show();
			rmenu.css({"top":y+"px", "left":x+"px", "visibility":"visible"});
		}
}