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
<title>登录</title>
<link href="<%=basePath%>assets-new/css/paileiLogin/css.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="<%=basePath%>assets-new/css/paileiLogin/css6.css" media="screen and (min-width: 375px)"> 
<link rel="stylesheet" type="text/css" href="<%=basePath%>assets-new/css/paileiLogin/css6plus.css" media="screen and (min-width: 414px)">  
<script src="<%=basePath%>assets-new/js/paileiLogin/js.js"></script>
<script type="text/javascript" src="<%=basePath%>assets-new/js/paileiLogin/jquery.min.js"></script>
</head>
<body>
<form action="/paileiLogin/login" method="post" id="loginForm">
	<div class="land">
    	<i></i>
        <p>请输入登录设计师排雷工具的账号（姓名全拼）</p>
        <input type="text" placeholder="请输入账户" id="loginUserName" name="loginUserName">
        <p class="border_t">请输入登录设计师排雷工具的密码</p>
        <input class="border_b" type="password" placeholder="请输入密码" id="loginPassword" name="loginPassword">
        <p class="border_b"></p>
        <p style="color:red;">${errorMassage}</p>
        <input class="land_ok" type="submit" value="登录" id="Dl">
    </div>
</form>
</body>
</html>
