<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="com.ikongjian.erp.enums.WorkerPackageStateEnum" %>
<%@ taglib prefix="en" uri="/enumTag" %>
<!DOCTYPE >
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" name="viewport">
<meta content="no-cache" http-equiv="pragma">
<meta content="no-cache" http-equiv="cache-control">
<meta content="0" http-equiv="expires">
<title>任务包验收</title>
<script type="text/javascript">
	function okClick(){
		var packageId = $("#packageId").val();
		var orderNo = $("#orderNo").val();
		$.post("/package/packageComplete",
				{packageId:packageId},
				function(data){
					layer.alert(data.result, {
					    skin: 'layui-layer-molv' //样式类名
					    ,closeBtn: 0
					},function(){
						window.location.href="/package/threePath/toPackageList?orderNo="+orderNo;
					});
		})
	}
</script>
</head>

<body>
    <!--3级页面框架-->
    <div class="right frame">
    	<!--头部-->
    	<header>
        	<h6>任务包验收</h6>
        	<a href="/package/threePath/toPackageList?orderNo=${pack.orderNo }"><img src="/assets-new/img/esc.png"></a>
        </header>
        <div class="content">
        	<!--任务包验收-->
            <div class="order task">
            	<h2 class="title_h2">基本信息</h2>
                <ul>
                	<li>
                		<input type="hidden" name="packageId" id="packageId" value="${pack.packageId }"/>
                		<input type="hidden" name="orderNo" id="orderNo" value="${pack.orderNo }"/>
                    	<span>任务包名称：</span>
                        <b>${pack.packageName }</b>
                    </li>
                    <li>
                    	<span>状态：</span>
                        <b><en:out code="${pack.state }" enumClass="<%=WorkerPackageStateEnum.class %>"/></b>
                    </li>
                </ul>
                <h2 class="title_h2">安排施工</h2>
                <ul class="order_ul_li100">
                	<li>
                    	<span>安排施工工期：</span>
                        <b><fmt:formatDate value="${pack.startTime }" pattern="yyyy-MM-dd"/>至
                        	<fmt:formatDate value="${pack.endTime }" pattern="yyyy-MM-dd"/></b>
                    </li>
                </ul>
                <h2 class="title_h2">施工信息</h2>
                <ul>
                	<li>
                    	<span>施工项目组长：</span>
                        <b>${groupVo.groupLeaderName }</b>
                    </li>
                    <li>
                    	<span>施工项目组长电话：</span>
                        <b>${groupVo.groupLeaderPhone }</b>
                    </li>
                    <%-- <li>
                    	<span>实际施工工期：</span>
                        <b><fmt:formatDate value="${pack.startTime }" pattern="yyyy-MM-dd"/>至
                        	<fmt:formatDate value="${pack.endTime }" pattern="yyyy-MM-dd"/></b>
                    </li> --%>
                </ul>
                <h2 class="title_h2">签到／完工时间</h2>
                <ul>
                	<li>
                    	<span>签到时间：</span>
                        <b><fmt:formatDate value="${sginTime }" pattern="yyyy-MM-dd HH:mm:ss"/></b>
                    </li>
                    <li>
                    	<span>完工时间：</span>
                        <b><fmt:formatDate value="${pack.completeTime }" pattern="yyyy-MM-dd HH:mm:ss"/></b>
                    </li>
                </ul>
                <h2 class="title_h2">完工图片</h2>
                <ul class="task_img">
                	<c:forEach var="item" items="${imgList }">
                		<li><img src="${DOMAIN_NAME }${item.imageUrl}"></li>
                	</c:forEach>
                </ul>
            </div>
            <a class="ok" href="javascript:void(0);" onclick="okClick()">确认任务包合格完成</a>
        </div>
    </div>
</body>
</html>
