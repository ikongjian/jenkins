<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="en" uri="/enumTag"%>
<%@ include file="/WEB-INF/jsp/layout/cssjs.jsp"%>
<%@ include file="/WEB-INF/jsp/layout/menu.jsp"%>
<div class="content">
    <div class="title widht_84">
        <h2 class="color_fff">沙子水泥</h2>
        <i><img class="width_100" src="/assets-new/img/nav_0.png"></i>
        <%--<a href="#"><img class="width_100" src="/assets-new/img/esc.png"></a>--%>
    </div>
    <hr class="content_hr">
    <table class="table_list" border="0" cellspacing="0" cellpadding="0">
        <tbody>
        <tr class="table_listTr">
            <th scope="col" width="26%">顾客</th>
            <th scope="col" width="23%">合同开工时间</th>
            <th scope="col" width="23%">实际开工时间</th>
            <th scope="col" width="10%">状态</th>
            <th scope="col" width="18%">操作</th>
        </tr>
        <c:forEach var="item" items="${list}">
            <tr>
                <td  class="text_left">
                    <a class="td_none" href="/order/threePath/toOrderInfoPage?orderNo=${item.orderNo}">
                        ${item.community}-${item.building}-${item.unit}-${item.room}-${item.userName}
                    </a>
                </td>
                <td>
                    <fmt:formatDate value="${item.planWorkingDate}" pattern="yyyy-MM-dd"/>
                </td>
                <td>
                    <fmt:formatDate value="${item.workingDate}" pattern="yyyy-MM-dd"/>
                </td>
                <td>${item.orderStates}</td>
                <td>
                    <a href="/sand/applyUI?orderNo=${item.orderNo}" class="td_an">申请</a>
                    <a href="/sand/threePath/applyList?orderNo=${item.orderNo}" class="td_an">申请记录</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
<script type="text/javascript">
    $(function() {
        //隐藏返回按钮
        $(".title a").hide();
    });
</script>