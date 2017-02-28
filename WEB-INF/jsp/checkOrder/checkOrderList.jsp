<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<%@ include file="/WEB-INF/jsp/layout/cssjs.jsp"%>
    <title>复核报价单</title>
</head>
<body>
	<%@ include file="/WEB-INF/jsp/layout/menu.jsp"%>
	<!--侧面导航结束-->
    <!--右侧内容框架-->
    <div class="content">
    	   <!--辅料核量-->
		   <div class="title">
		       <h2>复核报价单</h2>
		       <i><img src="/assets-new/4th/img/nav_0.png"></i>
		       <%--<a href="javascript:void(0);"><img src="/assets-new/4th/img/esc.png"></a>--%>
		   </div>
		   <hr class="content_hr">
		   <table class="table_list" border="0" cellspacing="0" cellpadding="0">
		    <tbody>
		        <tr class="table_listTr">
		            <th scope="col" width="35%">顾客</th>
					<th scope="col" width="20%">预计开工时间</th>
					<th scope="col" width="20%">合同工期(天)</th>
					<th scope="col" width="10%">版本号</th>
					<th scope="col" width="15%">操作</th>
		        </tr>
		        <c:forEach var="item" items="${reviewList }">
					<tr>
						<td class="text_left">
							<a class="td_none" href="/order/threePath/toOrderInfoPage?orderNo=${item.ordersNo}">
								${item.community }-${item.building }-${item.unit }-${item.room }-${item.customName }
							</a>
						</td>
						<td><fmt:formatDate value="${item.planWorkingDate }" pattern="yyyy-MM-dd"/></td>
						<td>
							${item.workDays }
						</td>
						<td>${item.version }</td>
						<td><a class="td_an" href="/review/threePath/toReviewFuCaiListPage?ternr=${item.ordersNo}&vbeln=${item.vbeln}&sdabw=${item.version}&areaCode=${item.areaCode}&projectManagerName=${item.projectManagerName}&telephone=${item.telephone}&flag=first">辅料核量</a></td>
					</tr>
				</c:forEach>
		    </tbody>
		  </table>
    </div>
    <script>
        $(function () {
            //隐藏返回按钮
            $(".title a").hide()
        })
    </script>
    
</body>
</html>