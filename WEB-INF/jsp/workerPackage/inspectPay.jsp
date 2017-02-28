<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.ikongjian.erp.enums.WorkerPackageStateEnum"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="en" uri="/enumTag"%>
<title>验收单付款</title>
<%@ include file="/WEB-INF/jsp/layout/cssjs.jsp"%>
<%@ include file="/WEB-INF/jsp/layout/menu.jsp"%>
<div class="content">
	<div class="title widht_84">
		<h2 class="color_fff">验收单付款</h2>
		<i><img class="width_100" src="/assets-new/img/nav_0.png"></i>
        <%--<a href="#"><img class="width_100" src="/assets-new/img/esc.png"></a>--%>
	</div>
	<hr class="content_hr">
	<table class="table_list" border="0" cellspacing="0" cellpadding="0">
		<tbody>
			<tr class="table_listTr">
				<th scope="col" width="12%">验收单号</th>
				<th scope="col" width="20%">顾客</th>
				<th scope="col" width="13%">任务包</th>
				<th scope="col" width="10%">组长</th>
				<th scope="col" width="10%">付款金额</th>
				<th scope="col" width="18%">任务包状态</th>
				<th scope="col" width="17%">操作</th>
			</tr>
			<c:forEach var="pay" items="${pays}">
				<tr>
					<td class="text_left">${pay.inspectNo}</td>
					<td>
						<a class="td_none" href="/order/threePath/toOrderInfoPage?orderNo=${pay.orderNo}">${pay.userName}</a>
					</td>
					<td>
						<a class="td_none" href="/package/threePath/packageInfo?packageId=${pay.pkgId}">${pay.pkgName}</a>
					</td>
					<td>${pay.workerLeaderName}</td>
					<td><fmt:formatNumber value="${pay.settleMoney}" type="number" pattern="0.00"/></td>
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
					<en:out enumClass="<%=WorkerPackageStateEnum.class%>" code="${pay.pkgStatus}" />
					</td>
					<td>
						<c:if test="${pay.payStatus==1 and pay.pkgStatus < 90}">
							<a href="/package/inspectPayDetail?inspectId=${pay.inspectId}&type=1" class="td_an">首款明细</a>
						</c:if>
						<c:if test="${pay.pkgStatus==90}">
							<a href="/package/inspectPayDetail?inspectId=${pay.inspectId}&type=1" class="td_an">首款明细</a>
						</c:if>
						<c:if test="${pay.pkgStatus==95}">
							<a href="/package/inspectPayDetail?inspectId=${pay.inspectId}&type=1" class="td_an">首款明细</a>
							<a href="/package/inspectPayDetail?inspectId=${pay.inspectId}&type=2" class="td_an">尾款明细</a>
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
