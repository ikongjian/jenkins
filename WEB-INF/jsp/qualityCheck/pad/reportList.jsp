<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="en" uri="/enumTag"%>

<head>
<title>质检报告列表</title>
<%@ include file="/WEB-INF/jsp/layout/cssjs.jsp"%>
</head>
<body>
        <div class="content">
	        <div class="title">
	            <h2>质检报告列表</h2>
	            <a href="/check/list"><img src="/assets-new/4th/img/esc.png"></a>
	        </div>
	        <hr class="content_hr">
        	<!--质检报告列表-->
            <table class="table_list" border="0" cellspacing="0" cellpadding="0">
               <tbody>
                <tr class="table_listTr">
                	<th scope="col" width="5%">序号</th>
                    <th scope="col" width="20%">顾客</th>
                    <th scope="col" width="10%">检查类型</th>
                    <th scope="col" width="10%">质检员</th>
                    <th scope="col" width="10%">检查人</th>
                    <th scope="col" width="15%">质检日期</th>
                    <th scope="col" width="10%">实际得分</th>
                    <th scope="col" width="10%">复检次数</th>
                    <th scope="col" width="10%">操作</th>
				</tr>
				<c:forEach var="item" items="${qualityList }" varStatus="index">
                <tr>        
                	<td>${index.index+1 }</td>
                    <td>${order.community }-${order.building }-${order.unit }-${order.room }-${order.userName }</td>
                    <td>
                    	<c:if test="${item.type == 10 }">巡检</c:if>
                    	<c:if test="${item.type == 20 }">约检</c:if>
                    </td>
                    <td>${order.qualityChecker }</td>
                    <td>${checkerMap[item.finishMancode] }</td>
                    <td><fmt:formatDate value="${item.updateTime }" pattern="yyyy-MM-dd"/></td>
                    <td>
                    	<c:if test="${empty map[item.id] }">0</c:if><c:if test="${not empty map[item.id] }">${map[item.id] }</c:if>/<c:if test="${empty totalScoreMap[item.id] }">0</c:if><c:if test="${not empty totalScoreMap[item.id] }">${totalScoreMap[item.id] }</c:if>
                    </td>
                    <td>
                        <c:if test="${item.fjCount>0}">
                            <a class="fj_count" href="/check/threePath/fjList?id=${item.id}&orderNo=${orderNo}">${item.fjCount}</a>
                        </c:if>
                        <c:if test="${item.fjCount==0}">
                            0
                        </c:if>
                    </td>
                    <td><a class="td_an" href="/check/threePath/checkDetial?id=${item.id }&score=<c:if test="${empty map[item.id] }">0</c:if><c:if test="${not empty map[item.id] }">${map[item.id] }</c:if>/<c:if test="${empty totalScoreMap[item.id] }">0</c:if><c:if test="${not empty totalScoreMap[item.id] }">${totalScoreMap[item.id] }</c:if>">报告详情</a></td>
                </tr>
                </c:forEach>
                
                </tbody>
			</table>
            <!-- <input class="ok" onclick="window.location.href='/check/list'" type="button" value="返回"> -->
        </div>
 
</body>
<script type="text/javascript">
    $(function () {
        //隐藏返回按钮
        $(".nav").css("left","-16%");
        $(".nav").removeClass("animate");
        $(".content,.title").css("width","100%");
    });
</script>


