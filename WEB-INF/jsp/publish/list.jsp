<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.ikongjian.erp.enums.ErpContractOrderStatusEnum" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="en" uri="/enumTag" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<%@ include file="/WEB-INF/jsp/layout/cssjs.jsp"%>
    <title>项目播报</title>
    <style type="text/css">
        .table_list tr td a.td_an{
            position:relative;
            overflow:inherit;
        }
        small {
            position:absolute;
            right:0;
            display:block;
            background: #ed6c00;
            color: #fff;
            text-align: center;
            border-radius: 50%;
            right: .8rem;
            top: -.9rem;
            width: 1.8rem;
            height: 1.8rem;
            line-height: 1.8rem;
        }
    </style>
</head>

<body>
	<%@ include file="/WEB-INF/jsp/layout/menu.jsp"%>
    <!--右侧内容框架-->
    <div class="content">
        <!--任务包施工-->
        <div class="title">
            <h2>项目播报</h2>
            <i><img src="/assets-new/4th/img/nav_0.png"></i>
            <%--<a href="#"><img src="/assets-new/4th/img/esc.png"></a>--%>
        </div>
        <hr class="content_hr">
        <table class="table_list" border="0" cellspacing="0" cellpadding="0">
            <tbody>
                <tr class="table_listTr">
                 <th scope="col" width="28%">顾客</th>
                 <th scope="col" width="15%">面积</th>
                 <th scope="col" width="15%">实际开工日期</th>
                 <th scope="col" width="15%">合同工期</th>
                 <th scope="col" width="12%">状态</th>
                 <th scope="col" width="15%">操作</th>
                </tr>
                <c:forEach items="${list }" var="item">
	              <tr>
	             	 <td class="text_left">
              	  	    <a class="td_none" href="/order/threePath/toOrderInfoPage?orderNo=${item.orderNo }">
	            			${item.community }-${item.building }-${item.unit }-${item.room }-${item.userName }
	            		</a>
	             	 </td>
	                 <td>${item.area }</td>
	                 <td><fmt:formatDate value="${item.workingDate }" pattern="yyyy-MM-dd"/></td>
	                 <td>${item.workDays }</td>
	                 <td class="colorff0000"><en:out code="${item.orderStatesNo }" enumClass="<%=ErpContractOrderStatusEnum.class %>"/></td>
	                 <td>
	                 	<a class="td_an" href="/publish/threePath/toPublish?orderNo=${item.orderNo }">
                            播报
                            <c:if test="${item.workerNewImgNum>0}">
                                <small>
                                    ${item.workerNewImgNum}
                                </small>
                            </c:if>
                        </a>
	                 	<a class="td_an" href="/publish/threePath/toPublishList?orderNo=${item.orderNo }">播报列表</a>
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