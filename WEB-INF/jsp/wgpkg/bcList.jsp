<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" name="viewport">
    <meta name="format-detection" content="telephone=no" />
    <meta content="no-cache" http-equiv="pragma">
    <meta content="no-cache" http-equiv="cache-control">
    <meta content="0" http-equiv="expires">
    <title>播报任务列表</title>
    <link rel="stylesheet" type="text/css" href="/assets-new/pkgapp/css/css.css">
    <script type="text/javascript" src="/assets-new/wx/js/jquery-1.8.3.min.js"></script>
    <script type="text/javascript">
        $(function() {
            var flag="${flag}";
            if(flag!=null&&flag=="bc") {
                window.clearhistory.goClearHistory();
            }
        });
    </script>
</head>
<body>
<!--待播报任务-->
<c:if test="${!empty unPaList}">
    <section class="task">
        <ul class="taskMe taskDaily">
            <c:forEach var="item" items="${unPaList}">
                <li>
                    <h2 class="taskName">
                        <p>${item.pkgName}</p>
                        <c:if test="${!empty item.sendDate}">
                            <span class="taskQiang">抢单</span>
                        </c:if>
                        <c:if test="${empty item.sendDate}">
                            <span class="taskPai">派单</span>
                        </c:if>
                        <em>${item.pkgMoney}元</em>
                    </h2>
                    <div class="taskText">
                        <p>
                            <span>项目工期：</span>
                            <em><fmt:formatDate value="${item.startDate}"/>至<fmt:formatDate value="${item.endDate}"/></em>
                        </p>
                        <a href="/app/wgpkg/taskInfo?packageId=${item.id}" style="color:#333;">
                            <p>
                                <span>项目地点：</span>
                                <em>${item.fullName}-${item.community}-${item.building}-${item.unit}-${item.room}-${item.userName}</em>
                            </p>
                        </a>
                        <p>
                            <span>项目经理：</span>
                            <em>${item.projectManageName}</em>
                            <a href="javascript:void(0);" onclick="window.callphone.stepToCallPhone('${item.projectManageTelephone}')"><img src="/assets-new/pkgapp/img/task3.png"></a>
                        </p>
                    </div>
                    <div class="taskState">
                        <c:set value="0" var="isflag"/> <!-- 判断是否是组长登录 0:组员  1:组长 -->
                        <c:set value="0" var="mapisflag"/> <!-- 判断是否签到 0:未签到  1:已签到-->
                        <c:forEach items="${mapLeader}" var="mapLeader">
                            <c:forEach var="map" items="${map}">
                                <c:if test="${map.key==item.id and map.value==true}">
                                    <c:set value="1" var="mapisflag"/>
                                </c:if>
                            </c:forEach>
                            <c:if test="${mapLeader.key==item.id and mapLeader.value==true}">
                                <c:set value="1" var="isflag"/>
                            </c:if>
                        </c:forEach>
                        <c:if test="${isflag==1&&mapisflag==1}">
                            <%--改为原生的 2016-11-21--%>
                            <%--<a class="nosign_button" href="/app/wgpkg/bcNewUI?pkgId=${item.id}&orderNo=${item.orderNo}">项目播报</a>--%>
                            <a class="nosign_button" href="javascript:void(0);" onclick="window.broadcast.stepToBroadcast('${item.id}','${item.orderNo}')">项目播报</a>
                        </c:if>
                        <c:if test="${isflag==0&&mapisflag==1}">
                            <%--改为原生的 2016-11-21--%>
                            <%--<a class="nosign_button" href=/app/wgpkg/bcNewUI?pkgId=${item.id}&orderNo=${item.orderNo}">项目播报</a>--%>
                            <a class="nosign_button" href="javascript:void(0);" onclick="window.broadcast.stepToBroadcast('${item.id}','${item.orderNo}')">项目播报</a>
                        </c:if>
                    </div>
                </li>
            </c:forEach>
            <c:if test="${empty unPaList}">
                <div style="text-align:center;margin-top:100px;">
                    <img src="/assets-new/pkgapp/img/xiong.jpg" width="60px;" height="60px;"><br>
                    <span style="margin-top:20px;">暂无记录</span>
                </div>
            </c:if>
        </ul>
    </section>
</c:if>
<c:if test="${empty unPaList}">
    <section class="noRob">
        <div class="noRobBox">
            <img src="/assets-new/pkgapp/img/noOrder.png">
            <a href="javascript:void(0);">暂无记录哦</a>
        </div>
    </section>
</c:if>
</body>
</html>