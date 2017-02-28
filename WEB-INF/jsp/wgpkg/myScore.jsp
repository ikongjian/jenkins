<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <meta charset="UTF-8">
    <meta content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" name="viewport">
    <meta name="format-detection" content="telephone=no" />
    <meta content="no-cache" http-equiv="pragma">
    <meta content="no-cache" http-equiv="cache-control">
    <meta content="0" http-equiv="expires">
    <title>我的评分</title>
    <link rel="stylesheet" type="text/css" href="/assets-new/pkgapp/css/css.css">
</head>
<body>
<c:if test="${!empty grades}">
    <section>
        <table class="myScore" border="0" cellspacing="0" cellpadding="0">
                <%--<caption>
                    <span>质量占50%</span>
                    <span>工期占30%</span>
                    <span>服务占20%</span>
                </caption>--%>
            <col span="1" width="15%">
            <col span="1">
            <col span="1">
            <col span="1">
            <col span="1" width="18%">
            <thead>
                <tr>
                    <th>项目</th>
                    <th>质量</th>
                    <th>工期</th>
                    <th>服务</th>
                    <th>综合分</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${grades}" var="grade" varStatus="gdState">
                    <tr>
                        <td>${gdState.index+1}</td>
                        <td>${grade.zlScore}</td>
                        <td>${grade.gqScore}</td>
                        <td>${grade.fwScore}</td>
                        <td>${grade.zhScore}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </section>
</c:if>
<c:if test="${empty grades}">
    <section class="noRob">
        <div class="noRobBox">
            <img src="/assets-new/pkgapp/img/noOrder.png">
            <a href="javascript:void(0);">暂无记录哦</a>
        </div>
    </section>
</c:if>
</body>
</html>
