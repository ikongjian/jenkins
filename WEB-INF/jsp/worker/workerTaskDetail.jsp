<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0" />
<title>任务详情</title>
<link href="/assets-new/css/workerDetail.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/assets/js/jquery-1.11.3.min.js"></script>
</head>
<body>
	<header>
		<i class="icon"><img src="/assets-new/img/nan.png"></i>
		<h1>
			${memberInfo.name }<span>${memberInfo.orgLevelCode }${memberInfo.category }</span>
		</h1>
	</header>
	<!--任务详情-->
	<div class="d_task">
		<h6>
			<span>小区名称</span>${address}
		</h6>
		<h6>
			<span>客户姓名</span>${customerName}
		</h6>
		<div class="j_address">
			<h3>施工地点</h3>
			<p>${address} - ${customerName}</p>
		</div>
		<c:if test="${!empty settle}">
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<th scope="row">施工项</th>
				<td>${process.processName }</td>
			</tr>
			<tr>
				<th scope="row">工期要求</th>
				<td>${dateStart }至${dateEnd }</td>
			</tr>
			<tr>
				<th scope="row">单价</th>
				<td>${settle.prePayMoney }元／${settle.processUnit }</td>
			</tr>
			<tr>
				<th scope="row">工程量</th>
				<td>${settle.processNumber }${settle.processUnit }</td>
			</tr>
			<tr>
				<td class="d_taskrmb" colspan="2" scope="row">预计收入：<span id="sum"></span>元
				</td>
			</tr>
		</table>
		<script type="text/javascript">
			var prePayMoney = parseInt(${settle.prePayMoney});
			var processNumber = parseInt(${settle.processNumber});
			$("#sum").html(prePayMoney*processNumber);
		</script>
		</c:if>
		<c:if test="${!empty settleMap}">
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<th scope="row">施工项</th>
				<td>${process.processName }</td>
			</tr>
			<tr>
				<th scope="row">工期要求</th>
				<td>${dateStart }至${dateEnd }</td>
			</tr>
			<%-- <tr>
				<th scope="row">单价</th>
				<td>${settleMap.kmpmg }元／${settleMap.meins }</td>
			</tr> --%>
			<tr>
				<th scope="row">工程量</th>
				<td>${settleMap.kmpmg }${settleMap.meins }</td>
			</tr>
			<%-- <tr>
				<td class="d_taskrmb" colspan="2" scope="row">预计收入：<span>${settleMap.prePayMoney }*${settleMap.kmpmg }</span>元
				</td>
			</tr> --%>
		</table>
		</c:if>
	</div>
</body>
</html>