
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
        <a href="#"><img src="<%=basePath %>assets-new/img/qualityCheck/esc.png"></a>
        验收报告
       	<a class="head_right"><img class="login" src="<%=basePath %>assets-new/img/qualityCheck/login.png"></a>
	    <div class="login_show">
        	<a class="login_gai" href="/qualityCheck/showReset">修改密码</a>
            <a class="longin_esc" href="/qualityCheck/logout">退出登录</a>
            <img src="<%=basePath %>assets-new/img/qualityCheck/login3.png">
    	</div>
    </header>


    <!--选择-->
	<div class="j_switch">
    	<span class="j_switch_tab">约检验收</span>
        <span class="j_switch_bat">约检验收</span>
        <ul>
        	<li><a href="/qualityCheck/xjlist">待办工作</a></li>
            <li><a href="/qualityCheck/myReports" onclick="operationLog(24)">质检报告</a></li>
            <li><a class="selected" href="/qualityCheck/acceptReport" onclick="operationLog(25)">约检验收</a></li>
        </ul>
    </div>
    
    
    <!--头部-->	
	<div class="soso">
	  <form id="queryfrom" method="post" action="/qualityCheck/acceptReport">
			<input class="so" type="text" name="queryname" placeholder="小区名称、客户姓名或项目经理" value="${queryname}">
      		<input type="hidden" name="step" value="${step}">
      		<div class="soan">
				<label onclick="search()">搜索</label>
			</div>
      </form>
    </div>
    
    
    <!--项目-->
<%-- 	<div class="j_tab">
    	<p data-id="0">质检报告</p>
    	<c:if test="${allRootFlag != 1}"><p class="j_tabp" data-id="1">约检验收</p></c:if>
    </div> --%>
    <div class="j_tab1" <%-- <c:if test="${step == null}">style="display: none;"</c:if> --%>>
    	<p data-step="10" <c:if test="${step == 10}">class="j_tabp"</c:if>>水电验收</p>
    	<p data-step="20" <c:if test="${step == 20}">class="j_tabp"</c:if>>中期验收</p>
    	<p data-step="30" <c:if test="${step == 30}">class="j_tabp"</c:if>>竣工验收</p>
    </div>
    
    <!--内容-->
    <div class="j_content">
       <c:forEach var="item" items="${list}">
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
            <td><fmt:formatDate value="${item.acceptDate}" pattern="yyyy-MM-dd"/></td>
          </tr>
        </table>
       </c:forEach>
       <label style="text-align: center; font-family:'微软雅黑'; font-size:1rem;">${msg}</label>
    </div>


<script type="text/javascript"> 
/* $(".j_tab").find("p").click(function(){
	var id = $(this).attr("data-id");
	if(id == 0){
		window.location = "/qualityCheck/myReports";
	}else if(id == 1){
		$(".j_tab1").show();
	}
}); */
$(".j_tab1").find("p").click(function(){
	var step = $(this).attr("data-step");
	
	var form = $("<form method='post' action='/qualityCheck/acceptReport' ></form>");
	var stepInput = $("<input name='step' type='hidden' value='" + step + "'/> ");
	form.append(stepInput);
	$("body").append(form);
	
	form.submit();
});

function search(){
	$("#queryfrom").submit();
}
</script>
</body>
</html>
