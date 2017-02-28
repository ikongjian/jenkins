<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<html>
	<head>
		<meta charset="UTF-8"/>
        <meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0"/> 
		<title>身份验证</title>
		<link rel="stylesheet" type="text/css" href="/assets/css/css_wechat.css"/>
		<script type="text/javascript" src="/assets/js/jquery-1.11.3.min.js"></script>
		<script type="text/javascript">
			//手机号码框中只能输入数字
			$(function() {
				$("#telephone").keyup(function() {
					this.value=this.value.replace(/\D/g,'');
				});
			});
			//验证11位手机号数 
			function isCellPhoneNumber(telephone) {
				var cellphoneReg=/^13[0-9]{9}$|^15[0-9]{9}$|^18[0-9]{9}$/;
				if(cellphoneReg.test(telephone)) {
					return true;
				} else {
					return false;
				}
			}
			//提交表单时验证
			function checkInfo() {
				var flag=true;//表示验证通过
				$(".errorTip").hide();
				var name=$("#name").val().trim();
				var telephone=$("#telephone").val().trim();
				if(name=="") {
					$(".errorTip").slideDown();
					$(".errorTip").html("请输入真实姓名！");
					$("#name").focus();
					flag=false;
					return false;
				}
				if(telephone==""||!isCellPhoneNumber(telephone)) {
					$(".errorTip").slideDown();
					$(".errorTip").html("请输入有效手机号码！");
					$("#telephone").focus();
					flag=false;
					return false;
				}
				$("#token").val(token);
				$("#loginUserName").val(loginUserName);
				$.ajax({
					url:"/weixinUtilController/validateWorker",
					data:{name:name,telephone:telephone},
					type:"post",
		            dataType:"json",
		            async:false,
		            cache:false,
		            success:function(result) {
		            	if(result.count==0) {
		            		$(".errorTip").slideDown();
							$(".errorTip").html("您输入的姓名或手机号码有误！");
							flag=false;
							return false;
		            	}
		            }
				});
				return flag;
			}
		</script>
	</head>
	<body class="identity">
		<form action="/weixinUtilController/updateMemberInfoWeixin" method="post" onsubmit="return checkInfo();">
			<input type="hidden" name="token" id="token"/>
	    	<input type="hidden" name="loginUserName" id="loginUserName"/>
			<!--从微信中取到的登录者的openid-->
			<input type="hidden" name="weixin" id="weixin" value="${weixin}"/>
			<input type="text" name="name" id="name" class="identity_name" placeholder="请输入真实姓名"/>
			<input type="tel" name="telephone" id="telephone" class="identity_tel" maxlength="11" placeholder="请输入11位手机号码"/>
			<div class="errorTip" style=""></div>
			<input type="submit" class="identity_submit" value="完成身份验证"/>
		</form>
	</body>
</html>