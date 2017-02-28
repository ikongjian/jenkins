<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page import="com.ikongjian.erp.enums.ErpContractOrderStatusEnum"%>
<%@page import="com.ikongjian.erp.enums.WorkerPackageStateEnum"%>
<%@ taglib prefix="en" uri="/enumTag"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" name="viewport">
    <meta name="format-detection" content="telephone=no" />
    <meta content="no-cache" http-equiv="pragma">
    <meta content="no-cache" http-equiv="cache-control">
    <meta content="0" http-equiv="expires">
    <title>我的任务</title>
    <link rel="stylesheet" type="text/css" href="/assets-new/pkgapp/css/css.css">
    <script type="text/javascript" src="/assets-new/wx/js/jquery-1.8.3.min.js"></script>
    <link rel="stylesheet" type="text/css" href="/assets-new/jquery-weui/css/weui.css">
    <link rel="stylesheet" type="text/css" href="/assets-new/jquery-weui/css/jquery-weui.css">
    <script type="text/javascript" src="/assets-new/jquery-weui/js/jquery-weui.js"></script>
    <script type="text/javascript">
        $(function() {
            //未到开工日期，不允许点【签到】
            $(".sign_ok").click(function() {
                var pId=$(this).data("pid");
                $.ajax({
                    url:"/app/wgpkg/getPkgStartDate",
                    data:{pId:pId},
                    type:"post",
                    dataType:"json",
                    async:false,
                    cache:false,
                    success:function(result) {
                        var nowDate=result.cDate;
                        var todayDate=new Date();
                        if(nowDate!=null&&nowDate!="") {
                            todayDate=new Date(Date.parse(nowDate.replace(/-/g,"/")));
                        }
                        var startDate=new Date(Date.parse((result.date).replace(/-/g,"/")));
                        var year=todayDate.getFullYear();
                        var month=(todayDate.getMonth()+1)>=10?(todayDate.getMonth()+1):"0"+(todayDate.getMonth()+1);
                        var day=todayDate.getDate()>=10?todayDate.getDate():"0"+todayDate.getDate();
                        var targetDayStr=year+"-"+month+"-"+day;
                        var targetDay=new Date(Date.parse(targetDayStr.replace(/-/g,"/")));
                        if(targetDay<startDate) {
                            $.alert("请待此包到达开工日期后再进行签到","消息");
                        } else {
                            window.location.href="/app/wgpkg/signView/"+pId;
                        }
                    }
                });
            });
            //未点【签到】，不允许点【申请完工】
            $(".complete_ok").click(function() {
                var pId=$(this).data("pid");
                var orderNo=$(this).data("ono");
                var wNo=$("#wNo").val();
                $.ajax({
                    url:"/app/wgpkg/getPkgIsSign",
                    data:{pId:pId,wNo:wNo},
                    type:"post",
                    dataType:"json",
                    async:false,
                    cache:false,
                    success:function(result) {
                        if(result) {
                            window.location.href="/app/wgpkg/toApplyComplete?packageId="+pId+"&orderNo="+orderNo;
                        } else {
                            $.alert("签到后才能申请完工","消息");
                        }
                    }
                });
            });
            //待完成
            $(".taskTabUn").click(function() {
                $(".taskTabEn").removeClass("taskTabA");
                $(".taskTabUn").addClass("taskTabA");
                $(".taskUn").css("display","");
                $(".taskEn").css("display","none");
            });
            //已完成
            $(".taskTabEn").click(function() {
                $(".taskTabUn").removeClass("taskTabA");
                $(".taskTabEn").addClass("taskTabA");
                $(".taskUn").css("display","none");
                $(".taskEn").css("display","");
            });
            //查看任务包详情
            $(".task_info").click(function() {
                var pId=$(this).data("pid");
                window.pageswitch.pageAssignment(true);
                window.location.href="/app/wgpkg/taskInfo?packageId="+pId;
            });
            //确认薪酬
            $(".confirm_money").click(function() {
                var pId=$(this).data("pid");
                window.pageswitch.pageAssignment(true);
                window.location.href="/app/wgpkg/proMoneyUI?pkgId="+pId;
            });
            //查看薪酬
            $(".view_money").click(function() {
                var pId=$(this).data("pid");
                window.pageswitch.pageAssignment(true);
                window.location.href="/app/wgpkg/proMoneyUI?pkgId="+pId;
            });
            var flag="${flag}";
            if(flag!=null&&flag=="money") {
                window.clearhistory.goClearHistory();
                window.pageswitch.pageAssignment(true);
            }
            var qdFlag="${qdFlag}";
            if(qdFlag!=null&&qdFlag=="qd") {
                window.clearhistory.goClearHistory();
            }
        });
        //显示已完成
        function clickCompleted() {
            $(".taskTabUn").removeClass("taskTabA");
            $(".taskTabEn").addClass("taskTabA");
            $(".taskUn").css("display","none");
            $(".taskEn").css("display","");
        }
    </script>
</head>
<body>
<section class="task">
    <input type="hidden" id="wNo" value="${memberInfo.code}">
    <div class="taskTab">
        <p>
            <a class="taskTabA taskTabUn" href="javascript:void(0);">待完成</a>
        </p>
        <p>
            <a class="taskTabEn" href="javascript:void(0);">已完成</a>
        </p>
    </div>
    <!--待完成-->
    <ul class="taskMe taskNob taskUn">
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
                    <c:if test="${isflag==1}">
                        <c:if test="${item.state!=60}">
                            <a class="nosign_button complete_ok" href="javascript:void(0);" data-pid="${item.id}" data-ono="${item.orderNo}">申请完工</a>
                        </c:if>
                        <c:if test="${mapisflag==0}">
                            <a class="nosign_button sign_ok" href="javascript:void(0);" data-pid="${item.id}">签到</a>
                        </c:if>
                        <c:if test="${mapisflag==1}">
                            <%--<a class="nosign_button" href="/app/wgpkg/bcNewUI?pkgId=${item.id}&orderNo=${item.orderNo}">项目播报</a>--%>
                            <a class="nosign_button" href="javascript:void(0);" onclick="window.broadcast.stepToBroadcast('${item.id}','${item.orderNo}')">项目播报</a>
                        </c:if>
                    </c:if>
                    <c:if test="${isflag==0&&mapisflag==1}">
                        <%--<a class="nosign_button" href=/app/wgpkg/bcNewUI?pkgId=${item.id}&orderNo=${item.orderNo}">项目播报</a>--%>
                        <a class="nosign_button" href="javascript:void(0);" onclick="window.broadcast.stepToBroadcast('${item.id}','${item.orderNo}')">项目播报</a>
                    </c:if>
                </div>
            </li>
        </c:forEach>
        <c:if test="${empty unPaList}">
            <div style="text-align:center;margin-top:100px;">
                <img src="/assets-new/pkgapp/img/noOrder.png" style="width:6.92rem;"><br>
                <span style="margin-top:20px;">暂无记录</span>
            </div>
        </c:if>
    </ul>
    <!--已完成-->
    <ul class="taskMe taskNob taskEn" style="display:none;">
        <c:forEach var="item" items="${enPaList}">
            <li>
                <h2 class="taskName">
                    <p>${item.pkgName}</p>
                    <em>${item.pkgMoney}元</em>
                </h2>
                <div class="taskText">
                    <p>
                        <span>项目工期：</span>
                        <em><fmt:formatDate value="${item.startDate}"/>至<fmt:formatDate value="${item.endDate}"/></em>
                    </p>
                    <a class="task_info" data-pid="${item.id}" href="javascript:void(0);" style="color:#333;">
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
                    <p class="taskHover">
                        <span>项目施工状态：</span>
                        <en:out enumClass="<%=ErpContractOrderStatusEnum.class%>" code="${item.orderState}"/>
                    </p>
                    <p><span>项目竣工日期：</span><fmt:formatDate value="${item.projectCheckDate}"/></p>
                    <p>
                        <c:choose>
                            <c:when test="${item.state==90}">
                                <span>已付首款：</span>${item.fMoney}元&nbsp;&nbsp;&nbsp;&nbsp;<span>未付尾款：</span>${item.nEMoney}元
                            </c:when>
                            <c:when test="${item.state==95}">
                                <span>已付首款：</span>${item.fMoney}元&nbsp;&nbsp;&nbsp;&nbsp;<span>已付尾款：</span>${item.eMoney}元
                            </c:when>
                            <c:otherwise>
                                <span>任务包状态：</span><en:out enumClass="<%=WorkerPackageStateEnum.class%>" code="${item.state}"/>
                            </c:otherwise>
                        </c:choose>
                    </p>
                </div>
                <c:if test="${item.state==70&&item.workerState!=1}">
                    <a class="taskClick confirm_money" data-pid="${item.id}" href="javascript:void(0);">去确认薪酬</a>
                </c:if>
                <c:if test="${item.state==73}">
                    <a class="taskClick view_money" data-pid="${item.id}" href="javascript:void(0);">去查看薪酬</a>
                </c:if>
            </li>
        </c:forEach>
        <c:if test="${empty enPaList}">
            <div style="text-align:center;margin-top:100px;">
                <img src="/assets-new/pkgapp/img/noOrder.png" style="width:6.92rem;"><br>
                <span style="margin-top:20px;">暂无记录</span>
            </div>
        </c:if>
    </ul>
</section>
</body>
</html>