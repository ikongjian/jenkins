<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="en" uri="/enumTag"%>
<title>补货申请查看</title>

<%@ include file="/WEB-INF/jsp/layout/cssjs.jsp"%>
<div class="content">
    <div class="title">
        <h2>申请详情</h2>
        <a href="javascript:void(0);" onclick="window.history.go(-1);"><img src="/assets-new/img/esc.png"></a>
    </div>
    <hr class="content_hr">
    <div class="orderBaseInfo">
        <ul>
            <li><span>采购编号：</span>${result.erpEkko.ebeln}</li>
            <li>
                <span>采购内容：</span>
                <c:if test="${result.erpEkko.bsart=='41'}">直送特单-沙子水泥</c:if>
                <c:if test="${result.erpEkko.bsart=='44'}">直送特单-自流平</c:if>
            </li>
            <li>
                <span>采购单状态：</span>
                <c:if test="${result.erpEkko.statu=='0'}">初审</c:if>
                <c:if test="${result.erpEkko.statu=='1'}">下达</c:if>
                <c:if test="${result.erpEkko.statu=='2'}">已取消</c:if>
                <c:if test="${result.erpEkko.statu=='3'}">已收货</c:if>
                <c:if test="${result.erpEkko.statu=='4'}">结算中</c:if>
                <c:if test="${result.erpEkko.statu=='5'}">已结算</c:if>
                <c:if test="${result.erpEkko.statu=='6'}">已付款</c:if>
                <c:if test="${result.erpEkko.statu=='7'}">删除</c:if>
                <c:if test="${result.erpEkko.statu=='8'}">复审</c:if>
                <c:if test="${result.erpEkko.statu=='9'}">已出库</c:if>
                <c:if test="${result.erpEkko.statu=='10'}">差异</c:if>
                <c:if test="${result.erpEkko.statu=='11'}">部分收货</c:if>
            </li>
            <li>
                <span>期望交货日期：</span>
                <fmt:formatDate value="${result.erpEkko.webaz}" pattern="yyyy-MM-dd"/>
            </li>
        </ul>
    </div>
    <table class="table_list" border="0" cellspacing="0" cellpadding="0">
        <tbody>
        <tr class="table_listTr">
            <th scope="col" width="10%">序号</th>
            <th scope="col" width="15%">商品编号</th>
            <th scope="col" width="17%">商品名称</th>
            <th scope="col" width="13%">品牌</th>
            <th scope="col" width="10%">单位</th>
            <th scope="col" width="10%">采购数量</th>
            <th scope="col" width="25%">备注</th>
        </tr>
        <c:forEach items="${result.erpEkpos}" var="erpEkpo" varStatus="status">
            <tr>
                <td>${status.index+1}</td>
                <td>${erpEkpo.matnr}</td>
                <td>${erpEkpo.txz01}</td>
                <td>${erpEkpo.branchName}</td>
                <td>${erpEkpo.meins}</td>
                <td>
                    <fmt:formatNumber type="number" value="${erpEkpo.menge}"/>
                </td>
                <td>${erpEkpo.exlin}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
<!--右侧内容框架结束-->
<!--本页JS-->
<script>
    $(function () {
        //隐藏返回按钮
        $(".nav").css("left","-16%");
        $(".nav").removeClass("animate");
        $(".content,.title").css("width","100%");
    })
</script>

