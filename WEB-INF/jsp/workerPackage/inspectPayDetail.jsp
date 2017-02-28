<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="/WEB-INF/jsp/layout/cssjs.jsp"%>
<div class="content" style="width:100%;">
	<div class="title widht_84">
	    <h2 class="color_fff">付款分配明细</h2>
	    <a href="javascript:void(0);" onclick="window.history.back();"><img class="width_100" src="/assets-new/img/esc.png"></a>
	</div>
	<hr class="content_hr">
	<table class="table_list" border="0" cellspacing="0" cellpadding="0">
	    <tbody>
	        <tr class="table_listTr">
	            <th scope="col" width="12%">账户名</th>
	            <th scope="col" width="12%">角色</th>
	            <th scope="col" width="12%">付款类型</th>
	            <th scope="col" width="12%">开户银行</th>
	            <th scope="col" width="12%">支行</th>
	            <th scope="col" width="12%">银行卡号</th>
	            <th scope="col" width="12%">应付金额</th>
	            <th scope="col" width="12%">实付金额</th>
	        </tr>
	        <c:forEach items="${pays}" var="pay">
	        	<tr>
	        		<td>${pay.workerName}</td>
	        		<td>
	        			<c:if test="${pay.isLeader=='1'}">组长</c:if>
	        			<c:if test="${pay.isLeader=='2'}">组员</c:if>
	        		</td>
	        		<td>
	        			<c:if test="${pay.type == 1}">首款</c:if>
	        			<c:if test="${pay.type == 2}">尾款</c:if>
	        		</td>
	        		<td>${pay.bankName}</td>
	        		<td>${pay.subBranchName}</td>
	        		<td>${pay.bankCardNo}</td>
	        		<td>
	        			<fmt:formatNumber value="${pay.money}" pattern="0.00" type="number"/>
	        		</td>
					<td>
						<c:if test="${pay.realMoney == null and pay.payStatus == 2}">0.00</c:if>
						<c:if test="${pay.realMoney != null or payStatus != 2}">${pay.realMoney}</c:if>
					</td>

	        		
	        	</tr>
	        </c:forEach>
	    </tbody>
	</table>
	<c:if test="${type==1}">
		<div class="paymentDetailed ba_fff">
		    <p class="color_666 fl">本次组长扣质保金：<fmt:formatNumber value="${depMoney}" pattern="0.00" type="number"/>元</p>
		    <p class="color_666 fr">应付金额合计：<span class="color_yellow"><fmt:formatNumber value="${pMoney+depMoney}" pattern="0.00" type="number"/></span>元</p>
		    <p class="color_666 fr">实付金额合计：<span class="color_yellow"><fmt:formatNumber value="${rMoney}" pattern="0.00" type="number"/></span>元</p>
		</div>
	</c:if>
	<c:if test="${type==2}">
		<div class="paymentDetailed ba_fff">
		    <p class="color_666 fr">应付金额合计：<span class="color_yellow"><fmt:formatNumber value="${pMoney}" pattern="0.00" type="number"/></span>元</p>
		    <p class="color_666 fr">实付金额合计：<span class="color_yellow"><fmt:formatNumber value="${rMoney}" pattern="0.00" type="number"/></span>元</p>
		</div>
	</c:if>
</div>