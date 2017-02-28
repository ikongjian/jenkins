<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE >
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" name="viewport">
<meta content="no-cache" http-equiv="pragma">
<meta content="no-cache" http-equiv="cache-control">
<meta content="0" http-equiv="expires">
<title>签到列表</title>
</head>

<body>
    <!--3级页面框架-->
    <div class="right frame">
    	<!--头部-->
    	<header>
        	<h6>签到列表</h6>
        	<a href="/pmProject/projectList"><img src="/assets-new/img/esc.png"></a>
        </header>
        <div class="content">
        	<!--补货申请单列表-->
            <table class="table_1 table_2" width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr class="quote_tr">
                	<th scope="col" width="10%">序号</th>
                    <th scope="col" width="35%">顾客</th>
                    <th scope="col" width="35%">签到地址</th>
                    <th scope="col" width="20%">签到时间</th>
				</tr>
				<c:forEach var="item" items="${signList }" varStatus="status">
	                <tr>        
	                	<td>${status.index+1 }</td>
	                    <td>${order.community }${order.building }-${order.unit }-${order.room }-${order.userName }</td>
	                    <td>${item.address }</td>
	                    <td><fmt:formatDate value="${item.createTime }" pattern="yyyy-MM-dd"/></td>
	                </tr> 
                </c:forEach>
			</table>
        </div>
    </div>
</body>
</html>
