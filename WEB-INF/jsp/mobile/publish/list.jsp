<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page import="com.ikongjian.erp.enums.ErpContractOrderStatusEnum" %>
<%@taglib prefix="en" uri="/enumTag" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,minimum-scale=1.0,user-scalable=no">
<meta name="format-detection" content="telephone=no">
<meta name="apple-mobile-web-app-capable" content="yes">
<title>项目播报</title>
<link href="/assets-new/mobile/css/css.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/assets-new/js/jquery-1.8.3.min.js"></script>
    <style type="text/css">
        .list_an{
            position:relative;
        }
        small {
            position:absolute;
            right: -.9rem;
            top: -.9rem;
            display:block;
            background: #ed6c00;
            color: #fff;
            text-align: center;
            border-radius: 50%;
            width: 1.8rem;
            height: 1.8rem;
            line-height: 1.8rem;
        }
    </style>
</head>

<body>
	<!--头部-->
	<header>
    	项目播报
    </header>
    <!--播报列表-->
    <div class="list_broadcast">
    	<c:forEach items="${list }" var="item">
    		<table width="100%" border="0" cellspacing="0" cellpadding="0">
	            <tr>
	                <th>顾客</th>
	                <td>${item.community }-${item.building }-${item.unit }-${item.room }-${item.userName }</td>
	            </tr>
	            <tr>
	                <th>实际开工日期</th>
	                <td><fmt:formatDate value="${item.workingDate }" pattern="yyyy-MM-dd"/></td>
	            </tr>
	            <tr>
	                <th>合同工期</th>
	                <td>${item.workDays }</td>
	            </tr>
	            <tr>
	                <th>状态</th>
	                <td><en:out code="${item.orderStatesNo }" enumClass="<%=ErpContractOrderStatusEnum.class %>"/></td>
	            </tr>
	            <tr>
	                <th colspan="2">
                        <a class="list_an" href="/mobile/publish/toPublish?orderNo=${item.orderNo }">
                            播报
                            <c:if test="${item.workerNewImgNum>0}">
                                <small>
                                        ${item.workerNewImgNum}
                                </small>
                            </c:if>
                        </a>
                    </th>
	            </tr>
	        </table>
    	</c:forEach>
    </div>
</body>
</html>
