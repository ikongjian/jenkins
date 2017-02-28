<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
	<meta content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" name="viewport">
	<title>收货</title>
</head>
<body>
	<!--右侧头部-->
   	<header>
       	<h6>发货申请列表</h6>
       	<!--<a href="#"><img src="/assets-new/img/esc.png"></a>-->
       	<input type="hidden" id="navClass" name="navClass" value="nav_a4"/>
    </header>
	<div class="content">
		<h1 class="alert_2jym">如果【主材第一次、主材第二次】看不到，请联系【工程部调度】进行材料审核</h1>
		<!-- 待收货确认 -->
		<table class="table_1" width="100%" border="0" cellspacing="0"
			cellpadding="0">
			<tr class="quote_tr">
				<th scope="col" width="30%">顾客</th>
				<th scope="col" width="15%">发货日程</th>
				<th scope="col" width="15%">申请到货日期</th>
				<th scope="col" width="15%">状态</th>
				<th scope="col" width="25%">操作</th>
			</tr>
			<c:forEach var="item" items="${list}">
				<tr>
					<td>
						<a class="href" href="/order/threePath/toOrderInfoPage?orderNo=${item.ternr}">
							${item.community}${item.building}-${item.unit}-${item.room}-${item.customName}
						</a>
					</td>
					<td>
						<c:if test="${item.bdart=='10'}">主材第一次</c:if>
						<c:if test="${item.bdart=='20'}">主材第二次</c:if>
						<c:if test="${item.bdart=='30'}">辅料第一次</c:if>
						<c:if test="${item.bdart=='40'}">辅料第二次</c:if>
						<c:if test="${item.bdart=='50'}">木作第一次</c:if>
					</td>
					<td><fmt:formatDate value="${item.wadat}" pattern="yyyy-MM-dd"/></td>
					<td>
						<c:if test="${item.speQiStatus=='0'}">审核</c:if>
						<c:if test="${item.speQiStatus=='1'}">下达</c:if>
						<c:if test="${item.speQiStatus=='2'}">拣配</c:if>
						<c:if test="${item.speQiStatus=='3'}">已出库</c:if>
						<c:if test="${item.speQiStatus=='4'}">已验收</c:if>
						<c:if test="${item.speQiStatus=='5'}">结算中</c:if>
						<c:if test="${item.speQiStatus=='6'}">已结算</c:if>
						<c:if test="${item.speQiStatus=='7'}">已付款</c:if>
						<c:if test="${item.speQiStatus=='8'}">删除</c:if>
					</td>
					<td>
						<c:if test="${item.bdart=='10'}">
							<c:choose>
								<c:when test="${fn:substring(item.vlstk,0,1)=='0'}">
									<a href="/stuffAccept/threePath/detailList?projectId=${item.ternr}&batchId=${item.bdart}&vbeln=${item.vbeln}&status=${item.speQiStatus}">详情</a>
									<a href="/stuffAccept/threePath/toModifySendTime?projectId=${item.ternr}&batchId=${item.bdart}&areaCode=${item.areaCode}">申请</a>
								</c:when>
								<c:otherwise>
									<a href="/stuffAccept/threePath/detailList?projectId=${item.ternr}&batchId=${item.bdart}&vbeln=${item.vbeln}&status=${item.speQiStatus}&wadat=<fmt:formatDate value="${item.wadat}" pattern="yyyy-MM-dd"/>">详情</a>
								</c:otherwise>
							</c:choose>
						</c:if>
						<c:if test="${item.bdart=='20'}">
							<c:choose>
								<c:when test="${fn:substring(item.vlstk,1,2)=='0'}">
									<a href="/stuffAccept/threePath/detailList?projectId=${item.ternr}&batchId=${item.bdart}&vbeln=${item.vbeln}&status=${item.speQiStatus}">详情</a>
									<a href="/stuffAccept/threePath/toModifySendTime?projectId=${item.ternr}&batchId=${item.bdart}&areaCode=${item.areaCode}">申请</a>
								</c:when>
								<c:otherwise>
									<a href="/stuffAccept/threePath/detailList?projectId=${item.ternr}&batchId=${item.bdart}&vbeln=${item.vbeln}&status=${item.speQiStatus}&wadat=<fmt:formatDate value="${item.wadat}" pattern="yyyy-MM-dd"/>">详情</a>
								</c:otherwise>
							</c:choose>
						</c:if>
						<c:if test="${item.bdart=='30'||item.bdart=='40'}">
							<c:choose>
								<c:when test="${fn:substring(item.vlstk,2,3)=='0'}">
									<a href="/stuffAccept/threePath/detailList?projectId=${item.ternr}&batchId=${item.bdart}&vbeln=${item.vbeln}&status=${item.speQiStatus}">详情</a>
									<a href="/stuffAccept/threePath/toModifySendTime?projectId=${item.ternr}&batchId=${item.bdart}&areaCode=${item.areaCode}">申请</a>
								</c:when>
								<c:otherwise>
									<a href="/stuffAccept/threePath/detailList?projectId=${item.ternr}&batchId=${item.bdart}&vbeln=${item.vbeln}&status=${item.speQiStatus}&wadat=<fmt:formatDate value="${item.wadat}" pattern="yyyy-MM-dd"/>">详情</a>
								</c:otherwise>
							</c:choose>
						</c:if>
						<c:if test="${item.bdart=='50'}">
							<c:choose>
								<c:when test="${fn:substring(item.vlstk,3,fn:length(item.vlstk))=='0'}">
									<a href="/stuffAccept/threePath/detailList?projectId=${item.ternr}&batchId=${item.bdart}&vbeln=${item.vbeln}&status=${item.speQiStatus}">详情</a>
									<a href="/stuffAccept/threePath/toModifySendTime?projectId=${item.ternr}&batchId=${item.bdart}&areaCode=${item.areaCode}">申请</a>
								</c:when>
								<c:otherwise>
									<a href="/stuffAccept/threePath/detailList?projectId=${item.ternr}&batchId=${item.bdart}&vbeln=${item.vbeln}&status=${item.speQiStatus}&wadat=<fmt:formatDate value="${item.wadat}" pattern="yyyy-MM-dd"/>">详情</a>
								</c:otherwise>
							</c:choose>
						</c:if>
					</td>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>
