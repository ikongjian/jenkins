<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<%@ include file="/WEB-INF/jsp/layout/cssjs.jsp"%>
    <title>确认开工</title>
</head>

<body>
	<%@ include file="/WEB-INF/jsp/layout/menu.jsp"%>
    <!--右侧内容框架-->
    <div class="content">
        <!--任务包施工-->
        <div class="title">
            <h2>确认开工</h2>
            <i><img src="/assets-new/4th/img/nav_0.png"></i>
            <%--<a href="#"><img src="/assets-new/4th/img/esc.png"></a>--%>
        </div>
        <hr class="content_hr">
        <table class="table_list" border="0" cellspacing="0" cellpadding="0">
            <tbody>
                <tr class="table_listTr">
                  <th scope="col" width="40%">顾客</th>
                  <th scope="col" width="22.5%">预计开工时间</th>
                  <th scope="col" width="22.5%">状态</th>
                  <th scope="col" width="15%">操作</th>
                </tr>
                <c:forEach var="contract" items="${resList}">
              	  <tr>        
	              	 <td class="text_left">
              	  	    <a class="td_none" href="/order/threePath/toOrderInfoPage?orderNo=${contract.orderNo }">
			              	 ${contract.community }
			              	 ${contract.building }-${contract.unit }-${contract.room }-
			              	 ${contract.userName }
		              	 </a>
	              	 </td>
	                 <td><fmt:formatDate value="${contract.planWorkingDate }" pattern="yyyy-MM-dd"/></td>
	                 <td>待开工</td>
	                 <td><a class="td_an" href="/confirmWorkDate/threePath/confirmWorkDatePage?orderNo=${contract.orderNo }">开工</a></td>        
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