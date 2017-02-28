<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="en" uri="/enumTag" %>
<!DOCTYPE >
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" name="viewport">
<meta content="no-cache" http-equiv="pragma">
<meta content="no-cache" http-equiv="cache-control">
<meta content="0" http-equiv="expires">
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
	<!--右侧头部-->
   	<header>
      <h6>我要抢单</h6>
     <!--  <a href="#"><img src="/assets-new/img/esc.png"></a> -->
      <input type="hidden" name="navClass" id="navClass" value="nav_a19"/>
   </header>
      <!--右侧内容-->
      <div class="content">
      	<!--我的项目列表-->
          <table class="table_1" width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr class="quote_tr">
              	  <th scope="col" width="25%">顾客</th>
              	  <th scope="col" width="15%">合同开工日期</th>
                  <th scope="col" width="15%">合同竣工日期</th>
                  <!-- <th scope="col" width="10%">面积</th> -->
                  <!-- <th scope="col" width="12%">户型</th> -->
                  <th scope="col" width="12%">状态</th>
                  <th scope="col" width="18.75%">操作</th>
		      </tr>
		      <c:forEach var="item" items="${resList }">
		      	<tr>
              	  <td>
              	  	<a class="href" href="/order/threePath/toOrderInfoPage?orderNo=${item.orderNo }&from=qiangdan">
            			${item.community }-${item.building }-${item.unit }-${item.room }-${item.userName }
            		</a>
              	  </td>
              	  <td><fmt:formatDate value="${item.planWorkingDate }" pattern="yyyy-MM-dd"/></td>
                  <td><fmt:formatDate value="${item.planCompleteDate }" pattern="yyyy-MM-dd"/></td>
                  <%-- <td>${item.area }</td> --%>
                  <%-- <td>${item.houseType }</td> --%>
                  <td>
                  	 <c:if test="${item.status == 0 }">
                  	 	待抢单
                  	 </c:if>
                  	 <c:if test="${item.status == 1 }">
                  	 	已参与抢单
                  	 </c:if>
                  </td>
                  <td>
                  	 <c:if test="${item.status == 0 }">
                  	 	<a href="javascript:void(0);" onclick="qiangdan('${item.orderNo}','${item.poolId }')">我要抢单</a>
                  	 </c:if>
                  </td>      
                </tr>
		      </c:forEach>
	</table>     	
   </div>
</body>
</html>
