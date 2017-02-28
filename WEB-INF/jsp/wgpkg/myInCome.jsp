<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" name="viewport">
    <meta name="format-detection" content="telephone=no"/>
    <meta content="no-cache" http-equiv="pragma">
    <meta content="no-cache" http-equiv="cache-control">
    <meta content="0" http-equiv="expires">
    <title>收入明细</title>
    <link rel="stylesheet" type="text/css" href="/assets-new/pkgapp/css/css.css">
    <script type="text/javascript" src="/assets-new/wx/js/jquery-1.8.3.min.js"></script>
</head>
<body>
<!--收入明细-->
<c:if test="${!empty payMapList}">
    <section class="task">
        <ul class="taskMe taskDaily taskPays">
            <c:forEach items="${payMapList}" var="payMap">
                <c:forEach items="${payMap}" var="itemMap">
                    <li>
                        <h2 class="taskName">
                            <p><fmt:formatDate pattern="yyyy-MM-dd" value="${itemMap.key.payTime}"/></p>
                            <em>合计：${itemMap.key.realPayMoney}</em>
                        </h2>
                        <c:forEach items="${itemMap.value}" var="item">
                            <div class="taskText">
                                <a href="/app/worker/myInComePkgPay?inspectNo=${item.inspectNo}&memberCode=${item.memberNo}">
                                    <dl>
                                        <dt>${item.fullName}-${item.community}-${item.building}-${item.unit}-${item.room}-${item.userName}</dt>
                                        <dd>${item.pkgName}</dd>

                                        <dd>
                                            <c:if test="${item.type == 1}">首款</c:if>
                                            <c:if test="${item.type == 2}">尾款</c:if>
                                            <span>${item.realMoney}</span>
                                        </dd>

                                    </dl>
                                </a>
                            </div>
                        </c:forEach>
                    </li>
                </c:forEach>
            </c:forEach>
        </ul>
    </section>
</c:if>
<c:if test="${empty payMapList}">
    <section class="noRob">
        <div class="noRobBox">
            <img src="/assets-new/pkgapp/img/noOrder.png">
            <a href="javascript:void(0);">暂无记录哦</a>
        </div>
    </section>
</c:if>
</body>
</html>