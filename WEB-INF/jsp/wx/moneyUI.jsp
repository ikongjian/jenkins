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
<link rel="stylesheet" type="text/css" href="/assets-new/wx/css/css.css">
<script type="text/javascript" src="/assets-new/wx/js/jquery-1.8.3.min.js"></script>
<link rel="stylesheet" type="text/css" href="/assets-new/jquery-raty/jquery.raty.css">
<script type="text/javascript" src="/assets-new/jquery-raty/jquery.raty.js"></script>
<script type="text/javascript" src="/assets-new/layer-v2.0/layer/layer.js"></script>
</head>
<body>
    <div class="rmb_branch">
        <div class="reb_branch_list">
            <p>
            	<span>结算总金额：</span>
            	<fmt:formatNumber value="${inspect.procedureMoney}" type="number" pattern="0.00"/>
           	</p>
            <p>
            	<span>辅料：</span>
            	-<fmt:formatNumber value="${inspect.excipientMoney}" type="number" pattern="0.00"/>
           	</p>
            <p>
            	<span>工期扣款：</span>
            	-<fmt:formatNumber value="${inspect.delayDay*inspect.delayUnitPrice}" type="number" pattern="0.00"/>
            </p>
            <p>
            	<span>管理扣款：</span>
            	-<fmt:formatNumber value="${inspect.punishMoney}" type="number" pattern="0.00"/>
           	</p>
            <p>
                <span>项目补助：</span>
                +<fmt:formatNumber value="${inspect.supplyNeedsMoney}" type="number" pattern="0.00"/>
            </p>
            <strong>
            	<span>结算金额：</span>
            	<fmt:formatNumber value="${inspect.settleMoney}" type="number" pattern="0.00"/>
           	</strong>
        </div>
        <form action="/wx/proMoney" method="post" id="moneyForm">
        	<input type="hidden" name="pkgId" value="${inspect.pkgId}">
        	<input type="hidden" name="inspectId" value="${inspect.id}">
        	<input type="hidden" name="workerMemberNo" value="${inspect.workerMemberNo}">
        	<input type="hidden" name="orderNo" value="${inspect.orderNo}">
        	<input type="hidden" name="agreeType">
            <input type="hidden" name="pmScore">
            <input type="hidden" name="isGroupLeader">
	        <table width="100%" border="0" cellspacing="0" cellpadding="0">
	            <tr>
	                <th width="50%">工人姓名</th>
	                <th width="50">分配金额</th>
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
	        </table>
	        <c:if test="${orderState==70}">
		        <c:choose>
		        	<c:when test="${isConfirm==0}">
                        <c:if test="${loginCode==leaderCode}">
                            <table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:20px;">
                                <tr>
                                    <th>是否还希望与项目经理${pmName}合作？</th>
                                </tr>
                                <tr>
                                    <td>
                                        <span id="pmGrade"></span>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        非常不愿意&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;无所谓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;非常愿意
                                    </td>
                                </tr>
                            </table>
                        </c:if>
		        		<button class="rmb_branchOK agree_money">同意</button>
		        		<button class="rmb_branchOK refuse_money">不同意</button>
		        	</c:when>
		        	<c:when test="${isConfirm==1}">
                        <div style="margin:1.2rem auto;text-align:center;color:#ed6e00;font-size:1.2rem;line-height:2.5rem;">
                            您已同意
                        </div>
		        	</c:when>
		        	<c:when test="${isConfirm==2}">
                        <div style="margin:1.2rem auto;text-align:center;color:#ed6e00;font-size:1.2rem;line-height:2.5rem;">
                            您已不同意
                        </div>
		        	</c:when>
		        </c:choose>
	        </c:if>
	        <c:if test="${orderState==73}">
                <div style="margin:1.2rem auto;text-align:center;color:#ed6e00;font-size:1.2rem;line-height:2.5rem;">
                    验收单已回退给项目经理，本页面信息已无效！
                </div>
	        </c:if>
        </form>
    </div>
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
                        layer.msg("请为项目经理打分",{icon:6,time:1000});
                        return false;
                    } else {
                        $("input[name='agreeType']").val("yes");
                        $("input[name='pmScore']").val(pmScore);
                        $("input[name='isGroupLeader']").val("yes");
                        $(".agree_money").attr("disabled",true);
                        $("#moneyForm").submit();
                    }
                } else {
                    $("input[name='agreeType']").val("yes");
                    $("input[name='isGroupLeader']").val("no");
                    $(".agree_money").attr("disabled",true);
                    $("#moneyForm").submit();
                }
    		});
    		$(".refuse_money").click(function() {
                if(loginCode==leaderCode) {
                    var pmScore=$("#pmGrade").raty("score");
                    if(pmScore==null||pmScore==""||parseFloat(pmScore)<=0) {
                        layer.msg("请为项目经理打分",{icon:6,time:1000});
                        return false;
                    } else {
                        $("input[name='agreeType']").val("no");
                        $("input[name='pmScore']").val(pmScore);
                        $("input[name='isGroupLeader']").val("yes");
                        $(".refuse_money").attr("disabled",true);
                        $("#moneyForm").submit();
                    }
                } else {
                    $("input[name='agreeType']").val("no");
                    $("input[name='isGroupLeader']").val("no");
                    $(".refuse_money").attr("disabled",true);
                    $("#moneyForm").submit();
                }
    		});
    	});
    </script>
</body>
</html>