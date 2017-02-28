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
<title>项目播报</title>
</head>

<body>
	<!--右侧头部-->
	<header>
    	<h6>项目播报</h6>
    	<input type="hidden" name="navClass" id="navClass" value="nav_a9"/>
    </header>
    <!--右侧内容-->
    <div class="content">
    	<!--我的项目列表-->
         <table class="table_1" width="100%" border="0" cellspacing="0" cellpadding="0">
             <tr class="quote_tr">
             	 <th scope="col" width="28%">顾客</th>
                 <th scope="col" width="15%">面积</th>
                 <th scope="col" width="15%">实际开工日期</th>
                 <th scope="col" width="15%">合同工期</th>
                 <th scope="col" width="12%">状态</th>
                 <th scope="col" width="15%">操作</th>
			</tr>
			<c:forEach items="${list }" var="item">
              <tr>        
             	 <td>
             		<a class="href" href="/order/threePath/toOrderInfoPage?orderNo=${item.orderNo }">
            			${item.community }-${item.building }-${item.unit }-${item.room }-${item.userName }
            		</a>
             	 </td>
                 <td>${item.area }</td>
                 <td><fmt:formatDate value="${item.workingDate }" pattern="yyyy-MM-dd"/></td>
                 <td>${item.workDays }</td>
                 <td><en:out code="${item.orderStatesNo }" enumClass="<%=ErpContractOrderStatusEnum.class %>"/></td>
                 <td>
                 	<a href="/publish/threePath/toPublish?orderNo=${item.orderNo }">播报</a>
                 	<a href="/publish/threePath/toPublishList?orderNo=${item.orderNo }">播报列表</a>
                 </td>
              </tr>
             </c:forEach>
		</table>     	
     </div>
</body>
</html>
