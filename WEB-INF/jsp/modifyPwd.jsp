<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="en" uri="/enumTag"%>
<title>修改密码</title>
<style>
<!--
.changePW .formGroup input[type=button] {
  float: right;
  margin-top: 1rem;
  width: 75%;
  height: 5.5rem;
  font-size: 2.4rem;
  background: #ed6c00;
  border-radius: 0.5rem;
  color: #fff;
}
-->
</style>

<%@ include file="/WEB-INF/jsp/layout/cssjs.jsp"%>

<!--侧面导航-->
<%@ include file="/WEB-INF/jsp/layout/menu.jsp"%>
<!--侧面导航结束-->

 <!--右侧内容框架-->
 <div class="content">
        <!--修改密码-->
        <div class="title">
            <h2>修改密码</h2>
            <i><img src="/assets-new/img/nav_0.png"></i>
            <!-- <a href="#"><img src="/assets-new/img/esc.png"></a> -->
        </div>
        <hr class="content_hr">
        <div class="changePW">
            <form  id="editPwdForm">
                <div class="formGroup">
                    <label for="pwd">原密码</label>
                    <p>
                        <input id="pwd" type="password" placeholder="请输入当前密码" name="" value="">
                    </p>
                </div>
                <div class="formGroup">
                    <label for="newPwd">新密码</label>
                    <p>
                        <input id="newPwd" type="password" placeholder="请输入新密码" name="" value="">
                    </p>
                </div>
                <div class="formGroup">
                    <label for="newPwdAgain">确认新密码</label>
                    <p>
                        <input id="newPwdAgain" type="password" placeholder="请再次输入新密码" name="" value="">
                    </p>
                </div>
                <div class="formGroup">
                    <input id="submitId" type="button" value="确定" >
                </div>
            </form>
        </div>
    </div>
    <!--右侧内容框架结束-->

<script type="text/javascript">
	$(function() {
		//$(".input_ok").click(function() {
		$("#submitId").click(function() {
			
			var pwd=$("#pwd").val();
			var newPwd=$("#newPwd").val();
			var newPwdAgain=$("#newPwdAgain").val();
			if(pwd==null||pwd.length==0||newPwd==null||newPwd.length==0||
			   newPwdAgain==null||newPwdAgain.length==0) {
				layer.alert("密码不能为空！");
				return false;
			} 
			if(newPwd.length<8) {
				layer.alert("密码必须是8位或8位以上！");
				return false;
			}
			//是否包含数字和字母
			var reg = /^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{8,16}$/;
			if(!reg.test(newPwd)) {
				layer.alert("密码必须是数字和字母的组合！");
				return false;
			}
			if(pwd == newPwd) {
				layer.alert("新密码不能与原密码一致");
				return false;
			}
			if(newPwd!=newPwdAgain) {
				layer.alert("新密码与确认密码不一致！");
				return false;
			}
			if(newPwd!=newPwdAgain) {
				layer.alert("新密码与确认密码不一致！");
				return false;
			}
			
			$.post("/modifyPwd",{pwd:pwd,newPwd:newPwd,newPwdAgain:newPwdAgain},function(data) {
				
				if(data.statusCode=="success") {
					layer.alert(data.statusCodeInfo,function(){
						selectHref();
					});
				} else {
					layer.alert(data.statusCodeInfo);
				}
			}); 
			
		});
	});
	function selectHref() {
		if (token != null && token != '') {
			window.location = "/logoutFromApp";
		} else {
			window.location = "/logout";
		}
	}
	
	 /* $(function () {
         //隐藏返回按钮
         $(".nav").css("left","-16%");
         $(".nav").removeClass("animate");
         $(".content,.title").css("width","100%")
     }); */
     
</script>