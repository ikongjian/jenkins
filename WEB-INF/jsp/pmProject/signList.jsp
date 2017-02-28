<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE >
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" name="viewport">
<meta content="no-cache" http-equiv="pragma">
<meta content="no-cache" http-equiv="cache-control">
<meta content="0" http-equiv="expires">
<%@ include file="/WEB-INF/jsp/layout/cssjs.jsp"%>
<title>签到列表</title>
</head>

<body>
<div class="content">
    <div class="title">
        <h2>签到列表</h2>
        <a href="javascript:void(0);" onclick="window.history.go(-1);"><img src="/assets-new/4th/img/esc.png"></a>
    </div>
    <hr class="content_hr">
    <table class="table_list" border="0" cellspacing="0" cellpadding="0">
        <tr class="table_listTr">
            <th scope="col" width="10%">序号</th>
            <th scope="col" width="35%">顾客</th>
            <th scope="col" width="35%">签到地址</th>
            <th scope="col" width="20%">签到时间</th>
        </tr>
        <%--<tr>
            <td class="text_left"><a class="td_none" href="#">绿地外滩公馆3-2-1201-刘曲波</a></td>
            <td>2016-04-25</td>
            <td>5</td>
            <td>焦圣男</td>
            <td><a class="td_an"  href="#">报告列表</a></td>
        </tr>--%>
        <tbody>
        <c:forEach var="item" items="${signList }" varStatus="status">
            <tr>
                <td>${status.index+1 }</td>
                <td>${order.community }${order.building }-${order.unit }-${order.room }-${order.userName }</td>
                <td>${item.address }</td>
                <td><fmt:formatDate value="${item.createTime }" pattern="yyyy-MM-dd"/></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
<script type="text/javascript">
    $(function() {
        $(".nav").css("left","-16%");
        $(".nav").removeClass("animate");
        $(".content,.title").css("width","100%");
    });
</script>
</body>
</html>
