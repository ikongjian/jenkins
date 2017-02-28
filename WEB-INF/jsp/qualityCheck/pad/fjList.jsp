<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<head>
	<%@ include file="/WEB-INF/jsp/layout/cssjs.jsp"%>
    <title>复检报告列表</title>
</head>

<body>
    <div class="content" style="width:100%;">
      <div class="projectForm">
        <div class="title">
            <h2>复检报告列表</h2>
	        <a href="javascript:void(0);" onclick="window.history.go(-1);"><img src="/assets-new/4th/img/esc.png"></a>
        </div>
        <hr class="content_hr">
        <table class="table_list" border="0" cellspacing="0" cellpadding="0">
            <tbody>
                <tr class="table_listTr">
                	<th scope="col" width="10%">序号</th>
                    <th scope="col" width="25%">顾客</th>
                    <th scope="col" width="10%">检查类型</th>
                    <th scope="col" width="10%">质检员</th>
                    <th scope="col" width="10%">检查人</th>
                    <th scope="col" width="15%">质检日期</th>
                    <th scope="col" width="10%">实际得分</th>
                    <th scope="col" width="10%">操作</th>
                </tr>
                
                <c:forEach var="item" items="${qualityList }" varStatus="index">
	              <tr>        
	                 <td  class="text_left">${index.index+1 }</td>
                     <td>${order.community }-${order.building }-${order.unit }-${order.room }-${order.userName }</td>
                     <td>
                    	<c:if test="${item.type == 30 }">线上复检</c:if>
                    	<c:if test="${item.type == 40 }">现场复检</c:if>
                     </td>
                     <td>${order.qualityChecker }</td>
                     <td>${checkerMap[item.finishMancode] }</td>
                     <td><fmt:formatDate value="${item.updateTime }" pattern="yyyy-MM-dd"/></td>
                     <td>
                    	 <c:if test="${empty map[item.id] }">0</c:if><c:if test="${not empty map[item.id] }">${map[item.id] }</c:if>/<c:if test="${empty totalScoreMap[item.id] }">0</c:if><c:if test="${not empty totalScoreMap[item.id] }">${totalScoreMap[item.id] }</c:if>
                     </td>
                     <td><a class="td_an" href="/check/threePath/checkDetial?id=${item.id }&score=<c:if test="${empty map[item.id] }">0</c:if><c:if test="${not empty map[item.id] }">${map[item.id] }</c:if>/<c:if test="${empty totalScoreMap[item.id] }">0</c:if><c:if test="${not empty totalScoreMap[item.id] }">${totalScoreMap[item.id] }</c:if>">报告详情</a></td>
	              </tr> 
                </c:forEach>
              
            </tbody>
        </table>
        
	        <%--<div class="submitWrap">
                    <button id="submitId" class="inputSubmit" onclick="window.history.go(-1);">返回</button>
	        </div>--%>
        </div>
    </div>
</body>

