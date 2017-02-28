<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="en" uri="/enumTag" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<%@ include file="/WEB-INF/jsp/layout/cssjs.jsp"%>
    <title>我要抢单</title>
    <script type="text/javascript">
		function qiangdan(orderNo,poolId){
			//询问框
			layer.confirm('您是确定要参与抢单吗？', {
			    btn: ['确定','取消'] //按钮
			}, function(){
				$.post("/pmProject/updatePMOrderState"
					,{orderNo:orderNo,poolId:poolId}
					,function(data){
						layer.alert(data.result, {icon: 1},function(){
							window.location.reload(true);
						});
				});
			}, function(){
			});
		}
	</script>
</head>

<body>
	<%@ include file="/WEB-INF/jsp/layout/menu.jsp"%>
    <!--右侧内容框架-->
    <div class="content">
        <!--任务包施工-->
        <div class="title">
            <h2>我要抢单</h2>
            <i><img src="/assets-new/4th/img/nav_0.png"></i>
            <%--<a href="#"><img src="/assets-new/4th/img/esc.png"></a>--%>
        </div>
        <hr class="content_hr">
        <table class="table_list" border="0" cellspacing="0" cellpadding="0">
            <tbody>
                <tr class="table_listTr">
                      <th scope="col" width="25%">顾客</th>
	              	  <th scope="col" width="15%">合同开工日期</th>
	                  <th scope="col" width="15%">合同竣工日期</th>
	                  <%--<th scope="col" width="10%">面积</th>--%>
	                  <!-- <th scope="col" width="12%">户型</th> -->
	                  <th scope="col" width="12%">状态</th>
	                  <th scope="col" width="18.75%">操作</th>
                </tr>
                <c:forEach var="item" items="${resList }">
		      	<tr>
              	  <td class="text_left">
              	  	<a class="td_none" href="/order/threePath/toOrderInfoPage?orderNo=${item.orderNo }&from=qiangdan">
            			${item.community }-${item.building }-${item.unit }-${item.room }-${item.userName }
            		</a>
              	  </td>
              	  <td><fmt:formatDate value="${item.planWorkingDate }" pattern="yyyy-MM-dd"/></td>
                  <td><fmt:formatDate value="${item.planCompleteDate }" pattern="yyyy-MM-dd"/></td>
                  <%--<td>${item.area }</td>--%>
                  <%-- <td>${item.houseType }</td> --%>
                  <td class="colorff0000">
                  	 <c:if test="${item.status == 0 }">
                  	 	待抢单
                  	 </c:if>
                  	 <c:if test="${item.status == 1 }">
                  	 	已参与抢单
                  	 </c:if>
                  </td>
                  <td>
                  	 <c:if test="${item.status == 0 }">
                  	 	<a class="td_an" href="javascript:void(0);" onclick="qiangdan('${item.orderNo}','${item.poolId }')">我要抢单</a>
                  	 </c:if>
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