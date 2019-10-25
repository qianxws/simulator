//获得token
function getToken() {
	var reg = new RegExp('(^| )cinemaplat_token=([^;]*)(;|$)');
	var arr = document.cookie.match(reg);
	if (arr && arr.length > 2){
		return unescape(arr[2]);
	}else {
		return null;
	}
}
//删除token
function deleteToken() {
	var time = new Date();
	time.setTime(time.getTime() - 1);
	document.cookie = 'cinemaplat_token=null;expires=' + time.toGMTString();
}

//设为首页：<a onclick="setHome(this,window.location)" style="cursor:hand">设为首页</a>
function setHome(obj,vrl){
    try{
        obj.style.behavior='url(#default#homepage)';obj.setHomePage(vrl);
    }
    catch(e){
        if(window.netscape) {
            try {
                netscape.security.PrivilegeManager.enablePrivilege("UniversalXPConnect");
            }
            catch (e) {
                alert("此操作被浏览器拒绝！\n请在浏览器地址栏输入“about:config”并回车\n然后将 [signed.applets.codebase_principal_support]的值设置为'true',双击即可。");
            }
            var prefs = Components.classes['@mozilla.org/preferences-service;1'].getService(Components.interfaces.nsIPrefBranch);
            prefs.setCharPref('browser.startup.homepage',vrl);
        }
        else{
        	alert('您的浏览器不支持自动自动设置首页, 请使用浏览器菜单手动设置!');
        }
    }
}

//加入收藏：<a href=# rel="sidebar" onclick="javascript:addFavorite()">加入收藏</a>
function addFavorite() {
    var url = window.location;
    var title = document.title;
    var ua = navigator.userAgent.toLowerCase();
    if (ua.indexOf("360se") > -1) {
        alert("由于360浏览器功能限制，请按 Ctrl+D 手动收藏！");
    }
    else if (ua.indexOf("msie 8") > -1) {
        window.external.AddToFavoritesBar(url, title); //IE8
    }
    else if (document.all) {
  try{
   window.external.addFavorite(url, title);
  }catch(e){
   alert('您的浏览器不支持,请按 Ctrl+D 手动收藏!');
  }
    }
    else if (window.sidebar) {
        window.sidebar.addPanel(title, url, "");
    }
    else {
  alert('您的浏览器不支持,请按 Ctrl+D 手动收藏!');
    }
}