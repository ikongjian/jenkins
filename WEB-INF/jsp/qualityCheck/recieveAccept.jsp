
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
<!DOCTYPE html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="widtd=device-widtd,initial-scale=1.0,maximum-scale=1.0,minimum-scale=1.0,user-scalable=no">
<meta name="format-detection" content="telephone=no">
<meta name="apple-mobile-web-app-capable" content="yes">
<title>质检列表</title>
<link href="<%=basePath %>assets-new/css/qualityCheck/css.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=basePath %>assets-new/js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="<%=basePath %>assets-new/js/qualityCheck/zhijian.js"></script>
</head>

<body>

    <header class="head_unified">
        <a href="/qualityCheck/inviteList"><img src="<%=basePath %>assets-new/img/qualityCheck/esc.png"></a>
        确认验收
       	<a class="head_right"><img class="login" src="<%=basePath %>assets-new/img/qualityCheck/login.png"></a>
	    <div class="login_show">
        	<a class="login_gai" href="/qualityCheck/showReset">修改密码</a>
            <a class="longin_esc" href="/qualityCheck/logout">退出登录</a>
            <img src="<%=basePath %>assets-new/img/qualityCheck/login3.png">
    	</div>
    </header>
    
    <!--内容-->
    <div class="j_content">
       <c:forEach var="item" items="${list}">
          <form action="/qualityCheck/recieveAccept" method="post" id="form">
          <hr>
          <table widtd="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
          	<td width="25%" align="center">顾客</td>
          	<td scope="col">${item.community}-${item.building}-${item.unit}-${item.room}-${item.userName}</td>
          </tr>
          <tr>
            <td align="center">客户电话</td>
            <td>${item.mobile }</td>
          </tr>
          <tr>
            <td	align="center">项目经理</td>
            <td>${item.projectManager}</td>
          </tr>
          <tr>
            <td	align="center">约检内容</td>
            <td>${item.checkContent}</td>
          </tr>
          <tr>
            <td align="center">约检日期</td>
            <td><fmt:formatDate value="${item.checkTime}" pattern="yyyy-MM-dd"/></td>
          </tr>
          <tr>
            <td align="center">验收日期</td>
            <td>
            	<input class="j_content_date" type="date" name="acceptDate" >
            </td>
          </tr>
          <tr>
             <td colspan="2" scope="row">
                <input type="button" value="确定" onclick="comfirm()" style="margin:1rem auto; float:none;">
             </td>
          </tr>
		  </table>
		  <input type="hidden" name="id" value="${item.checkId}">
		  <input type="hidden" name="orderNo" value="${item.orderNo}">
		  <input type="hidden" name="pointId" value="${item.pointTemplateId}">
		  </form>
	   </c:forEach>
	</div>

<script type="text/javascript">
function comfirm(){
	var acceptDate = $("input[name=acceptDate]").val();
	var checktime = $("input[name=acceptDate]").attr("data-checktime");
	if(acceptDate == null || acceptDate == "" || acceptDate ==undefined){
		alert("请填写验收日期");
		return;
	}
	var now = new Date().Format("yyyy-MM-dd");
	if(compareDate(acceptDate,now) < 0){
		alert("验收时间不能选择以前时间");
		return;
	}
	
	//记录验收日志
	operationLog(23);
	
	$("#form").submit();
}
$("input[name=acceptDate]").change(function(){
	var accept = $(this).val();
	var now = new Date().Format("yyyy-MM-dd");
	if(compareDate(accept,now) < 0){
		alert("验收时间不能选择以前时间");
		return;
	}
});
</script>

</body>
</html>
