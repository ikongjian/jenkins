
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
<link href="<%=basePath %>assets-new/css/qualityCheck/css.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=basePath %>assets-new/js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="<%=basePath %>assets-new/js/qualityCheck/zhijian.js"></script>
</head>

<body>
	<div class="land">
	<form action="/mobile/publish/login" method="post" id="loginForm">
    	<i></i>
        <p>请输入登录ERP的账号（姓名全拼）</p>
        <input type="text" name="loginUserName" placeholder="请输入账户">
        <p class="border_t">请输入登录ERP的密码</p>
        <input class="border_b"  name="loginPassword" type="password" placeholder="请输入密码">
        <p class="border_b"></p>
        <input class="land_ok" type="submit" value="登录">
        </form>
         <p class="border_t"><c:out value="${errorMassage }"></c:out></p>
    </div>
</body>
</html>
