<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<title>首页</title>
<meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=0">
<link rel="stylesheet" type="text/css" href="/assets/css/css.css">
<script type="text/javascript" src="/assets/js/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="/assets/js/jquery.cookie.js"></script>
<script type="text/javascript" src="/assets/js/Tc.js"></script>
<script>
	$(document).ready(function(e) {
		var COOKIE_NAME = 'username';
		var COOKIE_PWD = 'userpwd';
	    if($.cookie(COOKIE_NAME)!="null"){  
	        $("#loginUserName").val($.cookie(COOKIE_NAME) );  
	        $("#jzmm").attr("checked",true);
	    }
	    if($.cookie(COOKIE_PWD)!="null"){
	    	$("#loginPassword").val($.cookie(COOKIE_PWD) ); 
	    }
	    $("#jzmm,#jzmml").click(function(){
	    	if(this.checked){  
	            var date = new Date();  
	            date.setTime(date.getTime() + (7 * 24 * 60 * 60 * 1000)); //三天后的这个时候过期  
	            $.cookie(COOKIE_NAME, $("#loginUserName").val(), { path: '/', expires: date });
	            $.cookie(COOKIE_PWD, $("#loginPassword").val(), { path: '/', expires: date });
	        }else{  
	            $.cookie(COOKIE_NAME, null, { path: '/' });  //删除cookie 
	            $.cookie(COOKIE_PWD, null, { path: '/' });  //删除cookie  
	        }  
	    });
	    $("#Dl").click(function(){ 
			$("#loginForm").submit();
		});
	});
</script>
</head> 
<body>
	<h1 class="denglu_h1">
    	<img src="/assets/img/Logo.jpg" >
        项目管家
	</h1>
	<form action="/login.action" method="post" id="loginForm">
	<input class="denglu_input denglu_input1" id="loginUserName" name="loginUserName" type="text" placeholder="请输入用户名">
	<input class="denglu_input denglu_input2" id="loginPassword" name="loginPassword"  type="password" placeholder="请输入密码">
	<div class="denglu_xuan">
		<p><input id="jzmm" name="" type="checkbox" value=""><label for="jzmm" id="jzmml">记住密码</label></p>
		<%--<a href="#">忘记密码</a> --%>
		<a href="/ForgotPwd/showForgotPage">忘记密码</a>
	</div>
	<strong class="denglu_ts">${errorMassage}</strong>
	<input class="denglu_input denglu_an" name="" type="button" id="Dl" value="登录">
	</form>
	<!-- 	<input id="Mm" name="" type="checkbox" value="" /><p></p><label id="Mm1" for="Mm">记住密码</label>
            <input id="Dl" type="button" value="点击登录"/> -->



	<%-- <div class="back">
        <header>
            <a class="home" href="/index"><img src="/assets/img/house.png" /></a>
            <div class="home_fy">
                <a href="#"><img src="/assets/img/left.png" /></a>
                <a class="home_a" href="#"><img src="/assets/img/right.png" /></a>
            </div>
        </header>
        <form action="/login.action" method="post" id="loginForm">
        <input class="sigh_d" type="text" id="loginUserName" name="loginUserName" placeholder="用户名" />
        <input class="sigh_m" type="password" id="loginPassword" name="loginPassword"  placeholder="密码"/>
        <b>${errorMassage}</b>
        <div class="sigh_aj">
        	<input id="Mm" name="" type="checkbox" value="" /><p></p><label id="Mm1" for="Mm">记住密码</label>
            <input id="Dl" type="button" value="点击登录"/>
        </div>
        </form>
    </div> --%>
</body>
</html>
 