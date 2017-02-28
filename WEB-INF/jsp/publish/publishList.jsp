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
<title>项目播报列表</title>
</head>

<body>
<div class="content">
    <div class="title">
        <h2>项目播报列表</h2>
        <a href="/publish/list"><img src="/assets-new/img/esc.png"></a>
    </div>
    <hr class="content_hr">
        <div class="projectForm">
            <table class="table_list replenish_list" border="0" cellspacing="0" cellpadding="0">
                <tr class="table_listTr">
                    <th scope="col" width="21.25%">施工日期</th>
                    <th scope="col" width="21.25%">播报类型</th>
                    <th scope="col" width="21.25%">播报时间</th>
                    <th scope="col" width="21.25%">状态</th>
                    <th scope="col" width="15%">操作</th>
                </tr>
                <tbody>
                <c:forEach var="item" items="${newsList }">
                    <tr>
                        <td><fmt:formatDate value="${item.newsDate }" pattern="yyyy-MM-dd"/></td>
                        <td>
                            <c:if test="${item.newsSegment == 1 }">早晨播报</c:if>
                            <c:if test="${item.newsSegment == 2 }">晚上播报</c:if>
                            <c:if test="${item.newsSegment == 0 }">全天播报</c:if>
                        </td>
                        <td><fmt:formatDate value="${item.createTime }" pattern="HH:mm"/></td>
                        <td>
                            <c:if test="${item.newsType == 0 }">正常</c:if>
                            <c:if test="${item.newsType == 1 }">停工</c:if>
                        </td>
                        <td><a class="td_an" href="/publish/threePath/publishInfo?id=${item.id}&type=${item.newsSegment}">查看</a></td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
</div>
</body>
<script type="text/javascript">
    $(function() {
        $(".nav").css("left","-16%");
        $(".nav").removeClass("animate");
        $(".content,.title").css("width","100%");
    });
</script>
</html>
