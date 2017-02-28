<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
    <title>待办任务</title>
</head>
<body>
        <!--右侧头部-->
        <header>
            <h6>待办任务</h6>
        </header>
        <!--右侧内容-->
        <div class="content">
            <div class="ned_tab">
                <p class="ned_p">待开工<span>${workList.size() }</span></p>
                <p>待中期验收<span>${zqList.size() }</span></p>
                <p>待竣工验收<span>${jgList.size() }</span></p>
            </div>
            <!--待开工-->
            <table class="table_1" width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr class="quote_tr">
                    <th scope="col" width="35%">顾客</th>
                    <th scope="col" width="20%">合同开工日期</th>
                    <th scope="col" width="20%">预计开工日期</th>
                    <th scope="col" width="10%">合同工期</th>
                    <th scope="col" width="15%">操作</th>
                </tr>
                <c:forEach var="item" items="${workList }">
                	<tr>
	                    <td>
	                    	<%-- <a href="/order/threePath/toOrderInfoPage?orderNo=${item.orderNo }" class="color_666"> --%>
                   			${item.community }-${item.building }-${item.unit }-${item.room }-${item.userName }
	                    </td>
	                    <td><fmt:formatDate value="${item.workingDate }" pattern="yyyy-MM-dd"/></td>
	                    <td><fmt:formatDate value="${item.planWorkingDate }" pattern="yyyy-MM-dd"/></td>
	                    <td>${item.workDays }天</td>
	                    <td><a href="/confirmWorkDate/threePath/confirmWorkDatePage?orderNo=${item.orderNo }">开工</a></td>
	                </tr>
                </c:forEach>
            </table>
            <!--待中期验收-->
            <table class="table_1" width="100%" border="0" cellspacing="0" cellpadding="0" style="display:none;">
                <tr class="quote_tr">
                    <th scope="col" width="35%">顾客</th>
                    <th scope="col" width="20%">实际开工日期</th>
                    <th scope="col" width="20%">合同工期</th>
                    <th scope="col" width="10%">面积</th>
                    <th scope="col" width="15%">操作</th>
                </tr>
                <c:forEach var="item" items="${zqList }">
                	<tr>
	                    <td>
	                    	<%-- <a href="/order/threePath/toOrderInfoPage?orderNo=${item.orderNo }" class="color_666"> --%>
                   			${item.community }-${item.building }-${item.unit }-${item.room }-${item.userName }
	                    </td>
	                    <td><fmt:formatDate value="${item.workingDate }" pattern="yyyy-MM-dd"/></td>
	                    <td>${item.workDays }天</td>
	                    <td>${item.area }</td>
	                    <td><a href="/process/threePath/toSetProcess?orderNo=${item.orderNo }">提报中期验收</a></td>
	                </tr>
                </c:forEach>
            </table>
            <!--待竣工验收-->
            <table class="table_1" width="100%" border="0" cellspacing="0" cellpadding="0" style="display:none;">
                <tr class="quote_tr">
                    <th scope="col" width="35%">顾客</th>
                    <th scope="col" width="13%">合同开工日期</th>
                    <th scope="col" width="13%">合同竣工日期</th>
                    <th scope="col" width="13%">实际开工日期</th>
                    <th scope="col" width="11%">合同工期</th>
                    <th scope="col" width="15%">操作</th>
                </tr>
                <c:forEach var="item" items="${jgList }">
                	<tr>
	                    <td>
	                    	<%-- <a href="/order/threePath/toOrderInfoPage?orderNo=${item.orderNo }" class="color_666"> --%>
                   			${item.community }-${item.building }-${item.unit }-${item.room }-${item.userName }
	                    </td>
	                    <td><fmt:formatDate value="${item.planWorkingDate }" pattern="yyyy-MM-dd"/></td>
	                    <td><fmt:formatDate value="${item.innerCheckDate }" pattern="yyyy-MM-dd"/></td>
	                    <td><fmt:formatDate value="${item.workingDate }" pattern="yyyy-MM-dd"/></td>
	                    <td>${item.workDays }天</td>
	                    <td><a href="/process/threePath/toSetProcess?orderNo=${item.orderNo }">提报竣工验收</a></td>
	                </tr>
                </c:forEach>
            </table>
    	</div>
</body>
</html>