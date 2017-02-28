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
<title>确认开工</title>
</head>

<body>
  	<!--右侧头部-->
  	<header>
    	<h6>确认开工</h6>
    	<!--<a href="#"><img src="/assets-new/img/esc.png"></a>-->
    	<input type="hidden" id="navClass" name="navClass" value="nav_a3"/>
    </header>
    <!--右侧内容-->
    <div class="content">
    	<!--复核报价单-->
        <table class="table_1" width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr class="quote_tr">
              	  <th scope="col" width="40%">顾客</th>
                  <th scope="col" width="22.5%">预计开工时间</th>
                  <th scope="col" width="22.5%">状态</th>
                  <th scope="col" width="15%">操作</th>
			  </tr>
              <c:forEach var="contract" items="${resList}">
              	  <tr>        
	              	 <td>
	              	     <a class="href" href="/order/threePath/toOrderInfoPage?orderNo=${contract.orderNo }">
			              	 ${contract.community }
			              	 ${contract.building }-${contract.unit }-${contract.room }-
			              	 ${contract.userName }
		              	 </a>
	              	 </td>
	                 <td><fmt:formatDate value="${contract.planWorkingDate }" pattern="yyyy-MM-dd"/></td>
	                 <td>待开工</td>
	                 <td><a href="/confirmWorkDate/threePath/confirmWorkDatePage?orderNo=${contract.orderNo }">开工</a></td>        
	              </tr>
              </c:forEach>
	  </table>     	
   </div>
</body>
</html>
