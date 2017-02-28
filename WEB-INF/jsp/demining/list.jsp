<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="/pageTag" prefix="page"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE >
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" name="viewport">
<meta content="no-cache" http-equiv="pragma">
<meta content="no-cache" http-equiv="cache-control">
<meta content="0" http-equiv="expires">
<title>排雷列表</title>
<link rel="stylesheet" type="text/css" href="<%=basePath %>assets-new/css/css.css">
<script src="<%=basePath %>assets-new/js/jquery-1.8.3.min.js"></script>
<script src="<%=basePath %>assets-new/js/jiajian.js"></script>
</head>

<body>
    <!--右侧-->
    
    	<!--右侧头部-->
    	<header>
        	<h6>排雷列表</h6>
        	<input type="hidden" name="navClass" id="navClass" value="nav_a1"/>
        </header>
        <!--右侧内容-->
        <div class="content">
        	<!--排雷列表-->
        	<form action="/demining/list" method="get">
        	<input hidden="true" name="isQuery" value="1">
        	<div class="time_cx time_cx1">
            	<p><span>设计师：</span><input type="text" name="designer" value="${query.designer}"/></p>
                <p><span>客户姓名：</span><input type="text" name="custom" value="${query.custom}"/></p>
                <p class="time_p50"><span>排雷日期：</span><input type="date" name="start" value="${query.start }" />至
                <input type="date" name="end" value="${query.end}"/></p>
                <p class="time_p15"><input type="submit" value="查询"></p>
            </div>
           </form>
            <table class="table_1" width="100%" border="0" cellspacing="0" cellpadding="0">
                 <tr class="quote_tr">
                	<th scope="col" width="35%">顾客</th>
                    <th scope="col" width="20%">设计师</th>
                    <th scope="col" width="20%">排雷日期</th>
                    <th scope="col" width="10%">状态</th>
                    <th scope="col" width="15%">操作</th>
				</tr>
                <c:forEach var="item" items="${deminingOrders}" varStatus="status">
                   <tr>        
                	<td>${item.community}-${item.building}-${item.unit}-${item.room}-${item.userName}</td>
                    <td>${item.designer}</td>
                    <td><fmt:formatDate value="${item.paileiDate}" pattern="yyyy-MM-dd"/></td>
                    <c:choose>
                    <c:when test="${item.orderStates == 10 }">
                      <td>待付定金</td>
                    </c:when>
                    <c:when test="${item.orderStates == 20 }">
                      <td>待约合开工日期</td>
                    </c:when>
                    <c:when test="${item.orderStates == 40 }">
                      <td>待派单</td>
                    </c:when>
                    <c:when test="${item.orderStates == 50 }">
                      <td>待约合排雷日期</td>
                    </c:when>
                    <c:when test="${item.orderStates == 51 }">
                      <td>待分配排雷工人</td>
                    </c:when>
                    <c:when test="${item.orderStates == 52 }">
                      <td>待排雷反馈</td>
                    </c:when>
                     <c:when test="${item.orderStates == 60 }">
                      <td>待设计报价状态</td>
                    </c:when>
                    <c:when test="${item.orderStates == 90 }">
                      <td>待审核报价状态</td>
                    </c:when>
                    <c:when test="${item.orderStates == 91 }">
                      <td>待复核报价状态</td>
                    </c:when>
                    <c:when test="${item.orderStates == 150 }">
                      <td>待签约</td>
                    </c:when>
                    <c:when test="${item.orderStates == 155 }">
                      <td>待审核合同</td>
                    </c:when>
                    <c:when test="${item.orderStates == 160 }">
                      <td>已签约</td>
                    </c:when>
                    <c:when test="${item.orderStates == 170 }">
                      <td>施工中</td>
                    </c:when>
                    <c:when test="${item.orderStates == 200 }">
                      <td>已竣工</td>
                    </c:when>
                    <c:when test="${item.orderStates == 400 }">
                      <td>已退款</td>
                    </c:when>
                    <c:otherwise>
                      <td>未知状态</td>
                    </c:otherwise>
                    </c:choose>
                    <td><a href="/demining/threePath/detail?orderNo=${item.orderNo }">排雷详情</a></td>        
                   </tr>
                </c:forEach>
			</table>     	
        </div>
    
</body>
</html>

