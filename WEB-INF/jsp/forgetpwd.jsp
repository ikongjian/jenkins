<%@page import="com.ikongjian.erp.enums.ErpLikpStateEnum"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="/pageTag" prefix="page"%>
<%@ taglib uri="/enumTag" prefix="en"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html lang="en">
 <head>
  <base href="<%=basePath%>"> 
  <script type="text/javascript" src="<%=basePath %>assets-new/js/jquery-1.8.3.min.js"></script>
  <title>忘记密码</title>
  <link rel="stylesheet" type="text/css" href="<%=basePath %>assets-new/css/css.css">
  <script src="/assetsjs/jquery-1.8.3.min.js"></script>
  <script src="/assetsjs/jiajian.js"></script>
 </head>
 
 
 <body onload="reset()">
    	<header>
        	<h6>修改密码</h6>
        	<c:if test="${flag!=1}">
        		<a href="/showLogin"><img src="<%=basePath %>assets-new/img/esc.png"></a>
        	</c:if>
        </header>
        <div class="content">
            <div class="modify">
            <form id="tijiao">
            	<input type="hidden" name="flag" value="${flag}">
               	<p>
               		<span>用户名:</span>
               		<input type="text" name="username">
            	</p>	
            	<p>	
            		<span>验证码:</span>
            		<input type="text" name="robotCheck" class="modify_text" >
            		<img alt="图片验证码" id="kaptchaImage" src="/ForgotPwd/validCode"/>
            	</p>	
            	<p>
                    <span>手机号:</span>
                    <input type="text" name="telphone" class="modify_text" />
                    <input type="button" id="send" value="发送验证码" class="modify_button" />
                </p>    
				<p>                    
                    <span>短信验证码:</span>
                    <input type="text" name="shotmessage">
                </p>   
                <p>    
                    <span>新密码:</span>
                    <input type="password" name="password" onblur="check(this)" onchange="check(this)">
					<!-- <input type="text" id="ruo"  style="width:30px;height:30px;background-color:#ff0000;text-align:center;" value="易" readonly="readonly"/>
					<input type="text" id="zhong" style="width:30px;height:30px;background-color:#ff9966;text-align:center;" value="中" readonly="readonly"/>
					<input type="text" id="qiang"  style="width:30px;height:30px;background-color:#00ff66;text-align:center;" value="难" readonly="readonly"/> -->
				</p>	
                <p>    
                    <span>确认密码:</span>
                    <input type="password" name="resetpasswor">
                </p>    
                <c:if test="${errorMessage!=null}"><div style="text-align: center; color: red;">${errorMessage.errorMessage}</div></c:if>
            	<p>
            		<span>&nbsp;</span>
            	    <input class="input_ok" type="button" value="提交" onclick="tijiao()" />
            	</p>    
            	<c:if test="${flag==1}">
            	<p>
            		<a href="#" onclick="backHome()">返回登录</a>
            	</p>
            	</c:if>
            </form>
            </div>
        </div>
<script type="text/javascript">
function reset(){
	$("#tijiao input[name=shotmessage]").val("");
	$("#tijiao input[name=password]").val("");
	/* $("#ruo").hide();
	$("#zhong").hide();
	$("#qiang").hide(); */
	
	var emg = "${errorMessage.errorMessage}";
	if(emg == "+OK"){
		window.forgetpassword.goToLogin();
	}
}

function backHome(){
	window.forgetpassword.goToLogin();
}


var flag=true;
var countdown=120;
/* $("#ruo").hide();
$("#zhong").hide();
$("#qiang").hide(); */
$("#send").removeAttr("disabled");
function check(a){
	/* $("#ruo").hide();
	$("#zhong").hide();
	$("#qiang").hide(); */
	var ruo1=/^\d{6,}$/;
	var ruo2=/^[a-z]{6,}$/;
	var ruo3=/^[A-Z]{6,}$/;
	var zhong=/^(?!^\d+$)(?!^[a-z]+$)[0-9a-z]{6,}$/;
	var zhong1=/^(?!^\d+$)(?!^[A-Z]+$)[0-9A-Z]{6,}$/;
	var zhong2=/^(?!^[A-Z]+$)(?!^[a-z]+$)[A-Za-z]{6,}$/;
	var qiang=/^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])[a-zA-Z0-9]{6,}$/;
	var password=$("input[name='password']").val();
	if(qiang.test(password)){
		//$("#qiang").show();
	}else if(zhong.test(password)){
		//$("#zhong").show();
	}else if(zhong1.test(password)){
		//$("#zhong").show();
	}else if(zhong2.test(password)){
		//$("#zhong").show();
	}else if(ruo1.test(password)){
		//$("#ruo").show();
	}else if(ruo2.test(password)){
		//$("#ruo").show();
	}else if(ruo3.test(password)){
		//$("#ruo").show();
	}else{
		alert("不是合法的密码,请至少输入6为的数字、字母");
		return;
	}
}
//发送短信验证码
$("#send").click(function(){
	var username=$("input[name='username']").val();
	var robotCheck=$("input[name='robotCheck']").val();
	var telphone=$("input[name='telphone']").val();
    var countdown = 120;
    var _this = $(this);
    //设置button效果，开始计时
    _this.attr("disabled", "true");
    _this.val(countdown + "秒后重新获取");
    //启动计时器，1秒执行一次
    var timer = setInterval(function(){
       if (countdown == 0) {                
           clearInterval(timer);//停止计时器
           _this.removeAttr("disabled");//启用按钮
           _this.val("发送验证码");
       }
       else {
           countdown--;
           _this.val(countdown + "秒后重新获取");
       }
    }, 1000);
    var data={
			username:username,
			robotCheck:robotCheck,
			telphone:telphone	
	}
    $.ajax({
       type : 'post',
       url :'/ForgotPwd/sendInfo',
       dataType : 'json',
       data :data,
       success : function(result) {
    	   if(result.result==false){
				if(result.flag=='username'){
					alert(result.msg);
					countdown = 0;
					return;
				}else if(result.flag=='robotCheck'){
					alert(result.msg);
					countdown = 0;
					return;
				}else if(result.flag=='telphone'){
					alert(result.msg);
					countdown = 0;
					return;
				}
			}else{
				
			}
       }
   });
   return false;
});

//提交
function tijiao(){
	var username=$("input[name='username']").val();
	var robotCheck=$("input[name='robotCheck']").val();
	var telphone=$("input[name='telphone']").val();
	var password=$("input[name='password']").val();
	var resetpasswor=$("input[name='resetpasswor']").val();
	var shotmessage=$("input[name='shotmessage']").val();
	if(username==null||username==""){
		alert("请输入用户名");
		return false;
	}
	if(robotCheck==null||robotCheck==""){
		alert("请输入图片验证码");
		return false;
	}
	var myreg = /^(((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1}))+\d{8})$/; 
	if(telphone==null||telphone==""){
		alert("请输入手机号");
		return false;
	}else if(!myreg.test(telphone)){
		alert("请输入合法的手机号");
		return false;
	}
	if(shotmessage==null||shotmessage==""){
		alert("短信验证码没有输入");
		return false;
	}
	if(password==null||password==""){
		alert("新密码没有输入");
		return false;
	}
	if(resetpasswor==null||resetpasswor==""){
		alert("确认新密码没有输入");
		return false;
	}
	if(password!=resetpasswor){
		alert("新密码与确认密码不一致");
		return false;
	}
	var form=$("#tijiao");
	form.attr('action','/ForgotPwd/reset');
	form.attr('method', 'post'); 
	form.submit();
}

//刷新图片验证码
$(function(){
	$("#kaptchaImage").click(function(){
		$("#kaptchaImage").attr("src","/ForgotPwd/validCode?"+new Date());
	});
})

</script>

</body>
</html>
