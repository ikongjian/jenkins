<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
	<head>
		<meta charset="UTF-8"/>
        <meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0"/>
		<title>今日任务</title>
        <link rel="stylesheet" type="text/css" href="/assets/css/css_wechat.css"/>
       	<link rel="stylesheet" type="text/css" href="/assets/css/css_wechat_6.css" media="screen and (min-width:375px)"/>
		<link rel="stylesheet" type="text/css" href="/assets/css/css_wechat_6plus.css" media="screen and (min-width:414px)"/>
	</head>
	<body>
		<header>
	    	<i class="icon">
		    	<c:forEach items="${workerTasks}" var="item" begin="0" end="0">
					<img src="${item.key.imgUrl}"/>
				</c:forEach>
	    	</i>
	        <h1>
	        	<c:forEach items="${workerTasks}" var="item" begin="0" end="0">
					${item.key.workerName}
				</c:forEach>
				<span>
					<c:forEach items="${workerTasks}" var="item" begin="0" end="0">
						${item.key.workerLevel} ${item.key.workerCategory}
					</c:forEach>
				</span>
			</h1>
	    </header>
	    <div class="j_work">
	    	<h2>今日任务</h2>
	    	<c:forEach items="${workerTasks}" var="item">
	    		<c:if test="${!empty item.key.communityAddress||!empty item.key.address}">
		    		<div class="j_address">
			        	<p>
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
			        	</p>
			        </div>
	    		</c:if>
	        	<ul>
	        		<c:if test="${!empty item.value}">
			    		<c:forEach items="${item.value}" var="task" varStatus="itemStatus">
				    		<li>
				    			<h3>任务${itemStatus.index+1}</h3>
				    			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				                  	<tr>
				    					<td scope="col" class="j_task" data-worktime="${task.executionTime}" data-id="${task.id}" data-taskid="${task.taskid}"
				    					    data-customername="${item.key.customerName}" data-contractno="${item.key.contractNo}"
				    					    data-membercode="${item.key.memberCode }">${task.name}</td>
				  					</tr>
				                </table>
				                <!-- <a class="j_workxq" href="#">查看详情</a>
				                <a id="ok_shooting">确认完工</a> -->
				    		</li>
			    		</c:forEach>
		    		</c:if>
		    		<c:if test="${empty item.value}">
		    			<li>
		    				<table width="100%" border="0" cellspacing="0" cellpadding="0">
			                  	<tr align="center">
			    					<td scope="col">您今日暂未安排任务</td>
			  					</tr>
			                </table>
		                </li>
		    		</c:if>
		    	</ul>
	    	</c:forEach>
	    </div>
	    <div class="j_see">
	    	<a href="/weixinUtilController/workerTomorrowTask?weixin=${weixin}" class="j_see1">明天任务</a>
	    	<a href="/weixinUtilController/workerWeekTask?weixin=${weixin}" class="j_see2">一周任务</a>
	    </div>
	    <div class="j_tel">
	    	<c:forEach items="${workerTasks}" var="item" begin="0" end="0">
				<a href="tel:${item.key.cellPhone}">联系项目经理</a>
			</c:forEach>
	    </div>
	    <input type="hidden" id="weixin" value="${weixin}"/>
    </body>
</html>
<script type="text/javascript" src="/assets/js/jquery-1.11.3.min.js"></script>
<script type="text/javascript">
	$(function() {
		$(".j_task").on("click",function() {
			var contractNo=$(this).data("contractno");
			var taskName=$(this).html().trim();
			//拍照任务
			if(taskName=="拍照") {
				var weixin=$("#weixin").val();
				var id=$(this).data("id");
				window.location.href="/weixinUtilController/workerUploadImgUI?contractNo="+contractNo+"&id="+id+"&weixin="+weixin;
			} else {
				var taskid=$(this).data("taskid");
				var workTime=$(this).data("worktime");
				var address=encodeURI(encodeURI($(".baidu_navi").data("address")));
				var customerName=encodeURI(encodeURI($(this).data("customername")));
				var projectId=encodeURI(encodeURI($(this).data("contractno")));
				var memberCode=encodeURI(encodeURI($(this).data("membercode")));
				window.location.href="/weixinUtilController/taskDetail?id="+taskid+
				    "&address="+address+"&customerName="+customerName+"&workTime="+workTime+"&projectId="+projectId+"&memberCode="+memberCode;
			}
		});
	});
</script>