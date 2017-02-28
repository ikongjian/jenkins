
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" name="viewport">
<meta content="no-cache" http-equiv="pragma">
<meta content="no-cache" http-equiv="cache-control">
<meta content="0" http-equiv="expires">
<title>修改密码</title>
<link href="<%=basePath %>assets-new/css/qualityCheck/css.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=basePath %>assets-new/js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="<%=basePath %>assets-new/js/qualityCheck/zhijian.js"></script>
</head>

<!-- <body>
	<div class="land">
	<form action="/qualityCheck/reset" method="post" id="resetForm">
        <p>登录ERP的账号</p>
        <p>${userName}</p>
        <p class="border_t">请输入登录ERP的密码</p>
        <input class="border_b"  name="Password" type="password" placeholder="请输入原密码">
        <p class="border_b"></p>
        
        <input class="border_b"  name="newPassword" type="password" placeholder="请输入新密码">
        <p class="border_b"></p>
        <input class="border_b"  name="newPassword1" type="password" placeholder="请再次输入新密码" onchange="newPasswordChange()"><span id="pwdagain"></span>
        <p class="border_b"></p>
        
        <input type="hidden" id="isok"/>
        
        <input type="button" value="确认修改" onclick="update()"/>
        <input type="button" value="清除" onclick="reset()"/>
    </form>
    <p class="border_t"><c:out value="${errorMassage}"></c:out></p>
    </div>
-->

<body style="background:#fff;">
	<!--头部-->
    <header class="head_unified">
        <a href="javascript:history.go(-1);"><img src="<%=basePath %>assets-new/img/qualityCheck/esc.png"></a>
        修改密码
    </header>
    <!--修改密码-->
    <div class="land">
    <form action="/qualityCheck/reset" method="post" id="resetForm">
        <input class="land_mm" type="password" name="Password" placeholder="当前密码">
        <input class="land_mm" type="password" name="newPassword" placeholder="请输入新密码" onchange="newPasswordChange()">
        <input class="land_mmm" type="password" name="newPassword1"  placeholder="请确认新密码" onchange="newPasswordChange()">
        <p id="p1"><c:out value="${errorMassage}"></c:out></p>
        <input type="hidden" id="isok"/>
        
        <input class="land_ok" type="button" value="确认修改" onclick="update()"/>
    </form>
    </div>
</body>


<script type="text/javascript">
function newPasswordChange(){
	var pwd = $("input[name=Password]").val();
	var password = $("input[name=newPassword]").val();
	var password1 = $("input[name=newPassword1]").val();
	
	if(!pwd || typeof(pwd)=="undefined"){
		$("#p1").attr("style", "text-align:center; font-size:1rem; color:#ff0000; line-height:1.2rem; margin:2rem 0;").html("请先输入旧密码");
		$("#isok").val(1);
	}else if (!password || typeof(password)=="undefined" || $.trim(password) == ""){
		$("#p1").attr("style", "text-align:center; font-size:1rem; color:#ff0000; line-height:1.2rem; margin:2rem 0;").html("请输入新密码");
		$("#isok").val(1);
	}else if(password == password1){
		$("#p1").attr("style", "text-align:center; font-size:1rem; color:#008080; line-height:1.2rem; margin:2rem 0;").html("密码一致");
		$("#isok").val(0);
	}else if(password != password1 && $.trim(password1) != ""){
		$("#p1").attr("style", "text-align:center; font-size:1rem; color:#ff0000; line-height:1.2rem; margin:2rem 0;").html("两次密码不一致");
		$("#isok").val(1);
	}else{
		$("#p1").attr("style", "text-align:center; font-size:1rem; color:#ff0000; line-height:1.2rem; margin:2rem 0;").html("");
		$("#isok").val(1);
	}
}
function update(){
	var isok = $("#isok").val();
	var password = $("input[name=Password]").val();
	if("0" != isok || !password || typeof(password)=="undefined" || $.trim(password) == ""){
		$("#p1").html("请确认正确的填写了密码和新密码");
		return;
	}
	$("#resetForm").submit();
}
</script>
</body>
</html>
