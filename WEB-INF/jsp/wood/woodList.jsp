<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<%@ include file="/WEB-INF/jsp/layout/cssjs.jsp"%>
    <title>木作安装列表</title>
    <style rel="stylesheet" type="text/css">
        .content_tab + .table_list {
            margin-top:1.6rem;
            border-top: 0.1rem solid #dddee3;
        }
    </style>
    <script type="text/javascript">
        $(function() {
            $(".content_tab a").click(function() {
                var content_tab=$(this).index();
                $(".content_tab a").removeClass("stay_tab");
                $(this).addClass("stay_tab");
                $(this).parent().parent().find("table").hide();
                $(this).parent().parent().find("table").eq(content_tab).show();
            });
            var flag="${flag}";
            if(flag!=null&&flag!=""&&flag=="paper") {
                $(".carpentry_install").removeClass("stay_tab");
                $(".wallPaper_install").addClass("stay_tab");
                $(".carpentry_table").hide();
                $(".wallPaper_table").show();
            }
            if(flag!=null&&flag!=""&&flag=="wood") {
                $(".carpentry_install").addClass("stay_tab");
                $(".wallPaper_install").removeClass("stay_tab");
                $(".carpentry_table").show();
                $(".wallPaper_table").hide();
            }
        });
    </script>
</head>
<body>
	<%@ include file="/WEB-INF/jsp/layout/menu.jsp"%>
    <div class="content">
        <div class="title">
            <h2>安装申请列表</h2>
            <i><img src="/assets-new/4th/img/nav_0.png"></i>
        </div>
        <hr class="content_hr">
        <div class="content_tab">
            <a class="carpentry_install stay_tab" href="javascript:void(0);">木作申请</a>
            <a class="wallPaper_install" href="javascript:void(0);">壁纸申请</a>
        </div>
        <table class="table_list carpentry_table" border="0" cellspacing="0" cellpadding="0">
            <tr class="table_listTr">
                <th scope="col" width="34%">顾客</th>
                <th scope="col" width="17%">实际开工日期</th>
                <th scope="col" width="17%">计划安装时间</th>
                <th scope="col" width="17%">确认安装时间</th>
                <th scope="col" width="15%">操作</th>
            </tr>
            <c:forEach var="item" items="${queryInstallList }">
                <tr>
                    <td class="text_left">
                        <a class="td_none" href="/order/threePath/toOrderInfoPage?orderNo=${item.contractNo}">${item.userName}</a>
                    </td>
                    <td><fmt:formatDate value="${item.workingDate}" pattern="yyyy-MM-dd"/></td>
                    <td><fmt:formatDate value="${item.planInstallDate}" pattern="yyyy-MM-dd"/></td>
                    <td><fmt:formatDate value="${item.confirmInstallDate}" pattern="yyyy-MM-dd"/></td>
                    <td>
                        <c:if test="${empty item.materialNo1}">
                            <a class="td_an" href="/wood/threePath/toApply?installNo=${item.installNo}&orderNo=${item.contractNo}&askBillNo=${item.materialNo}">木作申请</a>
                        </c:if>
                        <c:if test="${!empty item.materialNo1}">
                            <a class="td_an" href="/wood/threePath/detail?orderNo=${item.contractNo}">查看详情</a>
                        </c:if>
                        <%--<c:if test="${empty item.installNo}">
                            <a class="td_an" href="/wood/threePath/toApply?installNo=${item.installNo}&orderNo=${item.contractNo}&askBillNo=${item.materialNo}">木作申请</a>
                        </c:if>
                        <c:if test="${!empty item.installNo}">
                            <a class="td_an" href="/wood/threePath/detail?orderNo=${item.contractNo}">查看详情</a>
                        </c:if>--%>
                    </td>
                </tr>
            </c:forEach>
        </table>
        <table class="table_list wallPaper_table" border="0" cellspacing="0" cellpadding="0" style="display:none;">
            <tr class="table_listTr">
                <th scope="col" width="34%">顾客</th>
                <th scope="col" width="17%">实际开工日期</th>
                <th scope="col" width="17%">计划安装时间</th>
                <th scope="col" width="17%">确认安装时间</th>
                <th scope="col" width="15%">操作</th>
            </tr>
            <c:forEach items="${wallPaperList}" var="wallPaper">
                <tr>
                    <td class="text_left">
                        <a class="td_none" href="/order/threePath/toOrderInfoPage?orderNo=${wallPaper.orderNo}">${wallPaper.userName}</a>
                    </td>
                    <td><fmt:formatDate value="${wallPaper.workingDate}" pattern="yyyy-MM-dd"/></td>
                    <td><fmt:formatDate value="${wallPaper.checkDate}" pattern="yyyy-MM-dd"/></td>
                    <td><fmt:formatDate value="${wallPaper.confirmInstallDate}" pattern="yyyy-MM-dd"/></td>
                    <td>
                        <c:if test="${empty wallPaper.checkDate}">
                            <a class="td_an" href="/wood/threePath/toPaperApply?orderNo=${wallPaper.orderNo}">安装申请</a>
                        </c:if>
                        <c:if test="${!empty wallPaper.checkDate}">
                            <a class="td_an" href="/wood/threePath/paperDetail?orderNo=${wallPaper.orderNo}&ebeln=${wallPaper.installNo}">查看详情</a>
                        </c:if>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </div>
</body>
</html>