/**
 * login
 * 支持ie8，jquery版本
 * 2017-08-08
 */
$(function(){
	$("#btnLogin").click(function(){
		vmLogin.login();
	});
	vmLogin.reflush();
});

var vmLogin = {
	enterLogin: function () {
		var e = e || window.event; 
		if(e.keyCode == 13){ 
			vmLogin.login();
		} 
	},
	login: function () {
		vmLogin.submit_form();
        $.ajax({
            type: 'post',
            url: Config.apiPath + '/commMods/login',
            data: {
                userId: $("#userId").val(),
                password: $("#password").val(),
                verification_code: $("#verification_code").val()
            },
            success: function (result) {
            	if (result.indexOf('登录成功') > -1) {
            		$("#error").html("");
            		if (window.location.hash) {
            			window.location.href = './index.html' + window.location.hash;
            		} else {
            			window.location.href = './index.html#/task';
            		}
                } else {
                	$("#error").html(eval('(' + result + ')').msg);
                    vmLogin.reflush();
                }
            } 
        });
    },
    reflush: function(){
    	$("#vcode").attr("src", 'commMods/ajax?action=captchaAction&verb=getKaptchaImage&_'+new Date()); 
    },
   //提交方法调用，用来保存账号和密码
    submit_form: function () {
    	if ($('#save-password').is(':checked')){
    		var name = $('#userId').val();
    		var password = $('#password').val();
    		vmLogin.save_token('save_password', 1);
    		vmLogin.save_token('login_account', name);
    		vmLogin.save_token('login_password', password);
    	}else {
    		vmLogin.delete_token('save_password');
    		vmLogin.delete_token('login_account');
    		vmLogin.delete_token('login_password');
    	}
    },

    //删除token
    delete_token: function (name) {
    	var exp = new Date();
    	exp.setTime(exp.getTime() - 1);
    	document.cookie = name + "=null"+ ";expires=" + exp.toGMTString();
    },


    //获得token值
    get_token: function (name) {
    	var arr,reg=new RegExp("(^| )" + name + "=([^;]*)(;|$)");
    	if(arr=document.cookie.match(reg)){
    		return unescape(arr[2]);
    	}else {
    		return null;
    	}
    },

    //保存token
    save_token: function (name, value) {
    	var exp = new Date();
    	exp.setTime(exp.getTime() + 30*24*60*60*1000);
    	document.cookie = name + "="+ escape (value) + ";expires=" + exp.toGMTString();
    }
};

//you don't need this, just used for changing background
jQuery(function ($) {
    $('#btn-login-dark').on('click', function (e) {
        $('body').attr('class', 'login-layout');
        $('#id-text2').attr('class', 'white');
        $('#id-company-text').attr('class', 'blue');

        e.preventDefault();
    });
    $('#btn-login-light').on('click', function (e) {
        $('body').attr('class', 'login-layout light-login');
        $('#id-text2').attr('class', 'grey');
        $('#id-company-text').attr('class', 'blue');

        e.preventDefault();
    });
    $('#btn-login-blur').on('click', function (e) {
        $('body').attr('class', 'login-layout blur-login');
        $('#id-text2').attr('class', 'white');
        $('#id-company-text').attr('class', 'light-blue');

        e.preventDefault();
    });

});

$(function (){
	//是否记住密码
	var save_password = vmLogin.get_token('save_password');
	if (save_password){
		//获取用户名、密码
		$('#save-password').attr('checked', true);
		$('#userId').val(vmLogin.get_token('login_account'));
		$('#password').val(vmLogin.get_token('login_password'));
		return false;
	}
	//条件查询回车事件绑定
	keydownFunc("vmLogin.login");
});