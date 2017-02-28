<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE >
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
    <script type="text/javascript" src="/assets-new/js/jquery.countdown.min.js"></script>
    <title>待抢单</title>
</head>
<body>
<c:if test="${!empty pkgPools}">
    <section class="rob">
        <c:if test="${!empty flag}">
            <div class="robNum">
                <p class="endTime">距结束仅剩<span id="countdown"></span></p>
            </div>
        </c:if>
        <c:forEach items="${pkgPools}" var="pool">
            <ul class="robList">
                <li>
                    <h3 class="robName">${pool.pkgName}<em>${pool.pkgMoney}元</em></h3>
                    <div class="robText">
                        <div class="robL">
                            <a href="/app/wgpkg/taskInfo?packageId=${pool.pkgId}">
                                <p>
                                    <span>项目工期：</span>
                                    <em>
                                        <fmt:formatDate value="${pool.startDate}" pattern="yyyy-MM-dd"/>
                                        至
                                        <fmt:formatDate value="${pool.endDate}" pattern="yyyy-MM-dd"/>
                                    </em>
                                </p>
                                <p>
                                    <span>项目地点：</span>
                                    <em>${pool.customerInfo}</em>
                                </p>
                                <p>
                                    <span>项目经理：</span>
                                    <em>${pool.pmName}</em>
                                </p>
                            </a>
                        </div>
                    </div>
                </li>
            </ul>
        </c:forEach>
    </section>
</c:if>
<c:if test="${empty pkgPools}">
    <section class="noRob">
        <div class="noRobBox">
            <img src="/assets-new/pkgapp/img/noOrder.png">
            <a href="javascript:void(0);">暂无记录哦</a>
        </div>
    </section>
</c:if>
</body>
<script type="text/javascript">
    $(function() {
        var flag="${flag}";
        if(flag!=null&&flag!=""&&flag=="qFlag") {
            $("#countdown").countdown("${fightEndDate}").on("update.countdown",function(event) {
                var format="%H:%M:%S";
                if(event.offset.totalDays>0) {
                    format="%-d天"+format;
                }
                if(event.offset.weeks>0) {
                    format="%-w周"+format;
                }
                $(this).html(event.strftime(format));
            }).on("finish.countdown",function(event) {
                $(this).parent().html("抢单结束");
            });
        }
    });
</script>
</html>
