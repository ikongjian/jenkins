<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.ikongjian.erp.enums.ErpContractOrderStatusEnum" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="en" uri="/enumTag" %>
<!DOCTYPE >
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" name="viewport">
<meta content="no-cache" http-equiv="pragma">
<meta content="no-cache" http-equiv="cache-control">
<meta content="0" http-equiv="expires">
<title>签到列表</title>
</head>

<body>
	<!--右侧头部-->
   	<header>
      <h6>现场签到</h6>
     <!--  <a href="#"><img src="/assets-new/img/esc.png"></a> -->
      <input type="hidden" name="navClass" id="navClass" value="nav_a13"/>
   </header>
      <!--右侧内容-->
      <div class="content">
      	<!--我的项目列表-->
          <table class="table_1" width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr class="quote_tr">
              	  <th scope="col" width="25%">顾客</th>
                  <th scope="col" width="10%">面积</th>
                  <th scope="col" width="12%">设计师</th>
                  <th scope="col" width="18.75%">实际开工日期</th>
                  <!-- <th scope="col" width="16.75%">实际竣工日期</th> -->
                  <th scope="col" width="18.75%">状态</th>
                  <th scope="col" width="18.75%">操作</th>
		      </tr>
		      <c:forEach var="item" items="${resList }">
		      	<tr>
              	  <td>
              	  	<a class="href" href="/order/threePath/toOrderInfoPage?orderNo=${item.orderNo }">
            			${item.community }-${item.building }-${item.unit }-${item.room }-${item.userName }
            		</a>
              	  </td>
                  <td>${item.area }</td>
                  <td>${item.designer }</td>
                  <td><fmt:formatDate value="${item.workingDate }" pattern="yyyy-MM-dd"/></td>
                  <%-- <td><fmt:formatDate value="${item.projectCheckDate }" pattern="yyyy-MM-dd"/></td> --%>
                  <td><en:out code="${item.orderStatesNo }" enumClass="<%=ErpContractOrderStatusEnum.class %>"/></td>
                  <td>
	                  <c:if test="${item.sign==true }">已签到</c:if>
	                  <c:if test="${item.sign!=true }">
	                  	  <a href="/pmProject/threePath/toOrderSign?orderNo=${item.orderNo }">签到</a>
	                  </c:if>
                  	  <a href="/pmProject/threePath/signList?orderNo=${item.orderNo }">签到列表</a>
                  </td>
                </tr>
		      </c:forEach>
	</table>     	
   </div>
</body>
</html>
