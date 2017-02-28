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
<link rel="stylesheet" type="text/css" href="/assets-new/css/css.css?version=${version}">
<script type="text/javascript" src="/assets-new/js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="/assets-new/layer-v2.0/layer/layer.js"></script>
<title>任务包详情</title>
	<script type="text/javascript">
		$(function() {
			$(".task_img img").click(function() {
                layer.open({
                    type:1,
                    area:["905px","580px"],
                    shade:0.3,
                    title:false,
                    shadeClose:false,
                    scrollbar:false,
                    content:"<img src='"+$(this).attr("osrc")+"?arg="+new Date().valueOf()+"'>"
                });
            });
		});
	</script>
</head>
<body>
    <!--3级页面框架-->
    <div class="right frame">
    	<!--头部-->
    	<header>
        	<h6>任务包详情</h6>
        	<a href="javascript:void(0);" onclick="window.history.back();"><img src="/assets-new/img/esc.png"></a>
        </header>
        <div class="content">
        	<!--任务包详情-->
            <div class="order task">
            	<h2 class="title_h2">基本信息</h2>
                <ul>
                	<li>
                    	<span>任务包名称：</span>
                        <b>${pack.pkgName}</b>
                    </li>
                    <li>
                    	<span>状态：</span>
                        <b><en:out code="${pack.state }" enumClass="<%=WorkerPackageStateEnum.class %>"/></b>
                    </li>
                    <li>
                    	<span>建议工作量：</span>
                        <b>
                        	<%-- <c:if test="${pack.packageWorkerCount == null or pack.packageDay}"></c:if>
                        	${pack.packageWorkerCount }人${pack.packageDay }天 --%>
                        </b>
                    </li>
                    <li>
                    	<span>价格：</span>
                        <b>
                        	<c:if test="${!empty inspect.id}">
                        		<fmt:formatNumber value="${inspect.settleMoney}" type="number"/>元
                        	</c:if>
                        	<c:if test="${empty inspect.id}">
                        		<fmt:formatNumber value="${pack.pkgMoney}" type="number"/>元
                        	</c:if>
                        </b>
                    </li>
                </ul>
                <h2 class="title_h2">安排施工</h2>
                <ul class="order_ul_li100">
                	<li>
                    	<span>安排施工工期：</span>
                        <b> <fmt:formatDate value="${pack.startDate }" pattern="yyyy-MM-dd"/>至
                        	<fmt:formatDate value="${pack.endDate }" pattern="yyyy-MM-dd"/></b>
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
                        <b>
                        	<fmt:formatDate value="${pack.startTime }" pattern="yyyy-MM-dd"/>至
                        	<fmt:formatDate value="${pack.endTime }" pattern="yyyy-MM-dd"/>
                        </b>
                    </li> --%>
                </ul>
                <%-- <ul class="order_ul_li100 order_ul_li_span">
                	<c:forEach var="item" items="${voList }" varStatus="status">
                		<li>${status.index+1 }、${item.productName }，${item.price }元/${item.unit } * ${item.num }= ${item.totalPrice }元</li>
                	</c:forEach>
                </ul> --%>
                <c:choose>
                	<c:when test="${!empty procedures}">
                		<h2 class="title_h2">工序和价格</h2>
		                <table class="table_4" width="100%" border="0" cellspacing="0" cellpadding="0">
		                	<c:forEach var="item" items="${procedures}" varStatus="status">
			                    <tr>
			                        <th colspan="2" scope="col">${status.index+1 }、${item.skuName }</th>
			                    </tr>
			                    <tr>
			                        <td class="table_4td" width="15%">价格</td>
			                        <td width="85%">${item.price }元/${item.unit } * ${item.actualNum }= ${item.totalPrice }元</td>
			                    </tr>
			                    <tr>
			                        <td class="table_4td">工序内容</td>
			                        <td>${item.note }</td>
			                    </tr>
		                    </c:forEach>
		                </table>
                	</c:when>
                	<c:otherwise>
                		<h2 class="title_h2">工序和价格</h2>
		                <table class="table_4" width="100%" border="0" cellspacing="0" cellpadding="0">
		                	<c:forEach var="item" items="${voList }" varStatus="status">
			                    <tr>
			                        <th colspan="2" scope="col">${status.index+1 }、${item.skuName }</th>
			                    </tr>
			                    <tr>
			                        <td class="table_4td" width="15%">价格</td>
			                        <td width="85%">${item.price }元/${item.unit } * ${item.actualNum }= ${item.totalPrice }元</td>
			                    </tr>
			                    <tr>
			                        <td class="table_4td">工序内容</td>
			                        <td>${item.note }</td>
			                    </tr>
		                    </c:forEach>
		                </table>
                	</c:otherwise>
                </c:choose>
                <c:if test="${not empty sginTime  }">
	                <h2 class="title_h2">签到／完工时间</h2>
	                <ul>
	                	<li>
	                    	<span>签到时间：</span>
	                        <b><fmt:formatDate value="${sginTime }" pattern="yyyy-MM-dd HH:mm:ss"/></b>
	                    </li>
	                    <li>
	                    	<span>完工时间：</span>
	                        <b><fmt:formatDate value="${pack.completeDate }" pattern="yyyy-MM-dd HH:mm:ss"/></b>
	                    </li>
	                </ul>
                </c:if>
                <c:if test="${not empty imgList1 and imgList1.size()>0 }">
	                <h2 class="title_h2">施工图片</h2>
	                <ul class="task_img">
	                	<c:forEach var="item" items="${imgList1 }">
	                		<li><img src="${DOMAIN_NAME }${item.imgUrl}"></li>
	                	</c:forEach>
	                </ul>
                </c:if>
                <c:if test="${not empty imgList2 and imgList2.size()>0 }">
	                <h2 class="title_h2">项目图纸</h2>
	                <ul class="task_img">
	                	<c:forEach var="item" items="${imgList2 }">
	                		<li><img src="${DOMAIN_NAME }${item.breviaryImgUrl}" osrc="${DOMAIN_NAME }${item.imgUrl}"></li>
	                	</c:forEach>
	                </ul>
                </c:if>
            </div>
        </div>
    </div>
</body>
</html>
