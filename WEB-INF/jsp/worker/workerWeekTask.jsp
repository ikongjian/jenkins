<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
	<head>
		<meta charset="UTF-8"/>
        <meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0"/>
		<title>一周任务</title>
        <link rel="stylesheet" type="text/css" href="/assets/css/css_wechat.css"/>
       	<link rel="stylesheet" type="text/css" href="/assets/css/css_wechat_6.css" media="screen and (min-width:375px)"/>
		<link rel="stylesheet" type="text/css" href="/assets/css/css_wechat_6plus.css" media="screen and (min-width:414px)"/>
	</head>
	<body>
		<div class="d_task">
	    	<ul>
		    	<c:forEach items="${workerTasks}" var="item">
		    		<li>
		    			<h1>${item.key}</h1>
		    			<c:forEach items="${item.value}" var="complexInfo">
		    				<h2>
				    			<c:if test="${!empty complexInfo.key.communityAddress||!empty complexInfo.key.address}">
					        		<c:choose>  
					        			<c:when test="${empty complexInfo.key.communityAddress&&!empty complexInfo.key.address}">
					        				${complexInfo.key.address} - ${complexInfo.key.customerName}
					        			</c:when>
					        			<c:when test="${empty complexInfo.key.address&&!empty complexInfo.key.communityAddress}">
					        				${complexInfo.key.communityAddress} - ${complexInfo.key.customerName}
					        			</c:when>
					        			<c:when test="${!empty complexInfo.key.address&&!empty complexInfo.key.communityAddress}">
					        				${complexInfo.key.address} - ${complexInfo.key.customerName}
					        			</c:when>
					        		</c:choose>
					        		<span>
										<c:if test="${!empty complexInfo.key.communityAddress||!empty complexInfo.key.address}">
							        		<c:choose>  
							        			<c:when test="${empty complexInfo.key.communityAddress&&!empty complexInfo.key.address}">
							        				${complexInfo.key.address}
							        			</c:when>
							        			<c:when test="${empty complexInfo.key.address&&!empty complexInfo.key.communityAddress}">
							        				${complexInfo.key.communityAddress}
							        			</c:when>
							        			<c:when test="${!empty complexInfo.key.address&&!empty complexInfo.key.communityAddress}">
							        				${complexInfo.key.address}
							        			</c:when>
							        		</c:choose>
			    						</c:if>
									</span>
			    				</c:if>
			    				<c:if test="${empty complexInfo.key.communityAddress&&empty complexInfo.key.address}">
			    					您今日暂未安排任务
			    				</c:if>
			    			</h2>
			    			<p>
			    				<c:forEach items="${complexInfo.value}" var="task" varStatus="taskStatus">
			    					<c:if test="${!empty task}">
				    					<span>
											任务${taskStatus.index+1}：
											<c:if test="${task.executionTime==0}">上午 --</c:if>
											<c:if test="${task.executionTime==1}">下午 --</c:if>
											<c:if test="${task.executionTime==2}">全天 --</c:if>
											${task.name}
										</span>
			    					</c:if>
			    				</c:forEach>
			                </p>
		    			</c:forEach>
		    		</li>
		    	</c:forEach>
	        </ul>
	    </div>
	</body>
</html>