<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.ikongjian.erp.enums.WorkerCompleteEnum" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="en" uri="/enumTag"%>
<title>查看【竣工申请】进程</title>
</head>

<%@ include file="/WEB-INF/jsp/layout/cssjs.jsp"%>

<div class="content">
        <div class="title">
            <h2>查看竣工申请进程</h2>
            <a href="/workComplete/toProjectCompleteList"><img src="/assets-new/img/esc.png"></a>
        </div>
        <hr class="content_hr">
        <div class="formDetail">
          <c:forEach var="log" items="${logList }" varStatus="index">
            <c:if test="${log.checkStatus == 0}">
	            <h4>${log.title}</h4>
	            <ul>
	                <li>
	                    <span>申请日期</span>
	                    <p><fmt:formatDate value="${log.checkTime }" pattern="yyyy-MM-dd"/></p>
	                </li>
	            </ul>
             </c:if>
             
             <c:if test="${log.checkStatus == 1 or log.checkStatus == 2}">
	            <h4>${log.title }</h4>
	            <ul>
	                <li>
	                    <span>审核日期</span>
	                    <p><fmt:formatDate value="${log.checkTime }" pattern="yyyy-MM-dd"/></p>
	                </li>
	                <li>
	                    <span>审核人</span>
	                    <p>${memMap[index.index] }</p>
	                </li>
	                <li>
	                    <span>审核结果</span>
	                    <p><en:out code="${log.checkStatus}" enumClass="<%=WorkerCompleteEnum.class %>"/></p>
	                </li>
	                <li>
	                    <span>审核原因</span>
	                    <p>
	                        <c:if test="${log.checkStatus == 2}">
	                        	已申请通过
	                        </c:if>
		                    <c:if test="${log.checkStatus == 1}">
		                        ${log.reason}
		                    </c:if>
	                    </p>
	                </li>
	            </ul>
              </c:if>
             
              <c:if test="${log.checkStatus >= 3 }">
	             <h4>${log.title }</h4>
	             <ul>
	                <li>
	                    <span>操作日期</span>
	                    <p><fmt:formatDate value="${log.checkTime }" pattern="yyyy-MM-dd"/></p>
	                </li>
	                <li>
	                    <span>操作人</span>
	                    <p>${memMap[index.index] }</p>
	                </li>
	             </ul>
              </c:if>

            </c:forEach>
           
        </div>
    </div>
    <!--右侧内容框架结束-->
    <!--本页JS-->
    <script>
        $(function () {
            //隐藏返回按钮
            $(".nav").css("left","-16%");
            $(".nav").removeClass("animate");
            $(".content,.title").css("width","100%");
        })
    </script>

