<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
	<head>
		<meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0">
		<title>明日任务</title>
        <link rel="stylesheet" type="text/css" href="/assets/css/css_wechat.css">
       	<link rel="stylesheet" type="text/css" href="/assets/css/css_wechat_6.css" media="screen and (min-width:375px)"/>
		<link rel="stylesheet" type="text/css" href="/assets/css/css_wechat_6plus.css" media="screen and (min-width:414px)"/>
	</head>
	<body>
		<c:forEach items="${workerTasks}" var="item">
			<div class="j_work m_task">
				<c:if test="${!empty item.key.communityAddress||!empty item.key.address}">
					<h2>
						<c:choose>  
		        			<c:when test="${empty item.key.communityAddress&&!empty item.key.address}">
		        				${item.key.address} - ${item.key.customerName}
		        			</c:when>
		        			<c:when test="${empty item.key.address&&!empty item.key.communityAddress}">
		        				${item.key.communityAddress} - ${item.key.customerName}
		        			</c:when>
		        			<c:when test="${!empty item.key.address&&!empty item.key.communityAddress}">
		        				${item.key.address} - ${item.key.customerName}
		        			</c:when>
		        		</c:choose>
					</h2>
				</c:if>
				<c:if test="${!empty item.key.communityAddress||!empty item.key.address}">
					<div class="j_address">
						<c:choose>  
		        			<c:when test="${empty item.key.communityAddress&&!empty item.key.address}">
		        				${item.key.address} - ${item.key.customerName}
					            <a href="http://api.map.baidu.com/geocoder?address=${item.key.address}&output=html" class="baidu_navi" data-address="${item.key.address}">点击查询乘车路线</a>
		        			</c:when>
		        			<c:when test="${empty item.key.address&&!empty item.key.communityAddress}">
		        				${item.key.communityAddress} - ${item.key.customerName}
		        				<a href="http://api.map.baidu.com/geocoder?address=${item.key.communityAddress}&output=html" class="baidu_navi" data-address="${item.key.communityAddress}">点击查询乘车路线</a>
		        			</c:when>
		        			<c:when test="${!empty item.key.address&&!empty item.key.communityAddress}">
		        				${item.key.address} - ${item.key.customerName}
		        				<a href="http://api.map.baidu.com/geocoder?address=${item.key.communityAddress}&output=html" class="baidu_navi" data-address="${item.key.communityAddress}">点击查询乘车路线</a>
		        			</c:when>
		        		</c:choose>
					</div>
				</c:if>
		        <h3>施工任务</h3>
		        <ul>
			        <c:if test="${!empty item.value}">
				        <c:forEach items="${item.value}" var="task" varStatus="itemStatus">
							<li>
								任务${itemStatus.index+1}：
								<c:if test="${task.executionTime==0}">上午 --</c:if>
								<c:if test="${task.executionTime==1}">下午  --</c:if>
								<c:if test="${task.executionTime==2}">全天  --</c:if>
								${task.name}
							</li>
						</c:forEach>
			        </c:if>
			        <c:if test="${empty item.value}">
			        	<li>您今日暂未安排任务</li>
			        </c:if>
		        </ul>
		    </div>
		</c:forEach>
	</body>
</html>