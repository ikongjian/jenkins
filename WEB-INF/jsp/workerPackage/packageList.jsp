<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="com.ikongjian.erp.enums.WorkerPackageStateEnum" %>
<%@ taglib prefix="en" uri="/enumTag" %>
<!DOCTYPE >
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" name="viewport">
<meta content="no-cache" http-equiv="pragma">
<meta content="no-cache" http-equiv="cache-control">
<meta content="0" http-equiv="expires">
<title>任务包管理</title>
<script type="text/javascript">
	function send(url,id,type){
		var startDate = $("#startDate_"+id+"").val();
		var endDate = $("#endDate_"+id+"").val();
		if(startDate==null||startDate.length==0	){
			layer.alert('请填写开始时间！', {
			    skin: 'layui-layer-molv' //样式类名
			    ,closeBtn: 0
			});
			$("#startDate_"+id+"").focus();
			return;
		}
		if(endDate==null||endDate.length==0	){
			layer.alert('请填写结束时间！', {
			    skin: 'layui-layer-molv' //样式类名
			    ,closeBtn: 0
			});
			$("#endDate_"+id+"").focus();
			return;
		}
		var date1 = new Date(startDate.replace(/-/g,"/"));
		var date2 = new Date(endDate.replace(/-/g,"/"));
		if(date1>date2){
			layer.alert('开始时间不能大于结束时间', {
			    skin: 'layui-layer-molv' //样式类名
			    ,closeBtn: 0
			});
			return;
		}
		$.post(url,
			  {
				id:id,
				type:type,
				startDate:startDate,
				endDate:endDate
			  },function(data){
				layer.alert(data.result, {
				    skin: 'layui-layer-molv' //样式类名
				    ,closeBtn: 0
				},function(){
					window.location.reload(true);
				});
		});
	}
</script>
</head>

<body>
    <!--3级页面框架-->
    <div class="right frame">
    	<!--头部-->
    	<header>
        	<h6>任务包管理</h6>
        	<a href="javascript:void(0);" onclick="window.location.href='/package/list'"><img src="/assets-new/img/esc.png"></a>
        </header>
        <div class="content">
        	<div class="detailed detailed_bhsq">
                <p class="p_left"><span>${order.community }${order.building }-${order.unit }-${order.room }-</span>${order.userName }</p>
            </div>
        	<!--任务包管理-->
            <table class="table_1 table_2" width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr class="quote_tr">
                	<th scope="col" width="19%">任务包</th>
                    <th scope="col" width="16%">价格</th>
                    <th scope="col" width="16%">安排开始日期</th>
                    <th scope="col" width="16%">安排结束日期</th>
                    <th scope="col" width="16%">任务包状态</th>
                    <th scope="col" width="17%">操作</th>
				</tr>
				<c:forEach var="item" items="${list }">
	                <tr>        
	                	<td>
	                		<a class="href" href="/package/threePath/packageInfo?packageId=${item.id}">${item.pkgName}</a>
	                	</td>
	                    <td><fmt:formatNumber value="${item.pkgMoney }" pattern="0.00"/>元</td>
	                    <td>
	                    	<c:if test="${empty item.startDate and item.state == 10}">
	                    		<input class="input_tddete" name="startDate" id="startDate_${item.id }" type="date">
	                    	</c:if>
	                    	<c:if test="${not empty item.startDate}">
	                    		<fmt:formatDate value="${item.startDate}" pattern="yyyy-MM-dd"/>
	                    	</c:if>
	                    </td>
	                    <td>
	                    	<c:if test="${empty item.endDate and item.state==10}">
	                    		<input class="input_tddete" name="endDate" id="endDate_${item.id}" type="date">
	                    	</c:if>
	                    	<c:if test="${not empty item.endDate }">
	                    		<fmt:formatDate value="${item.endDate}" pattern="yyyy-MM-dd"/>
	                    	</c:if>
	                    </td>  
	                    <td><en:out enumClass="<%=WorkerPackageStateEnum.class %>" code="${item.state }"/></td>
	                    <td>
	                    	<c:if test="${item.state == 15 }">
	                    		<a href="javascript:void(0);" onclick="send('/package/sendPackage','${item.id}','send')">发送任务包</a>
	                    	</c:if>
	                    	<c:if test="${item.state == 30}">
	                    		<%-- <a href="javascript:void(0);" onclick="send('/package/sendPackage','${item.packageId}','diaodu')">申请调度指派</a> --%>
	                    	</c:if>
	                    	<c:if test="${item.state == 60 }">
	                    		<a href="/package/threePath/packageConfirm?packageId=${item.id}">验收</a>
	                    	</c:if>
	                    </td>
	                </tr>
                </c:forEach>
			</table>
        </div>
    </div>
</body>
</html>
