<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE >
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" name="viewport">
<meta content="no-cache" http-equiv="pragma">
<meta content="no-cache" http-equiv="cache-control">
<meta content="0" http-equiv="expires">
<%@ include file="/WEB-INF/jsp/layout/cssjs.jsp"%>
<title>补货申请单列表</title>
    <style type="text/css">
        .projectForm input[type='button'] {
            margin-bottom:8rem;
            width:100%;
            height:5rem;
            background:#ed6c00;
            border-radius:.5rem;
            color:#fff;
            font-size:2rem;
        }
    </style>
    <script type="text/javascript">
        $(function() {
            $(".nav").css("left","-16%");
            $(".nav").removeClass("animate");
            $(".content,.title").css("width","100%");
            $(".wood_back").click(function() {
                window.location.href="/wood/woodList?flag=wood";
            });
        });
    </script>
</head>

<body>
<div class="content">
    <div class="title">
        <h2>木作安装详情</h2>
        <a href="/wood/woodList?flag=wood"><img src="/assets-new/4th/img/esc.png"></a>
    </div>
    <hr class="content_hr">
    <div class="projectForm projectTableFrom">
        <table class="table_list" border="0" cellspacing="0" cellpadding="0">
            <tr class="table_listTr">
                <th scope="col" width="20%">分类</th>
                <th scope="col" width="16%">计划安装时间</th>
                <th scope="col" width="16%">确认安装时间</th>
                <th scope="col" width="16%">安装队长</th>
                <th scope="col" width="16%">联系电话</th>
                <th scope="col" width="16%">安装状态</th>
            </tr>
            <tbody>
            <c:forEach var="item" items="${queryOrderProMg}">
                <tr>
                    <td>
                        <c:if test="${item.workorderType == '1' }">派工单</c:if>
                        <c:if test="${item.workorderType == '2' }">CAD/BIM报价单</c:if>
                        <c:if test="${item.workorderType == '3' }">变更单</c:if>
                        <c:if test="${item.workorderType == '4' }">开工单</c:if>
                        <c:if test="${item.workorderType == '5'&&item.materialType=='1'}">木作正单</c:if>
                        <c:if test="${item.workorderType == '5'&&item.materialType=='7'}">壁纸特单</c:if>
                        <c:if test="${item.workorderType == '5'&&item.materialType=='11'}">木门</c:if>
                        <c:if test="${item.workorderType == '6' }">木作特单</c:if>
                        <c:if test="${item.workorderType == '7' }">木作补单</c:if>
                        <c:if test="${item.workorderType == '8' }">验收单</c:if>
                        <c:if test="${item.materialType=='4'}">垭口特单</c:if>
                        <c:if test="${item.workorderType == '10'&&item.materialType=='5'}">台面安装单</c:if>
                        <c:if test="${item.workorderType == '11'&&item.materialType=='6'}">木作收尾单</c:if>
                        <c:if test="${item.workorderType == '12' }">台盆特单</c:if>
                        <c:if test="${item.workorderType == '13' }">壁纸特单</c:if>
                        <c:if test="${item.workorderType == '14' }">主材一次</c:if>
                        <c:if test="${item.workorderType == '15' }">沙子水泥</c:if>
                        <c:if test="${item.workorderType == '16'}">地板安装单</c:if>
                        <c:if test="${item.workorderType == '17' }">地板补单</c:if>
                    </td>
                    <td><fmt:formatDate value="${item.planInstallDate }" pattern="yyyy-MM-dd"/></td>
                    <td><fmt:formatDate value="${item.confirmInstallDate }" pattern="yyyy-MM-dd"/></td>
                    <td>${item.installManager}</td>
                    <td>${item.installManagerPhone }</td>
                    <td>
                        <c:if test="${item.state == 10 }">创建</c:if>
                        <c:if test="${item.state == 20 }">下达</c:if>
                        <c:if test="${item.state == 30 }">完成</c:if>
                        <c:if test="${item.state == 40 }">部分验收</c:if>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
        <div class="submitWrap"><input type="button" class="wood_back" value="返回"></div>
    </div>
</div>
</body>
</html>
