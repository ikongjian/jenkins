<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<head>
    <%@ include file="/WEB-INF/jsp/layout/cssjs.jsp"%>
    <title>验收明细</title>
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
</head>
<body>
    <div class="content" style="width:100%;">
        <div class="title">
            <h2>壁纸安装申请详情</h2>
            <a href="/wood/woodList?flag=paper"><img src="/assets-new/img/esc.png"></a>
        </div>
        <hr class="content_hr">
        <div class="orderBaseInfo">
            <ul>
                <li>
                    <span>采购编号：</span>${result.erpEkko.ebeln}
                </li>
                <li>
                    <span>期望安装日期：</span>${askfor.askDate}
                </li>
                <li>
                    <span>确认安装日期：</span>${askfor.sureDate}
                </li>
                <li>
                    周六日是否可施工：
                    <c:if test="${askfor.isHolydayStart==1}">否</c:if>
                    <c:if test="${askfor.isHolydayStart==2}">是</c:if>
                </li>
            </ul>
        </div>
        <div class="projectForm projectTableFrom">
            <table class="table_list veiw_table" border="0" cellspacing="0" cellpadding="0">
                <tr class="table_listTr">
                    <th scope="col" width="8%">序号</th>
                    <th scope="col" width="20%">商品名称</th>
                    <th scope="col" width="20">规格/型号/颜色</th>
                    <th scope="col" width="10%">单位</th>
                    <th scope="col" width="25%">备注</th>
                </tr>
                <c:forEach items="${result.erpEkpos}" var="erpEkpo" varStatus="ekkoState">
                    <tr>
                        <td>${ekkoState.index+1}</td>
                        <td>${erpEkpo.txz01}</td>
                        <td>${erpEkpo.mfrpn}</td>
                        <td>${erpEkpo.meins}</td>
                        <td>${erpEkpo.exlin}</td>
                    </tr>
                </c:forEach>
            </table>
            <div class="submitWrap"><input type="button" class="paper_back" value="返回"></div>
        </div>
    </div>
    <script type="text/javascript">
        $(function() {
            $(".paper_back").click(function() {
                window.location.href="/wood/woodList?flag=paper";
            });
        });
    </script>
</body>