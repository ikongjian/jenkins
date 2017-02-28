<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.ikongjian.erp.enums.WorkerCompleteEnum"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="en" uri="/enumTag"%>
<!DOCTYPE >
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" name="viewport">
		<meta content="no-cache" http-equiv="pragma">
		<meta content="no-cache" http-equiv="cache-control">
		<meta content="0" http-equiv="expires">
		<title>我的项目</title>
	</head>
	<body>
		<!--右侧头部-->
		<header>
			<h6>我的项目列表</h6>
			<!-- <a href="#"><img src="/assets-new/img/esc.png"></a> -->
			<input type="hidden" name="navClass" id="navClass" value="nav_a15" />
		</header>
		<!--右侧内容-->
		<div class="content">
			<!--我的项目列表-->
			<table class="table_1" width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr class="quote_tr">
					<th scope="col" width="25%">顾客</th>
					<th scope="col" width="15%">合同开工日期</th>
					<th scope="col" width="15%">合同竣工日期</th>
					<th scope="col" width="15%">实际开工日期</th>
					<th scope="col" width="15%">结算状态</th>
					<th scope="col" width="15%">操作</th>
				</tr>
				<c:forEach var="working" items="${workingList }">
					<tr>
						<td><a class="href" href="/order/threePath/toOrderInfoPage?orderNo=${working.orderNo }"> ${working.community }${working.building }-${working.unit }-${working.room }-${working.userName }
						</a></td>
						<td><fmt:formatDate value="${working.planWorkingDate }" pattern="yyyy-MM-dd" /></td>
						<td><fmt:formatDate value="${working.planCompleteDate }" pattern="yyyy-MM-dd" /></td>
						<td><fmt:formatDate value="${working.workingDate }" pattern="yyyy-MM-dd" /></td>
						<td><c:if test="${working.orderStatesNo != '170' or working.orderStatesNo != '190' or working.orderStatesNo != '191'}">
								<en:out code="${working.orderStatesNo }" enumClass="<%=WorkerCompleteEnum.class %>" />
							</c:if></td>
						<td>
							<c:choose>
								<c:when test="${pmAreaCode=='101'}">
									<c:if test="${working.orderStatesNo == '170' or working.orderStatesNo == '190' or working.orderStatesNo == '191' }">
										<a href="javascript:void(0);" data-orderno="${working.orderNo}" class="apply_complete">申请竣工</a>
									</c:if> 
									<c:if test="${working.orderStatesNo == '1'||working.orderStatesNo == '3'}">
										<a href="javascript:void(0);" data-orderno="${working.orderNo}" data-bohui="bohui" class="apply_complete">申请竣工</a>
									</c:if> 
								</c:when>
								<c:otherwise>
									<c:if test="${working.orderStatesNo == '170' or working.orderStatesNo == '190' or working.orderStatesNo == '191' }">
				                  		<a href="/workComplete/threePath/toWorkComplete?orderNo=${working.orderNo }">申请竣工</a>
				                  	</c:if>
				                  	<c:if test="${working.orderStatesNo == '1'||working.orderStatesNo == '3'}">
				                  		<a href="/workComplete/threePath/toWorkComplete?orderNo=${working.orderNo }&bohuiFlag=bohui">申请竣工</a>
				                  	</c:if>
								</c:otherwise>
							</c:choose>
							<c:if test="${working.orderStatesNo == '0' or working.orderStatesNo == '1' or working.orderStatesNo == '2'  }">
								<a href="/workComplete/threePath/toWorkCompleteInfo?orderNo=${working.orderNo }">查看进程</a>
							</c:if>
						</td>
					</tr>
				</c:forEach>
			</table>
		</div>
		<script type="text/javascript">
			$(function() {
				var msg = '${msg}';
				if(msg!=null&&msg.length>0){
					layer.alert(msg,{icon:4});
				}
				var unaccept = '${unaccept}';
				if(unaccept!=null&&unaccept.length>0){
					layer.alert("当前项目进度还未验收，请联系质检员！",{icon:4},function(){
						window.location.href="/workComplete/toProjectCompleteList";
					});
				}
				$(".apply_complete").click(function() {
					var orderNo=$(this).data("orderno");
					var bohui=$(this).data("bohui");
					$.post("/complete/check/valid",{orderNo:orderNo},function(result){
						if(result!=null&&result.count>0) {
							layer.alert("项目必须进行特单验收，请在【特单验收】功能中对此项目进行验收后再申请竣工！",{icon:4});
						} else {
							if(bohui!=null&&bohui!="") {
								window.location.href="/workComplete/threePath/toWorkComplete?orderNo="+orderNo+"&bohuiFlag="+bohui;
							} else {
								window.location.href="/workComplete/threePath/toWorkComplete?orderNo="+orderNo;
							}
						}
					});
					/* $.ajax({
						url:"/complete/check/valid",
						type:"post",
						data:{orderNo:orderNo},
						async:false,
						cache:false,
						success:function(result) {
							if(result!=null&&result.count>0) {
								layer.alert("项目必须进行特单验收，请在【特单验收】功能中对此项目进行验收后再申请竣工！",{icon:4});
							} else {
								if(bohui!=null&&bohui!="") {
									window.location.href="/workComplete/threePath/toWorkComplete?orderNo="+orderNo+"&bohuiFlag="+bohui;
								} else {
									window.location.href="/workComplete/threePath/toWorkComplete?orderNo="+orderNo;
								}
							}
						}
					}); */
				});
			})
		</script>
	</body>
</html>