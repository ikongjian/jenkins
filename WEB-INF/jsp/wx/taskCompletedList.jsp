<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@page import="com.ikongjian.erp.enums.ErpContractOrderStatusEnum"%>
<%@page import="com.ikongjian.erp.enums.WorkerPackageStateEnum"%>
<%@ taglib prefix="en" uri="/enumTag"%>
<!DOCTYPE >
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" name="viewport">
<meta content="no-cache" http-equiv="pragma">
<meta content="no-cache" http-equiv="cache-control">
<meta content="0" http-equiv="expires">
<meta name="format-detection" content="telephone=no" />
<link rel="stylesheet" type="text/css" href="/assets-new/wx/css/css.css">
<script type="text/javascript" src="/assets-new/wx/js/jquery-1.8.3.min.js"></script>
<title>已完工任务</title>
</head>

<body>
	<!--已完工任务-->
    <div class="grab ok_task">
    	<div class="grab_head">
        	<div class="grab_icon"><img src="/assets-new/wx/img/icon.png"></div>
            <div class="grab_name">${memberInfo.name}<br><span>${memberInfo.category}</span></div>
        </div>
        <!--已完工任务-->
        <div class="grab_task">
        	<c:forEach var="item" items="${paList}">
	        	<!--任务-->
	        	<div class="grab_task1">
	            	<h2>任务：${item.pkgName}<a href="/wx/taskInfo?packageId=${item.id}">查看详情></a></h2>
	                <div class="grab_task_text">
                        <c:if test="${item.dispatType==1}">
                            <p><span>价钱：</span><b>${item.pkgMoney}元</b></p>
                        </c:if>
	                    <p><span>工期：</span><b><fmt:formatDate value="${item.startDate}"/>至<fmt:formatDate value="${item.endDate}"/></b></p>
	                    <p><span>地点：</span><b>${item.fullName}-${item.community}-${item.building}-${item.unit}-${item.room}-${item.userName}</b></p>
	                	<p><span>项目经理：</span><b class="b_name">${item.projectManageName}</b><a href="tel:${item.projectManageTelephone}">联系TA</a></p>
	                </div>
                    <c:if test="${item.dispatType==1}">
                        <div class="ok_task_state">
                            <span class="ok_state">
                                项目状态：<en:out enumClass="<%=ErpContractOrderStatusEnum.class%>" code="${item.orderState}"/>&nbsp;&nbsp;&nbsp;&nbsp;
                                竣工日期：<fmt:formatDate value="${item.projectCheckDate}"/><br/>
                                <c:choose>
                                    <c:when test="${item.state==90}">
                                        已付首款：${item.fMoney}元&nbsp;&nbsp;&nbsp;&nbsp;未付尾款：${item.nEMoney}元
                                    </c:when>
                                    <c:when test="${item.state==95}">
                                        已付首款：${item.fMoney}元&nbsp;&nbsp;&nbsp;&nbsp;已付尾款：${item.eMoney}元
                                    </c:when>
                                    <c:otherwise>
                                        任务包状态：<en:out enumClass="<%=WorkerPackageStateEnum.class%>" code="${item.state}"/>
                                    </c:otherwise>
                                </c:choose>
                            </span>
                            <c:if test="${item.state==70&&item.workerState!=1}">
                                <a href="/wx/proMoneyUI?pkgId=${item.id}">去确认薪酬</a>
                            </c:if>
                            <c:if test="${item.state==73}">
                                <a href="/wx/proMoneyUI?pkgId=${item.id}">去查看薪酬</a>
                            </c:if>
                        </div>
                    </c:if>
                    <c:if test="${item.dispatType==2}">
                        <div class="ok_task_state">
                            <span class="ok_state">
                                任务包状态：<en:out enumClass="<%=WorkerPackageStateEnum.class%>" code="${item.state}"/>
                            </span>
                        </div>
                    </c:if>
	            </div>
            </c:forEach>
        </div>
    </div>
</body>
</html>
