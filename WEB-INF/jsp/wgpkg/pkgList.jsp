<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE >
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" name="viewport">
    <meta content="no-cache" http-equiv="pragma">
    <meta content="no-cache" http-equiv="cache-control">
    <meta content="0" http-equiv="expires">
    <meta name="format-detection" content="telephone=no" />
    <link rel="stylesheet" type="text/css" href="/assets-new/pkgapp/css/css.css">
    <script type="text/javascript" src="/assets-new/wx/js/jquery-1.8.3.min.js"></script>
    <link rel="stylesheet" type="text/css" href="/assets-new/jquery-weui/css/weui.css">
    <link rel="stylesheet" type="text/css" href="/assets-new/jquery-weui/css/jquery-weui.css">
    <script type="text/javascript" src="/assets-new/jquery-weui/js/jquery-weui.js"></script>
    <script type="text/javascript" src="/assets-new/js/jquery.countdown.min.js"></script>
    <title>参与抢单</title>
</head>
<body>
<!--抢单-->
<c:if test="${!empty pkgPools}">
    <section class="rob">
        <div class="robNum">
            <p class="endTime">距结束仅剩<span id="countdown"></span></p>
            <p>还可抢<span>${dayMaxGrabCount-todayGrabPkgNum}</span>单</p>
        </div>
        <c:forEach items="${pkgPools}" var="pool">
            <!--任务列表-->
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
                        <div class="robR">
                            <c:if test="${pool.state==0}">
                                <a class="btn robClick grab_pkg" href="javascript:void(0);" data-pid="${pool.pkgId}"
                                   data-id="${pool.id}" data-ptype="${pool.pkgType}">马上抢</a>
                            </c:if>
                            <c:if test="${pool.state==1}">
                                <a class="btn robNot cancel_grab_pkg" href="javascript:void(0);" data-id="${pool.id}">已参与</a>
                            </c:if>
                            <c:if test="${pool.state==2}">
                                <a class="btn robClick" href="javascript:void(0);">抢中</a>
                            </c:if>
                            <c:if test="${pool.state==3}">
                                <a class="btn robLight" href="javascript:void(0);">未参与</a>
                            </c:if>
                            <c:if test="${pool.state==4}">
                                <a class="btn robLight" href="javascript:void(0);" style="width:120px;left:0;">参与但未抢中</a>
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
            <a href="javascript:void(0);">暂无记录哦</a>
        </div>
    </section>
</c:if>
</body>
<script type="text/javascript">
    $(function() {
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
        $(".grab_pkg").click(function() {
            var pkgType=$(this).data("ptype");
            var id=$(this).data("id");
            var pkgId=$(this).data("pid");
            $.post("/app/wgpkg/getNum",{pkgType:pkgType,pkgId:pkgId},function(data) {
                if(parseInt(data.state)==3) {
                    $.confirm("您确定要参与抢单吗？",function() {
                        $.post("/app/wgpkg/updateState",{id:id,state:1},function(result) {
                            $.alert(result.msg,"消息",function() {
                                window.location.reload(true);
                            });
                        });
                    },function() {});
                } else {
                    $.alert(data.msg,"消息");
                }
            });
        });
        $(".cancel_grab_pkg").click(function() {
            var that=this;
            $.confirm("您确定要取消参与抢单吗？",function() {
                var id=$(that).data("id");
                $.post("/app/wgpkg/updateState",{id:id,state:0},function(result) {
                    $.alert(result.msg,"消息",function() {
                        window.location.reload(true);
                    });
                });
            },function() {});
        });
    });
</script>
</html>
