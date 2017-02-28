<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.ikongjian.erp.enums.WorkerCompleteEnum"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="en" uri="/enumTag"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<%@ include file="/WEB-INF/jsp/layout/cssjs.jsp"%>
    <title>竣工申请</title>
</head>

<body>
	<%@ include file="/WEB-INF/jsp/layout/menu.jsp"%>
    <div class="content">
        <div class="title">
            <h2>竣工申请列表</h2>
            <i><img src="/assets-new/4th/img/nav_0.png"></i>
        </div>
        <hr class="content_hr">
        <table class="table_list" border="0" cellspacing="0" cellpadding="0">
            <tbody>
                <tr class="table_listTr">
                    <th scope="col" width="25%">顾客</th>
					<th scope="col" width="15%">合同开工日期</th>
					<th scope="col" width="15%">合同竣工日期</th>
					<th scope="col" width="15%">实际开工日期</th>
					<th scope="col" width="15%">结算状态</th>
					<th scope="col" width="15%">操作</th>
                </tr>
                <c:forEach var="working" items="${workingList }">
					<tr> 
						<td class="text_left">
              	  	 		<a class="td_none" href="/order/threePath/toOrderInfoPage?orderNo=${working.orderNo }"> ${working.community }${working.building }-${working.unit }-${working.room }-${working.userName }
							</a>
						</td>
						<td><fmt:formatDate value="${working.planWorkingDate }" pattern="yyyy-MM-dd" /></td>
						<td><fmt:formatDate value="${working.planCompleteDate }" pattern="yyyy-MM-dd" /></td>
						<td><fmt:formatDate value="${working.workingDate }" pattern="yyyy-MM-dd" /></td>
						<td><c:if test="${working.orderStatesNo != '170' or working.orderStatesNo != '190' or working.orderStatesNo != '191'}">
								<en:out code="${working.orderStatesNo }" enumClass="<%=WorkerCompleteEnum.class %>" />
							</c:if></td>
						<td>
							<%--<c:choose>
								<c:when test="${pmAreaCode=='101'}">
									<c:if test="${working.orderStatesNo == '170' or working.orderStatesNo == '190' or working.orderStatesNo == '191' }">
										<a class="td_an apply_complete" href="javascript:void(0);" data-orderno="${working.orderNo}" >申请竣工</a>
									</c:if> 
									<c:if test="${working.orderStatesNo == '1'||working.orderStatesNo == '3'}">
										<a class="td_an apply_complete" href="javascript:void(0);" data-orderno="${working.orderNo}" data-bohui="bohui">申请竣工</a>
									</c:if> 
								</c:when>
								<c:otherwise>
									<c:if test="${working.orderStatesNo == '170' or working.orderStatesNo == '190' or working.orderStatesNo == '191' }">
				                  		<a class="td_an" href="/workComplete/threePath/toWorkComplete?orderNo=${working.orderNo }">申请竣工</a>
				                  	</c:if>
				                  	<c:if test="${working.orderStatesNo == '1'||working.orderStatesNo == '3'}">
				                  		<a class="td_an" href="/workComplete/threePath/toWorkComplete?orderNo=${working.orderNo }&bohuiFlag=bohui">申请竣工</a>
				                  	</c:if>
								</c:otherwise>
							</c:choose>--%>
                                <c:if test="${working.orderStatesNo == '170' or working.orderStatesNo == '190' or working.orderStatesNo == '191' }">
                                    <a class="td_an apply_complete" href="javascript:void(0);" data-orderno="${working.orderNo}" >申请竣工</a>
                                </c:if>
                                <c:if test="${working.orderStatesNo == '1'||working.orderStatesNo == '3'}">
                                    <a class="td_an apply_complete" href="javascript:void(0);" data-orderno="${working.orderNo}" data-bohui="bohui">申请竣工</a>
                                </c:if>
                                <c:if test="${working.orderStatesNo == '0' or working.orderStatesNo == '1' or working.orderStatesNo == '2'  }">
								<a class="td_an" href="/workComplete/threePath/toWorkCompleteInfo?orderNo=${working.orderNo }">查看进程</a>
							</c:if>
						</td>
					</tr>
				</c:forEach>
            </tbody>
        </table>
    </div>
    <script type="text/javascript">
			$(function() {
				var msg = '${msg}';
				if(msg!=null&&msg.length>0){
					layer.alert(msg,{icon:4},function() {
						window.location.href="/workComplete/toProjectCompleteList";
					});
					
				}
				var unaccept = '${unaccept}';
				if(unaccept!=null&&unaccept.length>0){
					layer.alert("当前项目进度还未验收，请联系质检员！",{icon:4},function() {
						window.location.href="/workComplete/toProjectCompleteList";
					});
				}
				$(".apply_complete").click(function() {
					var orderNo=$(this).data("orderno");
					var bohui=$(this).data("bohui");
                    $.ajax({
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
					});
				});
			})
		</script>
</body>

</html>