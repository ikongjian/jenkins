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
    <%@ include file="/WEB-INF/jsp/layout/cssjs.jsp"%>
    <title>申请记录</title>
    <script type="text/javascript">
        $(function () {
            $(".nav").css("left","-16%");
            $(".nav").removeClass("animate");
            $(".content,.title").css("width","100%");
        });
    </script>
</head>

<body>
<div class="content">
    <div class="title">
        <h2>申请记录</h2>
        <a href="javascript:void(0);"  onclick="window.history.go(-1);"><img src="/assets-new/4th/img/esc.png"></a>
    </div>
    <hr class="content_hr">
    <div class="projectTableFrom">
        <table class="table_list" border="0" cellspacing="0" cellpadding="0">
            <tr class="table_listTr">
                <th scope="col" width="10%">序号</th>
                <th scope="col" width="20%">采购单编号</th>
                <th scope="col" width="20%">特单类型</th>
                <th scope="col" width="20%">期望送货日期</th>
                <th scope="col" width="10%">状态</th>
                <th scope="col" width="20%">操作</th>
            </tr>
            <tbody>
            <c:forEach var="ekko" items="${ekkos}" varStatus="status">
                <tr>
                    <td>${status.index+1}</td>
                    <td>${ekko.ebeln}</td>
                    <td>
                        <c:if test="${ekko.bsart=='41'}">直送特单-沙子水泥</c:if>
                        <c:if test="${ekko.bsart=='44'}">直送特单-自流平</c:if>
                    </td>
                    <td><fmt:formatDate value="${ekko.webaz}" pattern="yyyy-MM-dd"/></td>
                    <td>
                        <c:if test="${ekko.statu=='0'}">初审</c:if>
                        <c:if test="${ekko.statu=='1'}">下达</c:if>
                        <c:if test="${ekko.statu=='2'}">已取消</c:if>
                        <c:if test="${ekko.statu=='3'}">已收货</c:if>
                        <c:if test="${ekko.statu=='4'}">结算中</c:if>
                        <c:if test="${ekko.statu=='5'}">已结算</c:if>
                        <c:if test="${ekko.statu=='6'}">已付款</c:if>
                        <c:if test="${ekko.statu=='7'}">删除</c:if>
                        <c:if test="${ekko.statu=='8'}">复审</c:if>
                        <c:if test="${ekko.statu=='9'}">已出库</c:if>
                        <c:if test="${ekko.statu=='10'}">差异</c:if>
                        <c:if test="${ekko.statu=='11'}">部分收货</c:if>
                    </td>
                    <td>
                        <a class="td_an" href="/sand/threePath/detail?ebeln=${ekko.ebeln}">详情</a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>
