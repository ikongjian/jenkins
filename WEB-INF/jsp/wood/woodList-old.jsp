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
<title>木作安装列表</title>
</head>

<body>
    	<!--右侧头部-->
    	<header>
        	<h6>木作安装列表</h6>
        </header>
        <!--右侧内容-->
        <div class="content">
        	<!--复核报价单-->
            <table class="table_1" width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr class="quote_tr">
                	<th scope="col" width="34%">顾客</th>
                    <th scope="col" width="17%">实际开工日期</th>
                    <th scope="col" width="17%">计划安装时间</th>
                    <th scope="col" width="17%">确认安装时间</th>
                    <th scope="col" width="15%">操作</th>
				</tr>
				<c:forEach var="item" items="${queryInstallList }">
					<tr>        
	                	<td>
	                		<a class="href" href="/order/threePath/toOrderInfoPage?orderNo=${item.contractNo}">${item.userName }</a>
	                	</td>
	                    <td><fmt:formatDate value="${item.workingDate }" pattern="yyyy-MM-dd"/></td>
	                    <td><fmt:formatDate value="${item.planInstallDate }" pattern="yyyy-MM-dd"/></td>
	                    <td><fmt:formatDate value="${item.confirmInstallDate }" pattern="yyyy-MM-dd"/></td>
	                    <td>
	                    	<c:if test="${empty item.state or item.state <=20 }">
	                    		<a href="/wood/threePath/toApply?installNo=${item.installNo }&orderNo=${item.contractNo}">木作申请</a>
	                    	</c:if>
	                        <a href="/wood/threePath/detail?orderNo=${item.contractNo }">查看</a>
	                    </td>        
	                </tr>
				</c:forEach>
			</table>     	
        </div>
</body>
</html>
