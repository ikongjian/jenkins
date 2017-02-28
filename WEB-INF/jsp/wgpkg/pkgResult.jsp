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
    <title>抢单结果</title>
</head>
<body>
<c:if test="${!empty pkgPools}">
    <section class="rob">
        <div class="robNum robTime"><p>${date}</p></div>
        <c:forEach items="${pkgPools}" var="pool">
            <ul class="robList">
                <li>
                    <h3 class="robName">${pool.pkgName}<em>${pool.pkgMoney}元</em></h3>
                    <div class="robText">
                        <div class="robL">
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
                        </div>
                        <div class="robR">
                            <c:if test="${pool.state==2}">
                                <span class="btn robWin">中标</span>
                            </c:if>
                            <c:if test="${pool.state==3||pool.state==4}">
                                <span class="btn robNot">落标</span>
                                <a class="lookWinInfo" href="javascript:void(0);" data-pid="${pool.pkgId}">查看中标人</a>
                            </c:if>
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
            <a href="javascript:void(0);">没有抢单记录，快去抢单吧！</a>
        </div>
    </section>
</c:if>
</body>
<div class="pop">
    <div class="popBox">
        <div class="winInfo">
            <h3>中标信息</h3>
            <p>中标者为<q class="win_name"></q><br><q class="win_l_n"></q><br><span>继续加油哦！</span></p>
        </div>
        <a class="confirmBtn" href="javascript:">知道了</a>
    </div>
</div>
<script type="text/javascript">
    $(function() {
        $(".lookWinInfo").click(function() {
            var pkgId=$(this).data("pid");
            $.ajax({
                url:"/app/wgpkg/getGrabedPkgWG",
                type:"post",
                dataType:"json",
                data:{pkgId:pkgId},
                async:false,
                cache:false,
                success:function(result) {
                    $(".win_name").html(result.groupLeaderName);
                    $(".win_l_n").html(result.level+"星 "+result.nps);
                    $(".pop").fadeIn(function() {
                        var height=$(".popBox").height();
                        $(".popBox").css("margin-top",-height/2);
                        $(".popBox").fadeTo("slow",1);
                    });
                }
            });
        });
        $(".confirmBtn").click(function() {
            $(".pop").fadeOut(function() {
                $(".popBox").removeAttr("style");
            });
        })
    });
</script>
</html>
