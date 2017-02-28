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
<title>项目播报列表</title>
</head>

<body>
    <!--右侧-->
    <div class="right frame">
    	<!--右侧头部-->
    	<header>
        	<h6>项目播报列表</h6>
        	<a href="/publish/list"><img src="/assets-new/img/esc.png"></a>
        </header>
        <!--右侧内容-->
        <div class="content">
        	<!--我的项目列表-->
            <table class="table_1" width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr class="quote_tr">
                    <th scope="col" width="21.25%">施工日期</th>
                    <th scope="col" width="21.25%">播报类型</th>
                    <th scope="col" width="21.25%">播报时间</th>
                    <th scope="col" width="21.25%">状态</th>
                    <th scope="col" width="15%">操作</th>
				</tr>
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
                    <td><a href="/publish/threePath/publishInfo?id=${item.id }&type=${item.newsSegment}">查看</a></td>        
                </tr>
                </c:forEach>
			</table>     	
        </div>
    </div>
</body>
</html>
