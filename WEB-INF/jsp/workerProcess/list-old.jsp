<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE >
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" name="viewport">
<meta content="no-cache" http-equiv="pragma">
<meta content="no-cache" http-equiv="cache-control">
<meta content="0" http-equiv="expires">
<title>项目进度</title>
<script type="text/javascript">
	$(function(){
		var unaccept = '${unaccept}';
		if(unaccept!=null&&unaccept.length>0){
			layer.alert("当前项目进度还未验收，请联系质检员！", {
			    skin: 'layui-layer-molv' //样式类名
			    ,closeBtn: 0
			},function(){
				window.location.href="/process/list";
			});
			return;
		}
		var unworking = '${unworking}';
		if(unworking!=null&&unworking.length>0){
			layer.alert("请先在【确认开工】中开工！", {
			    skin: 'layui-layer-molv' //样式类名
			    ,closeBtn: 0
			},function(){
				window.location.href="/process/list";
			});

		}
	})
</script>
</head>

<body>
 	<!--右侧头部-->
 	<header>
     	<h6>项目进度</h6>
       	<input type="hidden" name="navClass" id="navClass" value="nav_a6">
     </header>
     <!--右侧内容-->
     <div class="content">
     	<!--我的项目列表-->
         <table class="table_1" width="100%" border="0" cellspacing="0" cellpadding="0">
         	<tr class="quote_tr">
             	<th scope="col" width="29%">顾客</th>
				<th scope="col" width="15%">实际开工日期</th>
                <th scope="col" width="15%">当前完成进度</th>
                <th scope="col" width="12%">合同工期</th>
                <!-- <th scope="col" width="12%">施工天数</th> -->
                <th scope="col" width="15%">操作</th>
			</tr>
         </table>
         <ul class="percent_ul">
         	<c:forEach var="item" items="${list }">
         	<li>
                <table class="table_1" width="100%" border="0" cellspacing="0" cellpadding="0">
                     <tr>        
                         <td width="29%">
                         	<a class="href" href="/order/threePath/toOrderInfoPage?orderNo=${item.orderNo}">
		            			${item.community }-${item.building }-${item.unit }-${item.room }-${item.userName }
		            		</a>
                         </td>
                         <td width="15%"><fmt:formatDate value="${item.workingDate }" pattern="yyyy-MM-dd"/></td>
                         <td width="15%">
                         	<%-- <c:if test="${empty currentMap[item.orderNo] }">
                         		${temMap[item.orderNo][0].name }
                         	</c:if> --%>
                         	<c:if test="${not empty currentMap[item.orderNo] }">
                         		${currentMap[item.orderNo].name }
                         	</c:if>
                         </td>
                         <td width="12%">${item.workDays }天</td>
                         <!-- <td width="12%">第6天</td> -->
                         <td width="15%">
                             <a href="/process/threePath/toSetProcess?orderNo=${item.orderNo }">进度管理</a>
                             <a href="/process/threePath/toStopProcess?orderNo=${item.orderNo }">项目停工</a>
                         </td>
                     </tr>
                 </table> 
                 <div class="percent">
                    <c:forEach var="tem" items="${temMap[item.orderNo] }" varStatus="status">
                 		<h6>
                 			<c:set var="key" value="${item.orderNo}.${tem.id }"></c:set>
                 			<c:if test="${empty map[key] }">
		                     	 <i><img src="/assets-new/img/j.png"></i>
		                         <span>${tem.name }</span>
		                         <c:if test="${!status.last }">
		                         	<hr>
		                         </c:if>
	                         </c:if>
                 			<c:if test="${not empty map[key] }">
		                     	<i><img src="/assets-new/img/j_hover.png"></i>
		                        <span>${tem.name }<br>完工</span>
		                        <c:if test="${!status.last }">
		                         	<hr class="percent_hr">
		                         </c:if>
	                         </c:if>
	                    </h6>
                      </c:forEach>
                 </div>
         	</li>
         	</c:forEach>
        </ul>   	
    </div>
</body>
</html>
