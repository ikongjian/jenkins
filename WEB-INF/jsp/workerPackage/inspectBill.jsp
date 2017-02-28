<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.ikongjian.erp.enums.WorkerPackageStateEnum"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="en" uri="/enumTag"%>
<title>验收单管理</title>
<%@ include file="/WEB-INF/jsp/layout/cssjs.jsp"%>
<%@ include file="/WEB-INF/jsp/layout/menu.jsp"%>
<div class="content">
	<div class="title widht_84">
		<h2 class="color_fff">验收单管理</h2>
		<i><img class="width_100" src="/assets-new/img/nav_0.png"></i>
        <%--<a href="#"><img class="width_100" src="/assets-new/img/esc.png"></a>--%>
	</div>
	<hr class="content_hr">
	<table class="table_list" border="0" cellspacing="0" cellpadding="0">
		<tbody>
			<tr class="table_listTr">
				<th scope="col" width="10%">验收单号</th>
				<th scope="col" width="12%">验收日期</th>
				<th scope="col" width="20%">顾客</th>
				<th scope="col" width="13%">任务包</th>
				<th scope="col" width="10%">结算金额</th>
				<th scope="col" width="18%">任务包状态</th>
				<th scope="col" width="17%">操作</th>
			</tr>
			<c:forEach var="inspect" items="${inspects}">
				<tr>
					<td class="text_left">${inspect.inspectNo}</td>
					<td>
						<fmt:formatDate value="${inspect.inspectDate}" pattern="yyyy-MM-dd"/>
					</td>
					<td class="textL">
						<a class="td_none" href="/order/threePath/toOrderInfoPage?orderNo=${inspect.orderNo}">${inspect.userName}</a>
					</td>
					<td class="textL">
						<a class="td_none" href="/package/threePath/packageInfo?packageId=${inspect.pkgId}">${inspect.pkgName}</a>
					</td>
					<td><fmt:formatNumber value="${inspect.settleMoney}" type="number" pattern="0.00"/></td>
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
					<en:out enumClass="<%=WorkerPackageStateEnum.class%>" code="${inspect.pkgStatus}" />
					</td>
					<td>
						<c:if test="${inspect.pkgStatus==73||inspect.pkgStatus==80}">
							<a href="/package/eInspectUI?pkgId=${inspect.pkgId}&orderNo=${inspect.orderNo}&inspectId=${inspect.id}" class="td_an">修改验收单</a>
						</c:if>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>
<script type="text/javascript">
	$(function() {
		//隐藏返回按钮
		$(".title a").hide()
	})
</script>
