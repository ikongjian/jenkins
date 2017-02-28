<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE >
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" name="viewport">
<meta content="no-cache" http-equiv="pragma">
<meta content="no-cache" http-equiv="cache-control">
<meta content="0" http-equiv="expires">
<title>补货申请单列表</title>
</head>

<body>
    <!--3级页面框架-->
    <div class="right frame">
    	<!--头部-->
    	<header>
        	<h6>木作安装详情</h6>
        	<a href="/wood/woodList"><img src="/assets-new/img/esc.png"></a>
        </header>
        <div class="content">
        	<!--补货申请单列表-->
            <table class="table_1 table_2" width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr class="quote_tr">
                	<th scope="col" width="20%">分类</th>
                    <th scope="col" width="16%">计划安装时间</th>
                    <th scope="col" width="16%">确认安装时间</th>
                    <th scope="col" width="16%">安装队长</th>
                    <th scope="col" width="16%">联系电话</th>
                    <th scope="col" width="16%">安装状态</th>
				</tr>
				<!-- 1派工单2CAD/BIM报价单3变更单4开工单5木作正单6木作特单7木作补单8验收单 
				9垭口特单10台面安装单11木作收尾单12台盆特单13壁纸特单14主材一次15沙子水泥16地板安装单 -->
				<c:forEach var="item" items="${queryOrderProMg }">
					<tr>        
	                	<td>
	                		<c:if test="${item.workorderType == '1' }">派工单</c:if>
	                		<c:if test="${item.workorderType == '2' }">CAD/BIM报价单</c:if>
	                		<c:if test="${item.workorderType == '3' }">变更单</c:if>
	                		<c:if test="${item.workorderType == '4' }">开工单</c:if>
	                		<c:if test="${item.workorderType == '5' }">木作正单</c:if>
	                		<c:if test="${item.workorderType == '6' }">木作特单</c:if>
	                		<c:if test="${item.workorderType == '7' }">木作补单</c:if>
	                		<c:if test="${item.workorderType == '8' }">验收单</c:if>
	                		<c:if test="${item.workorderType == '9' }">垭口特单</c:if>
	                		<c:if test="${item.workorderType == '10' }">台面安装单</c:if>
	                		<c:if test="${item.workorderType == '11' }">木作收尾单</c:if>
	                		<c:if test="${item.workorderType == '12' }">台盆特单</c:if>
	                		<c:if test="${item.workorderType == '13' }">壁纸特单</c:if>
	                		<c:if test="${item.workorderType == '14' }">主材一次</c:if>
	                		<c:if test="${item.workorderType == '15' }">沙子水泥</c:if>
	                		<c:if test="${item.workorderType == '16' }">地板安装单</c:if>
	                	</td>
	                    <td><fmt:formatDate value="${item.planInstallDate }" pattern="yyyy-MM-dd"/></td>
	                    <td><fmt:formatDate value="${item.confirmInstallDate }" pattern="yyyy-MM-dd"/></td>
	                    <td>${item.installManager}</td>
	                    <td>${item.installManagerPhone }</td>       
	                    <td>
	                    	<c:if test="${item.state == 10 }">创建</c:if>
	                    	<c:if test="${item.state == 20 }">下达</c:if>
	                    	<c:if test="${item.state == 30 }">完成</c:if>
	                    	<c:if test="${item.state == 40 }">部分验收</c:if>
	                    </td> 
	                </tr>
				</c:forEach>
			</table>
        </div>
    </div>
</body>
</html>
