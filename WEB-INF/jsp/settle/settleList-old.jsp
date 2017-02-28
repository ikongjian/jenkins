<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.ikongjian.erp.enums.PMSettleStateEnum" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="en" uri="/enumTag"%>
<!DOCTYPE >
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" name="viewport">
<meta content="no-cache" http-equiv="pragma">
<meta content="no-cache" http-equiv="cache-control">
<meta content="0" http-equiv="expires">
<title>结算列表</title>
</head>

<body>
	<!--右侧头部-->
	<header>
    	<h6>结算列表</h6>
    	<input type="hidden" id="navClass" name="navClass" value="nav_a11">
    </header>
    <!--右侧内容-->
    <div class="content">
    	<!--我的项目列表-->
         <table class="table_1" width="100%" border="0" cellspacing="0" cellpadding="0">
             <tr class="quote_tr">
             	<th scope="col" width="25%">顾客</th>
                 <th scope="col" width="15%">实际开工日期</th>
                 <th scope="col" width="15%">实际竣工日期</th>
                 <th scope="col" width="14%">实际结算金额</th>
                 <th scope="col" width="16%">状态</th>
                 <th scope="col" width="15%">操作</th>
			 </tr>
			 <c:forEach var="item" items="${settleList }">
				<tr>        
	             	<td>
	             		<a class="href" href="/order/threePath/toOrderInfoPage?orderNo=${item.orderNo}">
							${item.community }-${item.building }-${item.unit }-${item.room }-${item.customName }
						</a>
	             	</td>
	                 <td><fmt:formatDate value="${item.workingDate }" pattern="yyyy-MM-dd"/></td>
	                 <td><fmt:formatDate value="${item.projectCheckDate }" pattern="yyyy-MM-dd"/></td>
	                 <td>
	                 	<c:if test="${!empty item.totalMoney }">
	                 		<fmt:formatNumber value="${item.totalMoney }" pattern="00.00"/>
	                 	</c:if>
	                 </td>
	                 <td>
	                 	<en:out enumClass="<%=PMSettleStateEnum.class%>" code="${item.state }"></en:out>
	                 </td>
	                 <td>
	                 	<c:if test="${item.state == 30 }">
							<a href="/settle/threePath/toDispaterCard?orderNo=${item.orderNo }&settleNo=${item.settleNo}&flag=first">分配打款明细</a>
	                 	</c:if>
	                 	<c:if test="${item.state == 40 }">
							<a href="/settle/threePath/toDispaterCard?orderNo=${item.orderNo }&settleNo=${item.settleNo}&flag=first">修改打款明细</a>
	                 	</c:if>
	                 	<c:if test="${item.state >= 50 }">
							<a href="/settle/threePath/toDispaterCard?orderNo=${item.orderNo }&settleNo=${item.settleNo}&flag=show">查看打款明细</a>
	                 	</c:if>
	                     <a href="/settle/threePath/settleDetail?settleNo=${item.settleNo}">查看结算单</a>
	                     <a href="/workComplete/threePath/toWorkCompleteInfo?orderNo=${item.orderNo }">查看进程</a>
	                 </td>        
	             </tr>
			 </c:forEach>
		</table>     	
     </div>
</body>
</html>
