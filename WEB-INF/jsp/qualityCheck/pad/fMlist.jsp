<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <%@ include file="/WEB-INF/jsp/layout/cssjs.jsp"%>
    <title>质检报告</title>
</head>

<body>
<%@ include file="/WEB-INF/jsp/layout/menu.jsp"%>
<!--右侧内容框架-->
<div class="content">
    <div class="title">
        <h2>复检项目</h2>
        <i><img src="/assets-new/4th/img/nav_0.png"></i>
        <%--<a href="#"><img src="/assets-new/4th/img/esc.png"></a>--%>
    </div>
    <hr class="content_hr">
    <table class="table_list" border="0" cellspacing="0" cellpadding="0">
        <tbody>
        <tr class="table_listTr">
            <th scope="col" width="35%">顾客</th>
            <th scope="col" width="18%">检查内容</th>
            <th scope="col" width="18%">检查人</th>
            <th scope="col" width="14%">检查时间</th>
            <th scope="col" width="15%">操作</th>
        </tr>
        <c:forEach var="check" items="${checks}">
            <tr>
                <td class="text_left">
                    <a class="td_none" href="/order/threePath/toOrderInfoPage?orderNo=${check.orderNo}">${check.address}</a>
                </td>
                <td>${check.checkContent}</td>
                <td>${check.finishMancode}</td>
                <td><fmt:formatDate value="${check.updateTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                <td><a class="td_an" href="/fujian/check/dlist?oId=${check.orginCheckId}">复检列表</a></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
<!--右侧内容框架结束-->
<!--本页JS-->
<script>
    $(function() {
        //隐藏返回按钮
        $(".title a").hide();
    });
</script>
</body>

</html>