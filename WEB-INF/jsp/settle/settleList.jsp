<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.ikongjian.erp.enums.PMSettleStateEnum" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="en" uri="/enumTag"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <%@ include file="/WEB-INF/jsp/layout/cssjs.jsp"%>
    <title>结算列表</title>
</head>

<body>
	<%@ include file="/WEB-INF/jsp/layout/menu.jsp"%>
    <!--右侧内容框架-->
    <div class="content">
        <div class="title">
            <h2>结算列表</h2>
            <i><img src="/assets-new/4th/img/nav_0.png"></i>
            <%--<a href="#"><img src="/assets-new/4th/img/esc.png"></a>--%>
        </div>
        <hr class="content_hr">
        <table class="table_list" border="0" cellspacing="0" cellpadding="0">
            <tbody>
                <tr class="table_listTr">
                     <th scope="col" width="25%">顾客</th>
	                 <th scope="col" width="15%">实际开工日期</th>
	                 <th scope="col" width="15%">实际竣工日期</th>
	                 <th scope="col" width="14%">实际结算金额</th>
	                 <th scope="col" width="16%">状态</th>
	                 <th scope="col" width="15%">操作</th>
                </tr>
                <c:forEach var="item" items="${settleList }">
					<tr>        
		             	<td class="text_left">
              	  	    	<a class="td_none" href="/order/threePath/toOrderInfoPage?orderNo=${item.orderNo}">
								${item.community }-${item.building }-${item.unit }-${item.room }-${item.customName }
							</a>
		             	</td>
		                 <td><fmt:formatDate value="${item.workingDate }" pattern="yyyy-MM-dd"/></td>
		                 <td><fmt:formatDate value="${item.projectCheckDate }" pattern="yyyy-MM-dd"/></td>
		                 <td>
		                 	<c:if test="${!empty item.totalMoney }">
		                 		<fmt:formatNumber value="${item.totalMoney }" pattern="00.00"/>
		                 	</c:if>
		                 </td>
		                 <td class="colorff0000">
		                 	<en:out enumClass="<%=PMSettleStateEnum.class%>" code="${item.state }"></en:out>
		                 </td>
		                 <td>
		                 	<c:if test="${item.state == 30 }">
								<a class="td_an" href="/settle/threePath/toDispaterCard?orderNo=${item.orderNo }&settleNo=${item.settleNo}&flag=first">分配打款明细</a>
		                 	</c:if>
		                 	<c:if test="${item.state == 40 }">
								<a class="td_an" href="/settle/threePath/toDispaterCard?orderNo=${item.orderNo }&settleNo=${item.settleNo}&flag=first">修改打款明细</a>
		                 	</c:if>
		                 	<c:if test="${item.state >= 50 }">
								<a class="td_an" href="/settle/threePath/toDispaterCard?orderNo=${item.orderNo }&settleNo=${item.settleNo}&flag=show">查看打款明细</a>
		                 	</c:if>
		                     <a class="td_an" href="/settle/threePath/settleDetail?settleNo=${item.settleNo}">查看结算单</a>
		                     <a class="td_an" href="/workComplete/threePath/toWorkCompleteInfo?orderNo=${item.orderNo }">查看进程</a>
		                 </td>        
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