<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="/pageTag" prefix="page"%>
<!DOCTYPE >
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta
	content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no"
	name="viewport">
<meta content="no-cache" http-equiv="pragma">
<meta content="no-cache" http-equiv="cache-control">
<meta content="0" http-equiv="expires">
<title>收货批次明细</title>
</head>

<body>
<!--3级页面框架-->
<div class="right frame">
    <!--右侧头部-->
   	<header>
       	<h6>收货批次明细</h6>
       	<a href="/stuffAccept/projectList"><img src="/assets-new/img/esc.png"></a>
    </header>
	<div class="content">
	    <div class="detailed">
        	<p>
        		<span>发货日程：</span>
        		<c:if test="${batchId == '10' }">
	        	   	 主材第一次发货
	        	</c:if>
	        	<c:if test="${batchId == '20' }">
	        		 主材第二次发货
	        	</c:if>
	        	<c:if test="${batchId == '30' }">
	        		辅料第一次发货
	        	</c:if>
	        	<c:if test="${batchId == '40' }">
	        		辅料第二次发货
	        	</c:if>
	        	<c:if test="${batchId == '50' }">
	        		木作第一次发货
	        	</c:if>
	        	<c:if test="${batchId == '51' }">
	        		木作第二次发货
	        	</c:if>
        	</p>
            <p><span>收货单号：</span>${vbeln }</p>
            <p>
            	<span>状态：</span>
            	<c:if test="${status=='0'}">审核</c:if>
				<c:if test="${status=='1'}">下达</c:if>
				<c:if test="${status=='2'}">拣配</c:if>
				<c:if test="${status=='3'}">已出库</c:if>
				<c:if test="${status=='4'}">已验收</c:if>
				<c:if test="${status=='5'}">结算中</c:if>
				<c:if test="${status=='6'}">已结算</c:if>
				<c:if test="${status=='7'}">已付款</c:if>
				<c:if test="${status=='8'}">删除</c:if>
            </p>
            <p><span>期望送货日期：</span>${wadat }</p>
        </div>
        <form action="" method="post" name="selectForm">
        <%-- <input type="hidden" id="pageSize" name="pageSize" value="${pageSize}"/> --%>
		<!--复核报价单-->
		<table class="table_1 table_2" width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr class="quote_tr">
				<th scope="col" width="15%">商品编号</th>
                <th scope="col" width="55%">商品名称</th>
                <th scope="col" width="10">可收数量</th>
                <th scope="col" width="10%">实收数量</th>
                <th scope="col" width="10%">单位</th>
			</tr>
			<c:forEach var="item" items="${list}">
				<tr>
					<td>${item.matnr }</td>
					<td class="td_name">${item.maktg }</td>
			
					<td <c:if test="${item.lfimg != item.kmpmg }">class="td_red"</c:if>>
					   <c:if test="${not empty item.kmpmg}">${item.kmpmg }</c:if>
					   <c:if test="${empty item.kmpmg}">${item.lfimg }</c:if>
					</td>
					 <td>${item.fmeng }</td>
					<td>${item.meins }</td>
				</tr>
			</c:forEach>
			<%-- <tr>
				<td><page:out page="${page.result}" queryCondition="${queryCondition}" /></td>
			</tr> --%>
		</table>
		</form>
	</div>
</div>
</body>
</html>
