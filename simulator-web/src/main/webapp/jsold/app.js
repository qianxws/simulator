/**
 * app
 * jquery版本
 * 2017-08-08
 */
var vmApp = {
    data: {
        userId: 'root',
        userName: 'demo',
        menus: [],
        iconCls: ['glyphicon glyphicon-align-justify', 'fa fa-cogs', 'fa fa-book', 'fa fa-gavel', 
        	'fa fa-desktop', 'fa fa-tag', 'fa fa-picture-o', 'fa fa-folder', 'fa fa-list', 
        	'fa fa-briefcase', 'glyphicon glyphicon-book', 'glyphicon glyphicon-inbox'],
        modulePath: '',
        item: {},
        regURL: null,
        dbDelta: 0,
        indexDelta: 0,
        authCodes : ''
    },
    mounted: function () {
        var $this = this;
	    $this.fetchData();
	    // DO on hash change
	    $(window).on('hashchange', function () {
	        vmApp.checkURL();
	    });
    },
    // get Profiles
    fetchData: function () {
        JqdeMods.ajax('profilesAction', 'getCurrentProfiles').then(function (result) {
            if (result.success) {
                vmApp.render(result);
                vmApp.data.authCodes = result.authCodes;
            }
        });
    },
    render: function (result) {
    	var $this = this;
        var menus_array = [], menuMap = {};
        for (var i in result.services) {
            var service = result.services[i];
            var moduleMenu;
            if (service.pid == '0') {
                moduleMenu = {
                    name: service.name,
                    isopen: service.isopen,
                    submenus: []
                };
                if (moduleMenu) {
                	menus_array.push(moduleMenu);
                    menuMap[service.menuid] = moduleMenu;
                }
            } else {
            	var serviceMenu = {
                    name: service.name,
                    url: service.url
                };
            	if (menuMap[service.pid]) {
            		menuMap[service.pid].submenus.push(serviceMenu);
            	}
            }
        }
        //alert(JSON.stringify(menus_array));
        $(menus_array).each(function(index){
        	var menus_ = '<li class=""> \
        		<a href="#"> \
    			<i class="menu-icon '+vmApp.data.iconCls[index]+'"></i> \
    			<span class="menu-text">'+this.name+'</span> \
    			<b class="arrow fa fa-angle-down"></b> \
    		</a> \
    		<b class="arrow"></b>';
    		if (this.submenus) {
    			var isopen_ = this.isopen==true?'block':'none'; 
    			menus_ += '<ul class="submenu" style="display:'+isopen_+';">';
	    		for (var i in this.submenus) {
		    		menus_ += ' <li class=""> \
							<a href="/'+this.submenus[i].url+'"> \
								<i class="menu-icon fa fa-caret-right"></i>'+this.submenus[i].name+'</a> \
							<b class="arrow"></b> \
						</li> ';
	    		}
    			menus_ += '</ul>';
    		}
    		menus_ += '</li>';
        	$("#menus").before(menus_);
        });
        $("#userId").html(result.userId);
        $("#userName").html(result.userName);
        $("#userId-home").html(result.userId);
        this.userName = result.userName;
        this.item = result;
        this.item.name = result.userName;
        
        vmApp.init();
        /*setTimeout(function () {
           
            //这里判断当前栏目是否选中的(刷新页面 就可以自动展开)
            $("#nav li").each(function(){
            	var hasclass=$(this).attr("class");
            	if($(this).hasClass("open")){
            		$(this).children("ul").show();
            	}
            });
        }, 500);*/
    },

    init: function () {
        // fire this on page load if nav exists
        if ($('#nav').length) {
            vmApp.checkURL();
        }

        $('#nav a[href!="#"]').click(function (e) {
            e.preventDefault();
            window.location.hash = $(this).attr('href');
        });

        // fire links with targets on different window
        $('#nav a[target="_blank"]').click(function (e) {
            e.preventDefault();
            window.open($(this).attr('href'));
        });

        // all links with hash tags are ignored
        $('#nav a[href="#"]').click(function (e) {
            e.preventDefault();
            if ($(this).parents('.menu-min').length == 0) {
                $(this).parent().find('.submenu').slideToggle();
            }
        });
    },
    // CHECK TO SEE IF URL EXISTS
    checkURL: function () {
        //get the url by removing the hash
        var url = location.hash.replace(/^#/, '');
        param = {};
        if (url) {
        	var urls;
//            url = Config.moduleName+'/modules/' + url.replace(/^\//, '');
            url = 'modules/' + url.replace(/^\//, '');
            // console.log(url);
            if(url.indexOf("report")>-1){
                //截取 获得到的是   /...
                href=url.split('/')[1];
            }else{
            	 urls = url.split('?');
                 //第一次截取 获得到的是   .../...
                 var href =urls[0]; //  '/' + url.substring(url.indexOf('/') + 1);
                 //第一次截取 获得到的是   /...
                 href=href.split('/')[1];
            }
            //默认进来清空样式
            $('#nav li.active').removeClass("active");
            //遍历所有左侧栏目
            $("#nav li").each(function(){
            	//获取当前栏目
            	var now_href=$(this).find("a").attr("href");
            	//判断当前栏目是否和路径截取后的一致
            	if( now_href){
            		now_href=now_href.split("/");
            		if(now_href[1]==href){
            			//当前添加样式兄弟节点移除样式。
                		$(this).addClass("active").siblings().removeClass("active");
                    	$(this).parent("ul").show().parent("li").addClass("active");
                    	$(this).parent("ul").parent("li").siblings().children("ul").hide();
                    	
                	}
            	}
            	
            });
            if(url.indexOf('.html')==-1)
               url=url+'/index.html';

            // parse url to jquery
            Tools.loadURL(url, $('#content'), function () {
                vmApp.drawBreadCrumb();
            }, function () {
                vmApp.drawBreadCrumb();
            });

        } else {
            //update hash
            window.location.hash = $('#nav > li:first-child > a[href!="#"]').attr('href');
        }
    },
    // UPDATE BREADCRUMB
    drawBreadCrumb: function () {
        $("#breadcrumbs ul.breadcrumb").empty();
        $("#breadcrumbs ul.breadcrumb").append($('<li><i class="ace-icon fa fa-home home-icon"></i> 首页 </li>'));
        
        $('#nav li.active > a').each(function () {
            $("#breadcrumbs ul.breadcrumb").append($("<li></li>").html(
            	$.trim($(this).clone().children(".badge").remove().end().text())
            ));
        });
    },
    logout: function () {
        JqdeBox.confirm('您确定要退出吗？', function (result) {
            if (result) {
                $.ajax({
                    type: 'post',
                    url: Config.apiPath + '/public/logout?token='+token,
                    success: function (result) {
                    	deleteToken();
                        location = 'login.html';
                    },
                    error: function (error) {
                        JqdeBox.message(false, error);
                    }
                });
            }
        });
    },
    editUserInfo:function () {
    	var $this = this;
        JqdeBox.dialog({
            title: '修改用户',
            url: 'modules/user/edit.html',
            init: function () {
                vmEdit.item = $.extend({}, $this.item);
            },
            confirm: function () {
                if (vmEdit.valid()) {

                    // 后台交互
                    JqdeMods.ajax('userAction', 'update', vmEdit.ajaxPramas).then(function (result) {
                        if (result.success) {
                            $.extend(item, vmEdit.item);
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
    }
};

$(function(){
	vmApp.mounted();
	
	$("#logout").click(function(){
		vmApp.logout();
	});
});