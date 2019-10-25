$(function() {
    $('#btnLogin').on('click', function() {
    	var gotourl=$('#gotourl').val();
    	if(typeof(gotourl)=='undefined'){gotourl='';}
        $.ajax({
            type: 'post',
            url :gotourl+'public/login',
            data: {
            	login: $('#name').val(),
                password: $('#password').val(),
                verification_code: ''
            },
            dataType : 'json',
            success: function (result) {
            	var message = result.message;
            	if (result && result.success){
                	var token = result.token;
					//保存token到cookie
					setCookies('cinemaplat_token', token, 4);
                	 location.reload();
                } else {
                    alert(result.message);
                }
            },
            error: function (err) {
                console.log(err);
                alert("登录失败，请稍后再试！");
            }
        });
    });
    $('#btnLogout').on('click', function() {
    	var gotourl=$('#gotourl').val();
    	if(typeof(gotourl)=='undefined'){gotourl='';}
        $.ajax({
            type: 'post',
            url :gotourl+'public/logout?token='+getToken(),
            success: function (result) {
            	deleteToken();
            	location.reload();
            },
            error: function (err) {
                console.log(err);
                alert("退出失败！");
            }
        });
    });
    $('#btnReg').on('click', function() {
    	var gotourl=$('#gotourl').val();
    	if(typeof(gotourl)=='undefined'){gotourl='';}
    	window.location.href=gotourl+'reg.html';
    });
    $('input').on('keyup', function() {
        $(this).parent().removeClass('error');
    });

    $(document).on('keyup', function(event) {
        if (event.keyCode == "13") {
            //回车执行查询
            $('#btn').click();
        }
    });
   //保存cookies
    function setCookies(key, value, hour) {
    	var time = new Date();
    	time.setTime(time.getTime() + hour * 60 * 60 * 1000);
    	document.cookie = key + '=' + value + ";path=/;expires=" + time.toGMTString();
    }
});