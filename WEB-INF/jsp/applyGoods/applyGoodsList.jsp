<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.ikongjian.erp.enums.ErpContractOrderStatusEnum" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="en" uri="/enumTag" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<%@ include file="/WEB-INF/jsp/layout/cssjs.jsp"%>
    <title>补货申请</title>
</head>

<body>
	<%@ include file="/WEB-INF/jsp/layout/menu.jsp"%>
    <!--右侧内容框架-->
    <div class="content">
        <!--任务包施工-->
        <div class="title">
            <h2>补货申请</h2>
            <i><img src="/assets-new/4th/img/nav_0.png"></i>
        </div>
        <hr class="content_hr">
        <table class="table_list" border="0" cellspacing="0" cellpadding="0">
            <tbody>
                <tr class="table_listTr">
                   <th scope="col" width="35%">顾客</th>
			       <th scope="col" width="25%">合同开工时间</th>
			       <th scope="col" width="25%">状态</th>
			       <th scope="col" width="15%">操作</th>
                </tr>
                <c:forEach var="working" items="${workingList}">
			       <tr>        
		            	<td class="text_left">
              	  	 		<a class="td_none" href="/order/threePath/toOrderInfoPage?orderNo=${working.orderNo }">
		            			${working.community }${working.building }-${working.unit }-${working.room }-${working.userName }
		            		</a>
		            	</td>
		                <td><fmt:formatDate value="${working.workingDate }" pattern="yyyy-MM-dd"/></td>
		                <td><en:out code="${working.orderStatesNo }" enumClass="<%=ErpContractOrderStatusEnum.class %>"/></td>
		                <td>
			                <a class="td_an" href="/applyGoods/threePath/toApplyBill?orderNo=${working.orderNo }&werks=${working.werks}&cache=del">补货申请</a>
			                <a class="td_an" href="/applyGoods/threePath/toApplyGoodsRecordList?orderNo=${working.orderNo }&werks=${working.werks}">补货记录</a>
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