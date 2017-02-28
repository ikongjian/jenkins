<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.ikongjian.erp.enums.ErpContractOrderStatusEnum" %>
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
<title>项目任务</title>
</head>

<body>
   	<!--右侧头部-->
   	<header>
       	<h6>项目任务</h6>
       	<input type="hidden" name="navClass" id="navClass" value="nav_a7">
    </header>
    <!--右侧内容-->
    <div class="content">
       	<!--项目任务-->
        <table class="table_1" width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr class="quote_tr">
               	<th scope="col" width="35%">顾客</th>
                   <th scope="col" width="20%">实际开工日期</th>
                   <th scope="col" width="12%">合同工期</th>
                   <th scope="col" width="18%">项目状态</th>
                   <th scope="col" width="15%">操作</th>
			</tr>
			<c:forEach var="item" items="${list }">
				<tr>        
	               	<td>
	               		<a class="href" href="/order/threePath/toOrderInfoPage?orderNo=${item.orderNo}">
	            			${item.community }-${item.building }-${item.unit }-${item.room }-${item.userName }
	            		</a>
	               	</td>
                    <td><fmt:formatDate value="${item.workingDate }" pattern="yyyy-MM-dd"/></td>
                    <td>${item.workDays }<c:if test="${item.workDays !=null}">天</c:if></td>
                    <td><en:out enumClass="<%=ErpContractOrderStatusEnum.class%>" code="${item.orderStatesNo }"></en:out></td>
                    <td><a href="/package/threePath/toPackageList?orderNo=${item.orderNo }">管理任务包</a></td>      
	            </tr>
			</c:forEach>
		</table>     	
   </div>
</body>
</html>
