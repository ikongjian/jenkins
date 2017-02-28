<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
    <title>薪酬确认</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" name="viewport">
    <meta content="no-cache" http-equiv="pragma">
    <meta content="no-cache" http-equiv="cache-control">
    <meta content="0" http-equiv="expires">
    <meta name="format-detection" content="telephone=no" />
    <link rel="stylesheet" type="text/css" href="/assets-new/pkgapp/css/css.css">
    <script type="text/javascript" src="/assets-new/wx/js/jquery-1.8.3.min.js"></script>
    <link rel="stylesheet" type="text/css" href="/assets-new/jquery-raty/jquery.raty.css">
    <script type="text/javascript" src="/assets-new/jquery-raty/jquery.raty.js"></script>
    <link rel="stylesheet" type="text/css" href="/assets-new/jquery-weui/css/weui.css">
    <link rel="stylesheet" type="text/css" href="/assets-new/jquery-weui/css/jquery-weui.css">
    <script type="text/javascript" src="/assets-new/jquery-weui/js/jquery-weui.js"></script>
</head>
<body>
<section class="task">
    <div class="taskPay">
        <p><span>结算总金额：</span><fmt:formatNumber value="${inspect.procedureMoney}" type="number" pattern="0.00"/></p>
        <p><span>辅料：</span>-<fmt:formatNumber value="${inspect.excipientMoney}" type="number" pattern="0.00"/></p>
        <p><span>工期扣款：</span>-<fmt:formatNumber value="${inspect.delayDay*inspect.delayUnitPrice}" type="number" pattern="0.00"/></p>
        <p><span>管理扣款：</span>-<fmt:formatNumber value="${inspect.punishMoney}" type="number" pattern="0.00"/></p>
        <p><span>项目补助：</span>+<fmt:formatNumber value="${inspect.supplyNeedsMoney}" type="number" pattern="0.00"/></p>
        <em><span>结算金额：</span><fmt:formatNumber value="${inspect.settleMoney}" type="number" pattern="0.00"/></em>
    </div>
    <form action="/app/wgpkg/proMoney" method="post" id="moneyForm">
        <input type="hidden" name="pkgId" value="${inspect.pkgId}">
        <input type="hidden" name="inspectId" value="${inspect.id}">
        <input type="hidden" name="workerMemberNo" value="${inspect.workerMemberNo}">
        <input type="hidden" name="orderNo" value="${inspect.orderNo}">
        <input type="hidden" name="agreeType">
        <input type="hidden" name="pmScore">
        <input type="hidden" name="isGroupLeader">
        <table class="taskSub" cellpadding="0" cellspacing="0">
            <tbody>
                <tr>
                    <th width="30%">工人姓名</th>
                    <th width="70%">分配金额</th>
                </tr>
                <c:forEach items="${leaders}" var="leader">
                    <tr>
                        <td>${leader.workerName}</td>
                        <td>
                            <fmt:formatNumber value="${leader.money}" type="number" pattern="0.00"/>
                            <c:if test="${!empty leader.depositMoney}">
                                （含扣质保金<fmt:formatNumber value="${leader.depositMoney}" type="number" pattern="0.00"/>）
                            </c:if>
                        </td>
                    </tr>
                </c:forEach>
                <c:forEach items="${workers}" var="worker">
                    <tr>
                        <td>${worker.workerName}</td>
                        <td>
                            <fmt:formatNumber value="${worker.money}" type="number" pattern="0.00"/>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <c:if test="${orderState==70}">
            <c:choose>
                <c:when test="${isConfirm==0}">
                    <c:if test="${loginCode==leaderCode}">
                        <div class="taskEvaluate">
                            <h2>是否还希望与项目经理${pmName}合作？</h2>
                            <div class="taskFen" style="text-align:center;">
                                <span id="pmGrade"></span>
                                <br>
                                非常不愿意&nbsp;&nbsp;&nbsp;&nbsp;无所谓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;非常愿意
                            </div>
                        </div>
                    </c:if>
                    <div class="taskConfirm">
                        <a href="javascript:void(0);" class="agree_money">同意</a>
                        <a href="javascript:void(0);" class="refuse_money">不同意</a>
                    </div>
                </c:when>
                <c:when test="${isConfirm==1}">
                    <div class="taskConfirm">
                        您已同意
                    </div>
                </c:when>
                <c:when test="${isConfirm==2}">
                    <div class="taskConfirm">
                        您已不同意
                    </div>
                </c:when>
            </c:choose>
        </c:if>
        <c:if test="${orderState==73}">
            <div class="taskConfirm">
                验收单已回退给项目经理，本页面信息已无效
            </div>
        </c:if>
    </form>
</section>
<script type="text/javascript">
    $(function() {
        $("#pmGrade").raty({
            path:"/assets-new/jquery-raty/images",
            number:10
        });
        var loginCode="${loginCode}";
        var leaderCode="${leaderCode}";
        $(".agree_money").click(function() {
            if(loginCode==leaderCode) {
                var pmScore=$("#pmGrade").raty("score");
                if(pmScore==null||pmScore==""||parseFloat(pmScore)<=0) {
                    $.alert("请为项目经理打分","消息");
                    return false;
                } else {
                    $("input[name='agreeType']").val("yes");
                    $("input[name='pmScore']").val(pmScore);
                    $("input[name='isGroupLeader']").val("yes");
                    $.showLoading("提交中，请稍候");
                    $(".agree_money").attr("disabled",true);
                    setTimeout(function() {$.hideLoading();},1000);
                    $("#moneyForm").submit();
                }
            } else {
                $("input[name='agreeType']").val("yes");
                $("input[name='isGroupLeader']").val("no");
                $.showLoading("提交中，请稍候");
                $(".agree_money").attr("disabled",true);
                setTimeout(function() {$.hideLoading();},1000);
                $("#moneyForm").submit();
            }
        });
        $(".refuse_money").click(function() {
            if(loginCode==leaderCode) {
                var pmScore=$("#pmGrade").raty("score");
                if(pmScore==null||pmScore==""||parseFloat(pmScore)<=0) {
                    $.alert("请为项目经理打分","消息");
                    return false;
                } else {
                    $("input[name='agreeType']").val("no");
                    $("input[name='pmScore']").val(pmScore);
                    $("input[name='isGroupLeader']").val("yes");
                    $.showLoading("提交中，请稍候");
                    $(".refuse_money").attr("disabled",true);
                    setTimeout(function() {$.hideLoading();},1000);
                    $("#moneyForm").submit();
                }
            } else {
                $("input[name='agreeType']").val("no");
                $("input[name='isGroupLeader']").val("no");
                $.showLoading("提交中，请稍候");
                $(".refuse_money").attr("disabled",true);
                setTimeout(function() {$.hideLoading();},1000);
                $("#moneyForm").submit();
            }
        });
    });
</script>
</body>
</html>
