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
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="widtd=device-widtd,initial-scale=1.0,maximum-scale=1.0,minimum-scale=1.0,user-scalable=no">
<meta name="format-detection" content="telephone=no">
<meta name="apple-mobile-web-app-capable" content="yes">
<title>质检报告</title>
<link href="<%=basePath %>assets-new/css/qualityCheck/css.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=basePath %>assets-new/js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="<%=basePath %>assets-new/js/qualityCheck/zhijian.js"></script>
</head>

<body>

    <header class="head_unified">
        <a href="#"><img src="<%=basePath %>assets-new/img/qualityCheck/esc.png"></a>
        	质检报告列表
       	<a class="head_right"><img class="login" src="<%=basePath %>assets-new/img/qualityCheck/login.png"></a>
	    <div class="login_show">
        	<a class="login_gai" href="/qualityCheck/showReset">修改密码</a>
            <a class="longin_esc" href="/qualityCheck/logout">退出登录</a>
            <img src="<%=basePath %>assets-new/img/qualityCheck/login3.png">
    	</div>
    </header>

    <!--选择-->
	<div class="j_switch">
    	<span class="j_switch_tab">验收报告</span>
        <span class="j_switch_bat">验收报告</span>
        <ul>
        	<li><a href="/qualityCheck/xjlist">待办工作</a></li>
            <li><a class="selected" href="/qualityCheck/myReports" onclick="operationLog(24)">质检报告</a></li>
            <li><a href="/qualityCheck/acceptReport" onclick="operationLog(25)">约检验收</a></li>
        </ul>
    </div>
    
    
     <!--头部-->
	<div class="soso">
	  <form method="post" action="/qualityCheck/myReports">
			<input class="so" type="text" name="queryname" placeholder="小区名称、客户姓名或项目经理" value="${queryname}">
      		<%--<div class="soan">--%>
				<%--<label onclick="search()">搜索</label>--%>
			<%--</div>--%>
		  <input class="soan" name="" type="button" value="搜索" onclick="search()"/>
      </form>
    </div>
    
    
    
    <!--项目-->
	<div class="j_tab">
    	<p class="j_tabp" data-id="0">质检报告</p>
    	<%-- <c:if test="${allRootFlag != 1}"><p data-id="1">约检验收</p></c:if> --%>
    </div>
   <%--  <div class="j_tab1" <c:if test="${step == null}">style="display: none;"</c:if>>
    	<p data-step="10" <c:if test="${step == 10}">class="j_tabp"</c:if>>水电验收</p>
    	<p data-step="20" <c:if test="${step == 20}">class="j_tabp"</c:if>>中期验收</p>
    	<p data-step="30" <c:if test="${step == 30}">class="j_tabp"</c:if>>预竣工验收</p>
    </div> --%>
    
    
    
    <!--内容-->
    <div class="j_content">
    	<c:forEach var="check" items="${checkReports}">
          <c:forEach var="item" items="${reportList}">

				<c:if test="${check.orderNo == item.orderNo}">
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td width="25%" align="center">顾客</td>
							<td scope="col">${item.community}-${item.building}-${item.unit}-${item.room}-${item.userName}</td>
						</tr>
						<tr>
							<td align="center">客户电话</td>
							<td>${item.mobile}</td>
						</tr>
						<tr>
							<td align="center">项目经理</td>
							<td>${item.projectManager}</td>
						</tr>
						<tr>
							<td align="center">质检日期</td>
							<td><fmt:formatDate value="${check.updateTime}"
									pattern="yyyy-MM-dd" /></td>
						</tr>
						<tr>
							<td align="center">检查内容</td>
							<c:if test="${check.type == 10}"><td>日常巡检</td></c:if>
							<c:if test="${check.type == 20}"><td>约检</td></c:if>
							<c:if test="${check.type == 30}"><td>${check.checkContent}—线上复检</td></c:if>
							<c:if test="${check.type == 40}"><td>${check.checkContent}—现场复检</td></c:if>	
						</tr>
						<tr>
							<td colspan="2" scope="row"><a
								href="/qualityCheck/reportDetail?checkId=${check.id}"
								class="j_content_tda">查看报告</a></td>
						</tr>
					</table>
				</c:if>
			</c:forEach>
        </c:forEach>
       <label style="text-align: center; font-family:'微软雅黑'; font-size:1rem;">${msg}</label>
    </div>
    
<script type="text/javascript"> 
/* $(".j_tab").find("p").click(function(){
	var id = $(this).attr("data-id");
	if(id == 0){
		$(".j_tab1").hide();
	}else if(id == 1){
		$(".j_tab1").show();
	}
});
$(".j_tab1").find("p").click(function(){
	var step = $(this).attr("data-step");
	
	var form = $("<form method='post' action='/qualityCheck/acceptReport' ></form>");
	var stepInput = $("<input name='step' type='hidden' value='" + step + "'/> ");
	form.append(stepInput);
	$("body").append(form);
	
	form.submit();
}); */
function search(){
	$("form").submit();
}
</script>
</body>
</html>
