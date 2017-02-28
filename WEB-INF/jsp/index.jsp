<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>首页</title>

<script type="text/javascript" language="javascript">
$(function($){
	if(token != null && token.length >0){
		var userInfo = window.userinfo.GetMessages();
		var userArray = userInfo.split(",");
		if(userArray[0] != null && userArray[0].length >0){
			$("#nickName").html(userArray[1]);
	        $("#editName").val(userArray[1]);
		}else{
			$("#nickName").html("&nbsp;&nbsp;&nbsp;&nbsp;");
		}
		if(userArray[2] != null && userArray[2].length >0){
			$("#editMobile").val(userArray[2]);
		}
	}else{
		var COOKIE_NICKNAME = 'nickName';
		var COOKIE_TELE ="telephone";
	    if($.cookie(COOKIE_NICKNAME)!="null"){  
	        $("#nickName").html($.cookie(COOKIE_NICKNAME) );
	        $("#editName").val($.cookie(COOKIE_NICKNAME));
	    }else{
	    	$("#nickName").html("&nbsp;&nbsp;&nbsp;&nbsp;");  
	    }
	    if($.cookie(COOKIE_TELE)!="null"){
	    	$("#editMobile").val($.cookie(COOKIE_TELE));
	    }
	}
    
});
function selectHref(){
	if(token != null && token != ''){
    	window.location = "/logoutFromApp";
    }else{
    	window.location = "/logout";
    }
}
function editPwd(){
	<%--var flag=true;
	  $("#editPwdForm").find("input").each(function(){
		var name=$(this).attr("name");
		var val=$(this).val();
		var _name="";
		switch(name){
		case "pwd":_name="当前密码";break;
		case "newPwd":_name="新密码";break;
		case "newPwdAgain":_name="确认密码";break;
		}
		if(_name!=""&&val==""){
			$("#tips").html(_name+"不能为空");
			$(this).focus();
			flag=false;
			return false;
		}
	})
	if($("input[name='newPwd']").val()!=$("input[name='newPwdAgain']").val()){
		$("#tips").html("两次输入密码不一致！");
		flag=false;
		return false;
	} 
	if(flag){--%>
	$("#token").val(token);
	$("#loginUserName").val(loginUserName);
	$.post("/modifyPwd",$("#editPwdForm").serialize(),function(responseText,statusText){
			$("#tips").html(responseText.statusCodeInfo);
			if(responseText.statusCode=="success"){
				$("#pop").fadeOut(1000,function(){location.href="/logout";});
			}
		})
}
	function showUpdatePage(){
		$("#pop").show();
	}
</script>

</head> 
<body>
<!--姓名 退出-->
    <!-- <div class="out">
    	<span id="nickName"></span><a onClick="show();" style="width:80px; margin-right:25px;font-size: 10px;cursor: pointer;">修改个人资料</a>
    	<a href="/logout">退出</a>
    </div> -->
    <header>
    	<a class="nav_tc" id="logoutA" href="javascript:void(0);" onclick="selectHref()">退出</a>
    	<a onClick="showUpdatePage()" href="javascript:void(0);" class="nav_tc" style="width:100px; margin-right:-10px;font-size: 10px;cursor:pointer;">修改个人资料</a>
    	<a href="/push/list" class="nav_tc" style="width:100px; margin-right:-10px;font-size: 10px;cursor:pointer;">消息中心</a>
    	<p class="nav_name" id="nickName"></p>
    </header>
    <!--后期有切换-->
    <div class="nav_tab">
    	<p><img src="/assets/img/nav1.jpg"></p>
    </div>
    <!--切换内容-->
    <div class="nav_url">
    	<ul>
    		<%-- 权限设置 标签引入 <%@ taglib prefix="s" uri="/auth" %>  
    	    <s:role userId="${userId }" role="项目部">
    	    </s:role>
    	    <s:role userId="${userId }" role="木作">
    	    </s:role>
    	   --%>
            <li>
            	<a href="#">
                	<img src="/assets/img/nav4.jpg">
                    <p>排雷反馈</p>
                </a>
            </li>
            <li>
            	<a href="/confirmWorkDate/index">
                	<img src="/assets/img/nav5.jpg">
                    <p>确认开工</p>
                </a>
            </li>
            <li>
            	<a href="/accept/projectList">
                	<img src="/assets/img/nav9.jpg">
                    <p>验收反馈</p>
                </a>
            </li>
             <li>
            	<a href="/projectDispater/projectListPage">
                	<img src="/assets/img/nav6.jpg">
                    <p>施工排班</p>
                </a>
            </li>
            <li>
            	<a href="/upload/toTakePhotosPage">
                	<img src="/assets/img/nav7.jpg">
                    <p>审核及拍照</p>
                </a>
            </li>
            <li>
            	<a href="/projectProgress/toProjectProgress">
                	<img src="/assets/img/nav8.jpg">
                    <p>进度通报</p>
                </a>
            </li>
            <li>
            	<a href="/pmProject/projectList">
                	<img src="/assets/img/nav3.jpg">
                    <p>我的项目</p>
                </a>
            </li>
            <li>
            	<a href="/projectProgress/projectList">
                	<img src="/assets/img/nav10.jpg">
                    <p>查看图纸</p>
                </a>
            </li>
            <li>
            	<a href="/price/list">
                	<img src="/assets/img/nav12.jpg">
                    <p>辅料核量</p>
                </a>
            </li>
            <li>
            	<a href="/worker/workerList">
                	<img src="/assets/img/nav11.jpg">
                    <p>工人信息</p>
                </a>
            </li>
            <li>
            	<a href="/completeWork/toProjectList">
                	<img src="/assets/img/nav11.jpg">
                    <p>确认完工</p>
                </a>
            </li>
        </ul>
    </div>
    <%-- <!--TAB-->
    <div class="c_tab">
    	<p class="c_tab1">项目经理</p>
        <p class="c_tab2">设计师</p>
        <p class="c_tab3" style="margin-right:0;">项目质检</p>
    </div>
    <div class="c_tab_text">
    	<ul>
        	<li>
            	<a href="/pmProject/projectList">
                	<img src="/assets/img/cli1.png" />
                    <p>我的项目</p>
                </a>
            </li>
            <li>
            	<a href="#">
                	<img src="/assets/img/cli2.png" />
                    <p>排雷安排</p>
                </a>
            </li>
            <li>
            	<a href="/confirmWorkDate/index">
                	<img src="/assets/img/cli3.png" />
                    <p>确认开工</p>
                </a>
            </li>
            <li>
            	<a href="/projectDispater/projectListPage">
                	<img src="/assets/img/cli4.png" />
                    <p>安排工序</p>
                </a>
            </li>
            <li>
            	<a href="/upload/toTakePhotosPage">
                	<img src="/assets/img/cli5.png" />
                    <p>我要拍照</p>
                </a>
            </li>
             <li>
            	<a href="/projectProgress/toProjectProgress">
                	<img src="/assets/img/cli5.png" />
                    <p>进度通报</p>
                </a>
            </li>
            <li>
            	<a href="/worker/workerList">
                	<img src="/assets/img/cli4.png" />
                    <p>工人维护</p>
                </a>
            </li>
            <li>
            	<a href="/accept/projectList">
                	<img src="/assets/img/cli2.png" />
                    <p>验收反馈</p>
                </a>
            </li>
        </ul>
    </div> --%>
    <div id="pop" class="pop" style="display:none"> 
    	<div class=" pop_qrkg mmxg">
    	<form id="editPwdForm">
    	    <input type="hidden" name="token" id="token"/>
    	    <input type="hidden" name="loginUserName" id="loginUserName"/>
			<div class="pop_grkg1">
				<p><span>姓名：</span><input id="editName" name="name" type="text" value=""></p>
				<p><span>手机号：</span><input id="editMobile" name="mobile" type="text" value=""></p>
	            <p><span>当前密码：</span><input name="pwd" type="password"></p>
	            <p><span>新密码：</span><input name="newPwd" type="password"></p>
	            <p><span>确认密码：</span><input name="newPwdAgain" type="password"></p>
	            <b id="tips"></b>
	            <p class="pop_kgp2"><input class="pop_kgan" type="button" value="修改" onclick="editPwd()"/></p>
	            <a class="pop_an" href="javascript:void(0);" onClick="hide()"><img src="/assets/img/a17.png" width="22" height="22"/></a>
	        </div> 
        </form>
        </div>     
	</div> 
         
</body>
</html>
 
