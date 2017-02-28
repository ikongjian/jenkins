<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.ikongjian.erp.enums.ErpContractOrderStatusEnum" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="en" uri="/enumTag" %>
<!DOCTYPE >
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" name="viewport">
<meta content="no-cache" http-equiv="pragma">
<meta content="no-cache" http-equiv="cache-control">
<meta content="0" http-equiv="expires">
<title>补货申请</title>
</head>

<body>
<!--右侧头部-->
<header>
   	<h6>补货申请</h6>
   	<!--<a href="#"><img src="/assets-new/img/esc.png"></a>-->
   	<input type="hidden" name="navClass" id="navClass" value="nav_a5"/>
   </header>
   <!--右侧内容-->
<div class="content">
	<!--补货申请-->
    <table class="table_1" width="100%" border="0" cellspacing="0" cellpadding="0">
       <tr class="quote_tr">
	       <th scope="col" width="35%">顾客</th>
	       <th scope="col" width="25%">合同开工时间</th>
	       <th scope="col" width="25%">状态</th>
	       <th scope="col" width="15%">操作</th>
	   </tr>
	   <c:forEach var="working" items="${workingList}">
	       <tr>        
            	<td>
            		<a class="href" href="/order/threePath/toOrderInfoPage?orderNo=${working.orderNo }">
            			${working.community }${working.building }-${working.unit }-${working.room }-${working.userName }
            		</a>
            	</td>
                <td><fmt:formatDate value="${working.workingDate }" pattern="yyyy-MM-dd"/></td>
                <td><en:out code="${working.orderStatesNo }" enumClass="<%=ErpContractOrderStatusEnum.class %>"/></td>
                <td>
	                <a href="/applyGoods/threePath/toApplyBill?orderNo=${working.orderNo }&werks=${working.werks}&cache=del">补货申请</a>
	                <a href="/applyGoods/threePath/toApplyGoodsRecordList?orderNo=${working.orderNo }&werks=${working.werks}">补货记录</a>
                </td>        
	       </tr>
       </c:forEach>
	</table>     	
</div>
</body>
</html>
