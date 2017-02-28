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
<title>播报详情</title>
</head>

<body>
    <!--3级页面框架-->
    <div class="right frame">
    	<!--头部-->
    	<header>
        	<h6>播报详情</h6>
        	<a href="/publish/threePath/toPublishList?orderNo=${news.orderNo }"><img src="/assets-new/img/esc.png"></a>
        </header>
        <div class="content">
            <!--某某人-->
            <div class="text_center">${item.community }-${item.building }-${item.unit }-${item.room }-${item.userName }</div>
        	<!--查看【竣工申请】进程-->
            <div class="order">
            	<h2 class="title_h2">播报详情</h2>
                <ul class="order_ul_li100">
                	<li>
                    	<span>施工日期：</span>
                        <b><fmt:formatDate value="${news.newsDate }" pattern="yyyy-MM-dd"/></b>
                    </li>
                    <li>
                    	<span>播报类型：</span>
                        <b>
                        	<c:if test="${news.newsSegment == 1 }">早晨播报</c:if>
	                    	<c:if test="${news.newsSegment == 2 }">晚上播报</c:if>
	                    	<c:if test="${news.newsSegment == 0 }">全天播报</c:if>
                        </b>
                    </li>
                    <li>
                    	<span>播报内容：</span>
                        <b>
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
                        </b>
                    </li>
                </ul>
                <c:if test="${not empty imgList }">
	                <h2 class="title_h2">施工图片</h2>
	                <ul class="order_ul_li100 order_img">
	                	<c:forEach var="item" items="${imgList }">
		                	<li>
		                    	<img src="${DOMAIN_NAME }${item.imgUrl}">
		                    </li>
	                    </c:forEach>
	                </ul>
                </c:if>
            </div>
        </div>
    </div>
</body>
</html>
