<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html> 
<html lang="en">
<head>
	<%@ include file="/WEB-INF/jsp/layout/cssjs.jsp"%>
    <title>质检报告</title>
</head>

<body>
	<%@ include file="/WEB-INF/jsp/layout/menu.jsp"%>
    <!--右侧内容框架-->
    <div class="content">
        <!--任务包施工-->
        <div class="title">
            <h2>质检报告</h2>
            <i><img src="/assets-new/4th/img/nav_0.png"></i>
            <%--<a href="#"><img src="/assets-new/4th/img/esc.png"></a>--%>
        </div>
        <hr class="content_hr">
        <table class="table_list" border="0" cellspacing="0" cellpadding="0">
            <tbody>
                <tr class="table_listTr">
                  <th scope="col" width="35%">顾客</th>
                  <th scope="col" width="20%">实际开工日期</th>
                  <th scope="col" width="20%">报告数量</th>
                  <th scope="col" width="10%">质检员</th>
                  <th scope="col" width="15%">操作</th>
                </tr>
                <c:forEach var="item" items="${list }">
	              <tr>        
	              	  <td class="text_left">
              	  	 	<a class="td_none" href="/order/threePath/toOrderInfoPage?orderNo=${item.orderNo }">
	              	  	  ${item.community }-${item.building }-${item.unit }-${item.room }-${item.userName }
	              	    </a>
	              	  </td>
	                  <td><fmt:formatDate value="${item.workingDate }" pattern="yyyy-MM-dd"/></td>
	                  <td>${map[item.orderNo] }</td>
	                  <td>${item.qualityChecker }</td>
	                  <td><a class="td_an" href="/check/threePath/reportList?orderNo=${item.orderNo }">报告列表</a></td>        
	              </tr> 
              </c:forEach>
            </tbody>
        </table>
    </div>
    <!--右侧内容框架结束-->
    <!--本页JS-->
    <script>
        $(function () {
            //隐藏返回按钮
            $(".title a").hide()
        })
    </script>
</body>

</html>