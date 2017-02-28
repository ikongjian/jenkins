<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.ikongjian.erp.enums.WorkerPackageStateEnum"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="en" uri="/enumTag"%>
<title>任务包分配</title>
<%@ include file="/WEB-INF/jsp/layout/cssjs.jsp"%>
<%@ include file="/WEB-INF/jsp/layout/menu.jsp"%>
<div class="content">
	<div class="title widht_84">
		<h2 class="color_fff">任务包分配</h2>
		<i><img class="width_100" src="/assets-new/img/nav_0.png"></i>
	</div>
	<hr class="content_hr">
	<table class="table_list" border="0" cellspacing="0" cellpadding="0">
		<tbody>
			<tr class="table_listTr">
				<th scope="col" width="21%">顾客</th>
				<th scope="col" width="16%">任务包</th>
				<th scope="col" width="9%">价格(元)</th>
				<th scope="col" width="13%">安排开始日期</th>
				<th scope="col" width="13%">安排结束日期</th>
				<th scope="col" width="16%">任务包状态</th>
				<th scope="col" width="17%">操作</th>
			</tr>
			<c:forEach var="orderPkg" items="${orderPkgs}">
				<tr>
					<td class="textL">
						<a class="td_none" href="/order/threePath/toOrderInfoPage?orderNo=${orderPkg.orderNo}">${orderPkg.customerInformation}</a>
					</td>
					<td class="textL">
						<a class="td_none" href="/package/threePath/packageInfo?packageId=${orderPkg.id}">${orderPkg.pkgName}</a>
					</td>
					<td><fmt:formatNumber value="${orderPkg.pkgMoney}" type="number"/></td>
					<td><fmt:formatDate value="${orderPkg.startDate}" pattern="yyyy-MM-dd"/></td>
					<td><fmt:formatDate value="${orderPkg.endDate}" pattern="yyyy-MM-dd"/></td>
					<c:choose>
						<c:when test="${orderPkg.state==10}">
							<td class="color007aff">
						</c:when>
						<c:when test="${orderPkg.state==15||orderPkg.state==50}">
							<td class="color0cb326">
						</c:when>
						<c:when test="${orderPkg.state==20||orderPkg.state==40||orderPkg.state==60}">
							<td class="colored6c00">
						</c:when>
						<c:otherwise>
							<td>
						</c:otherwise>
					</c:choose>
					<en:out enumClass="<%=WorkerPackageStateEnum.class%>" code="${orderPkg.state}" />
					</td>
					<td>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>
