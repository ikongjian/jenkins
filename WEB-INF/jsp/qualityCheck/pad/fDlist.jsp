<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<head>
    <%@ include file="/WEB-INF/jsp/layout/cssjs.jsp"%>
    <title>复检列表</title>
</head>
<body>
    <div class="content">
        <div class="title">
            <h2>复检列表</h2>
            <a href="/fujian/check/mlist"><img src="/assets-new/4th/img/esc.png"></a>
        </div>
        <hr class="content_hr">
        <table class="table_list" border="0" cellspacing="0" cellpadding="0">
            <tbody>
            <tr class="table_listTr">
                <th scope="col" width="18%">复检类别</th>
                <th scope="col" width="23%">检查内容</th>
                <th scope="col" width="18%">检查人</th>
                <th scope="col" width="28%">检查时间</th>
                <th scope="col" width="13%">操作</th>
            </tr>
            <c:forEach var="check" items="${checks}">
                <tr>
                    <td class="text_left">
                        <c:if test="${check.type==30}">线上复检</c:if>
                        <c:if test="${check.type==40}">现场复检</c:if>
                    </td>
                    <td>${check.checkContent}</td>
                    <td>${check.finishMancode}</td>
                    <td><fmt:formatDate value="${check.updateTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                    <td>
                        <a class="td_an"
                           href="/fujian/check/threePath/applyCheck?id=${check.id}&orginCheckId=${check.orginCheckId}&type=${check.type}&orderNo=${check.orderNo}">申请复检</a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
    <script type="text/javascript">
        $(function() {
            $(".nav").css("left","-16%");
            $(".nav").removeClass("animate");
            $(".content,.title").css("width","100%");
        });
    </script>
</body>