<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE >

<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" name="viewport">
    <meta content="no-cache" http-equiv="pragma">
    <meta content="no-cache" http-equiv="cache-control">
    <meta content="0" http-equiv="expires">
    <meta name="format-detection" content="telephone=no"/>
    <link rel="stylesheet" type="text/css" href="/assets-new/pkgapp/css/css.css">
    <script type="text/javascript" src="/assets-new/wx/js/jquery-1.8.3.min.js"></script>
    <link rel="stylesheet" type="text/css" href="/assets-new/jquery-weui/css/weui.css">
    <link rel="stylesheet" type="text/css" href="/assets-new/jquery-weui/css/jquery-weui.css">
    <script type="text/javascript" src="/assets-new/jquery-weui/js/jquery-weui.js"></script>
    <title>累计接单</title>
</head>
<body>
<!--抢单-->
<section class="rob">
    <c:forEach items="${pkgPools}" var="pool">
        <!--任务列表-->
        <ul class="robList">
            <li>
                <div class="robText">
                    <div style="background: url('/assets-new/pkgapp/img/task2.png') no-repeat 97% center/0.693rem; margin-right: 2rem;">
                        <div class="robL">
                            <a href="/app/wgpkg/taskInfo?packageId=${pool.pkgId}">
                                <p>
                                    <span>项目地点：</span>
                                    <em>${pool.customerInfo}</em>
                                </p>
                                <p>
                                    <span>${pool.pkgName}</span>
                                    <em style="float: right;
                                        font-style: normal;
                                        font-size: 1.07692rem;
                                        color: #eb6d00;">${pool.pkgMoney}元</em>
                                </p>
                            </a>
                        </div>
                    </div>
                </div>
            </li>
        </ul>
    </c:forEach>
    <c:if test="${empty pkgPools}">
        <section class="noRob">
            <div class="noRobBox">
                <img src="/assets-new/pkgapp/img/noOrder.png">
                <a href="javascript:void(0);">暂无记录哦</a>
            </div>
        </section>
    </c:if>
</section>
</body>
</html>
