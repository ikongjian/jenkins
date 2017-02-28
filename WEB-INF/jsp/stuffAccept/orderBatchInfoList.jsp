<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
<%@ include file="/WEB-INF/jsp/layout/cssjs.jsp"%>
    <style type="text/css">
        .td_red{ color:#ff0000;}
    </style>
<title>收货批次明细</title>
</head>

<body>
<div class="content">
    <div class="title">
       	<h2>收货批次明细</h2>
       	<a href="/stuffAccept/projectList"><img src="/assets-new/img/esc.png"></a>
    </div>
    <hr class="content_hr">
	    <div class="orderBaseInfo">
        	<ul>
                <li>
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
                </li>
                <li>
                    <span>收货单号：</span>${vbeln }
                </li>
                <li>
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
                </li>
                <li>
                    <span>期望送货日期：</span>${wadat }
                </li>
        	</ul>
        </div>
        <form action="" method="post" name="selectForm">
		<table class="table_list" border="0" cellspacing="0" cellpadding="0">
			<tr class="table_listTr">
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
		</table>
		</form>
</div>
<script>
    $(function() {
        $(".nav").css("left","-16%");
        $(".nav").removeClass("animate");
        $(".content,.title").css("width","100%");
    });
</script>
</body>
</html>
