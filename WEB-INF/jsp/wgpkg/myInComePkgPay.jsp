<!DOCTYPE html>
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
  <title>结算明细</title>
  <link rel="stylesheet" type="text/css" href="/assets-new/pkgapp/css/css.css">
  <script type="text/javascript" src="/assets-new/wx/js/jquery-1.8.3.min.js"></script>
</head>
<body>
<!--结算明细-->
<section class="task">
  <ul class="taskMe taskDaily taskPays payDetail">
    <li>
      <h2 class="taskName">
        <p>结算总金额</p>
        <em>${inspect.settleMoney}元</em>
      </h2>
      <div class="costList">
        <p><span>定额结算金额</span>${inspect.procedureMoney}元</p>
        <p><span>ERP辅材金额</span>${inspect.excipientMoney}元</p>
        <p><span>扣款</span>${inspect.punishMoney + inspect.delayUnitPrice*inspect.delayDay}元</p>
        <p><span>补助</span>${inspect.supplyNeedsMoney}元</p>
      </div>
    </li>



    <c:forEach items="${payList}" var="pay">
    <li>
      <h2 class="taskName">
        <p>
          <c:if test="${pay.type == 1}">首款${inspect.downPayments}%</c:if>
          <c:if test="${pay.type == 2}">尾款${100 - inspect.downPayments}%</c:if>
        </p>
        <em>${pay.realMoney}元</em>
      </h2>
      <div class="costList clearOrder">
        <c:if test="${pay.type == 1}">
          <p><span>质保金</span>${pay.leaderDepositMoney}元</p>
        </c:if>
        <p><span>税金</span>${pay.taxes}元</p>
        <p><span>备注</span>${pay.memo}</p>
        <p><span>付款时间</span><fmt:formatDate pattern="yyyy-MM-dd" value="${pay.payTime}"/></p>
      </div>
    </li>
    </c:forEach>

  </ul>
</section>
</body>
</html>