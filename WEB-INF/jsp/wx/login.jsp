<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE >
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" name="viewport">
<meta content="no-cache" http-equiv="pragma">
<meta content="no-cache" http-equiv="cache-control">
<meta content="0" http-equiv="expires">
<meta name="format-detection" content="telephone=no" />
<link rel="stylesheet" type="text/css" href="/assets-new/wx/css/css.css">
<script type="text/javascript" src="/assets-new/wx/js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="/assets-new/layer-v2.0/layer/layer.js"></script>
<title>身份验证</title>
<script type="text/javascript">
//手机号码框中只能输入数字
$(function() {
	var msg = '${msg}';
	if(msg!=null&&msg.length>0){
		layer.msg(msg, {
		    icon: 6,
		    time: 1000 //2秒关闭（如果不配置，默认是3秒）
		}, function(){
			$("#hrCode").focus();
		});
	}
	$("#telephone").keyup(function() {
		this.value=this.value.replace(/\D/g,'');
	});
	$("#code").keyup(function() {
		this.value=this.value.replace(/\D/g,'');
	});
});
function checkform(){
	var hrCode = $("#hrCode").val();
	var telephone = $("#telephone").val();
	if(hrCode==null||hrCode.length==0){
		layer.msg('员工编码不能为空！', {
		    icon: 6,
		    time: 1000 //2秒关闭（如果不配置，默认是3秒）
		}, function(){
			$("#hrCode").focus();
		});
		return false;
	}
	if(telephone==null||telephone.length==0){
		layer.msg('手机号不能为空！', {
		    icon: 6,
		    time: 1000 //2秒关闭（如果不配置，默认是3秒）
		}, function(){
			$("#telephone").focus();
		});
		return false;
	}
}
</script>
</head>
<body>
	<!--身份验证-->
    <div class="identity">
       <form action="/wx/wxLogin" name="loginForm" method="post" onsubmit="return checkform()">
        <%-- <input type="hidden" name="weixin" value="${weixin }" /> --%>
    	<i class="identity_icon"><img src="/assets-new/wx/img/icon.png"></i>
        <h1 class="identity_title">身份验证</h1>
        <p class="identity_content">
        	<input class="verify verify_name" name="hrCode" id="hrCode" type="text" placeholder="请输入员工编号">
            <span class="prompt">*编号，不能为空</span>
        </p>
        <p class="identity_content">
        	<input class="verify verify_tele" name="telephone" id="telephone" type="text" placeholder="请输入手机号">
            <span class="prompt">*手机号、11位手机号规则，不能为空</span>
        </p>
        <p class="identity_submit">
        	<input class="button" type="submit" value="点这里，完成身份验证">
            <span class="prompt">${msg}</span>
        </p>
       </form>
    </div>
</body>
</html>
