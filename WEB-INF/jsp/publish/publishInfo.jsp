<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>项目播报</title>
    <%@ include file="/WEB-INF/jsp/layout/cssjs.jsp"%>
</head>

<body>
    <div class="content">
        <!--项目播报-->
        <div class="title">
            <h2>项目播报</h2>
            <%--<i><img src="/assets-new/4th/img/nav_0.png"></i>--%>
            <a href="/publish/threePath/toPublishList?orderNo=${item.orderNo }"><img src="/assets-new/4th/img/esc.png"></a>
        </div>
        <hr class="content_hr">
        <div class="formDetail">
            <h3>${item.community }-${item.building }-${item.unit }-${item.room }-${item.userName }</h3>
            <h4>播报详情</h4>
            <ul>
                <li>
                    <span>施工日期</span>
                    <p><fmt:formatDate value="${news.newsDate }" pattern="yyyy-MM-dd"/></p>
                </li>
                <li>
                    <span>播报类型</span>
                    <p>
                    	<c:if test="${news.newsSegment == 1 }">早晨播报</c:if>
	                    <c:if test="${news.newsSegment == 2 }">晚上播报</c:if>
	                    <c:if test="${news.newsSegment == 0 }">全天播报</c:if>
	                </p>
                </li>
                <li>
                    <span>播报内容</span>
                    <p>
                    	${news.newsTitle }
                       	<c:if test="${news.newsType == 0 and news.newsSegment == 1}">
                       		施工内容：${news.newsContent }，施工人员：${news.newsWorkerInfo }
                       	</c:if>
                       	<c:if test="${news.newsType == 1 }">
                       		停工时间：
                       			<c:if test="${news.newsSegment == 0 }">全天</c:if>
                       			<c:if test="${news.newsSegment == 1 }">上午</c:if>
                       			<c:if test="${news.newsSegment == 2 }">下午</c:if>；
                       		停工类型：
                       			<c:if test="${news.newsReasonType == 0 }">客户原因</c:if>
                       			<c:if test="${news.newsReasonType == 1 }">爱空间原因</c:if>；
                       		备注：${news.newsContent }。
                       	</c:if>
                    </p>
                </li>
            </ul>
            <h4>施工照片</h4>
            <ul class="buildPic">
                <c:forEach var="item" items="${imgList}">
                    <li><img src="${DOMAIN_NAME }${item.imgUrl}"></li>
                </c:forEach>
            </ul>
        </div>
    </div>
    <!--右侧内容框架结束-->
    <!--本页JS-->
    <script>
        $(function () {
            //隐藏返回按钮
            $(".nav").css("left","-16%");
            $(".nav").removeClass("animate");
            $(".content,.title").css("width","100%")
        })
    </script>
</body>

</html>