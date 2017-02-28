<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="/pageTag" prefix="page"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" name="viewport">
<meta content="no-cache" http-equiv="pragma">
<meta content="no-cache" http-equiv="cache-control">
<meta content="0" http-equiv="expires">
<meta name="format-detection" content="telephone=no" />
<title>测量工具</title>
<link href="<%=basePath%>assets-new/css/designerMeasureTools/css.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="<%=basePath%>assets-new/css/designerMeasureTools/css6.css" media="screen and (min-width: 375px)"> 
<link rel="stylesheet" type="text/css" href="<%=basePath%>assets-new/css/designerMeasureTools/css6plus.css" media="screen and (min-width: 414px)"> 
<script src="<%=basePath%>assets-new/js/designerMeasureTools/jquery.min.js" ></script>
<script src="<%=basePath%>assets-new/js/designerMeasureTools/clgj.js"></script>
</head>
<body>
	<div class="clgj_lb">
    	<img src="/assets-new/img/designerMeasureTools/1.png" width="100%">
        <h1>请选择本次测量客户的订单</h1>
        <c:choose>
           <c:when test="${ measureOrdersList.size() > 0}">
           <ul>
        	<c:forEach var="item" items="${measureOrdersList}" varStatus="">
        		<li>
            	    <h2>
            	    	<c:if test="${ not empty item.community}">
            	        	${item.community}
            	   		</c:if>
            	    	<c:if test="${ not empty item.building}">
            	        	-${item.building}
            	    	</c:if>
            	    	<c:if test="${ not empty item.unit}">
            	        	-${item.unit}
            	    	</c:if>
            	    	<c:if test="${ not empty item.room}">
            	        	-${item.room}
            	    	</c:if>
            	    	<c:if test="${ not empty item.userName}">
            	        	-${item.userName}
            	    	</c:if>
            	  </h2> 
               	 	<a href="/designerMeasureTools/showIndex/${orderStrMap[item.orderNo] }">开始测量</a>
            	</li>
            </c:forEach>
        </ul>
           </c:when>
           <c:otherwise>
             列表为空
           </c:otherwise>
        </c:choose>
        
    </div>
</body>
</html>