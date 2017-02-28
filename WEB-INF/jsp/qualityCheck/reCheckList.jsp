
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
        复检项目列表
       	<a class="head_right"><img class="login" src="<%=basePath %>assets-new/img/qualityCheck/login.png"></a>
	    <div class="login_show">
        	<a class="login_gai" href="/qualityCheck/showReset">修改密码</a>
            <a class="longin_esc" href="/qualityCheck/logout">退出登录</a>
            <img src="<%=basePath %>assets-new/img/qualityCheck/login3.png">
    	</div>
    </header>


   <!--选择-->
	<div class="j_switch">
    	<span class="j_switch_tab">待办工作</span>
        <span class="j_switch_bat">待办工作</span>
        <ul>
        	<li><a  class="selected" href="/qualityCheck/xjlist">待办工作</a></li>
            <li><a href="/qualityCheck/myReports" onclick="operationLog(24)">质检报告</a></li>
            <li><a href="/qualityCheck/acceptReport" onclick="operationLog(25)">约检验收记录</a></li>
        </ul>
    </div>
    
    
    <!--头部-->	
	<div class="soso">
	  <form id="queryfrom" method="post" action="/qualityCheck/rechecklist">
			<input class="so" type="text" name="queryname" placeholder="小区名称、客户姓名或项目经理" value="${queryname}">
      		<%--<div class="soan">--%>
				<%--<label onclick="search()">搜索</label>--%>
			<%--</div>--%>
          <input class="soan" name="" type="button" value="搜索" onclick="search()"/>
      </form>
    </div>
    
    <!--项目-->
	<div class="j_tab">
    	<p data-id="0">巡检项目</p>
    	<c:if test="${allRootFlag != 1}"><p data-id="1">约检项目</p></c:if>
    	<c:if test="${allRootFlag != 1}"><p class="j_tabp" data-id="2">复检项目</p></c:if>
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
            <td	align="center">复检内容</td>
            <td>${item.checkContent}—
            	<c:if test="${item.checkType==30}">线上复检</c:if>
            	<c:if test="${item.checkType==40}">现场复检</c:if>
            </td>
          </tr>
          <tr>
            <td	align="center">项目经理</td>
            <td>${item.projectManager}</td>
          </tr>
          <tr>
          	<c:if test="${item.checkType == 30}">
          		<td align="center">申请日期</td>
            	<td><fmt:formatDate value="${item.reCheckApplyTime}" pattern="yyyy-MM-dd"/></td>
          	</c:if>
            <c:if test="${item.checkType == 40}">
            	<td align="center">期望检查日期</td>
            	<td><fmt:formatDate value="${item.checkTime}" pattern="yyyy-MM-dd"/></td>
          	</c:if>
          </tr>
          <tr>
             <td colspan="2" scope="row">
             <div style="display:block; text-align:center; margin:auto;">
             
             <c:if test="${item.checkType == 40}">
             	<a href="#" name="checkview"  data-checkid="${item.checkId}" data-orderno="${item.orderNo }" data-type="${item.checkType}">到达现场</a>
             </c:if>
             <a href="#" name="checkdeal"  data-checkid="${item.checkId}" data-orderno="${item.orderNo }" data-type="${item.checkType}"
             	<c:if test="${item.checkType == 30}">style="width:40%; margin:0.5rem 30%;" data-sign="1"</c:if>
                <c:if test="${item.checkType == 40}">data-sign="${item.signStatus}"</c:if>
                <c:if test="${item.signStatus != 1 and item.checkType == 40}">style="color: gray;"</c:if>>
             	检查项目
             	<c:if test="${item.checkedFlag}"><i><img src="<%=basePath %>assets-new/img/qualityCheck/dian.png"></i></c:if>
             
             </a>
             
             </div>
             </td>
          </tr>
        </table>
       </c:forEach>
       <label style="text-align: center; font-family:'微软雅黑'; font-size:1rem;">${msg}</label>
    </div>


<script type="text/javascript"> 

$("a[name=checkview]").click(function(){
	
	var form = $("<form method='post' action='/qualityCheck/checkInView' ></form>");
	var checkid = $("<input name='checkId' type='hidden' value='" + $(this).attr("data-checkid") + "'/> ");
	var orderNo = $("<input name='orderNo' type='hidden' value='" + $(this).attr("data-orderno") + "'/> ");
	var type = $("<input name='type' type='hidden' value='" + $(this).attr("data-type") + "'/> ");
	form.append(checkid).append(orderNo).append(type);
	$("body").append(form);
	
	form.submit();
});
$("a[name=checkdeal]").click(function(){
	
	var status = $(this).attr("data-status");
	if(status == 1){
		return ;
	}
    var sign = $(this).attr("data-sign");
    if(sign != 1){
        alert("请先签到在检查");
        return;
    }

	var form = $("<form method='post' action='/qualityCheck/checkViewToDeal' ></form>");
	var checkid = $("<input name='checkId' type='hidden' value='" + $(this).attr("data-checkid") + "'/> ");
	var orderNo = $("<input name='orderNo' type='hidden' value='" + $(this).attr("data-orderno") + "'/> ");
	var type = $("<input name='type' type='hidden' value='" + $(this).attr("data-type") + "'/> ");
	form.append(checkid).append(orderNo).append(type);	
	$("body").append(form);
	
	form.submit();
});

function search(){
	$("input[name=searchFlag]").val(1);
	$("#queryfrom").submit();
}

$(".j_tab").find("p").click(function(){
	var id = $(this).attr("data-id");
	if(id == 0){
		window.location = "/qualityCheck/xjlist";
	}
	if(id == 1){
		window.location = "/qualityCheck/inviteList";
	}
	if(id == 2){
		window.location = "/qualityCheck/rechecklist";
	}
});

</script>
</body>
</html>
