<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="/WEB-INF/jsp/layout/cssjs.jsp"%>
<div class="content">
    <div class="title">
        <h2>材料验收</h2>
        <a href="/complete/check/list">
            <img src="/assets-new/img/esc.png">
        </a>
    </div>
    <hr class="content_hr">
    <table class="table_list" border="0" cellspacing="0" cellpadding="0">
        <tr class="table_listTr">
            <th scope="col" width="25%">采购/发货单号</th>
            <th scope="col" width="20%">采购内容</th>
            <th scope="col" width="20%">交货日期</th>
            <th scope="col" width="20%">状态</th>
            <th scope="col" width="15%">操作</th>
        </tr>
        <tbody>
        <c:forEach items="${list}" var="erpEkko">
            <tr>
                <td>${erpEkko.ebeln}</td>
                <td>
                    <c:if test="${erpEkko.bsart=='40'}">直送特单</c:if>
                    <c:if test="${erpEkko.bsart=='41'}">直送特单-沙子水泥</c:if>
                    <c:if test="${erpEkko.bsart=='42'}">直送特单-壁纸</c:if>
                    <c:if test="${erpEkko.bsart=='43'}">直送特单-台面</c:if>
                    <c:if test="${erpEkko.bsart=='44'}">直送特单-自流平</c:if>
                    <c:if test="${erpEkko.bsart=='91'||erpEkko.bsart=='90'}">直配特单</c:if>
                </td>
                <td><fmt:formatDate value="${erpEkko.webaz}" pattern="yyyy-MM-dd"/></td>
                <td>
                    <c:if test="${erpEkko.statu=='0'}">初审</c:if>
                    <c:if test="${erpEkko.statu=='1'}">下达</c:if>
                    <c:if test="${erpEkko.statu=='3'}">已收货</c:if>
                </td>
                <td>
                    <c:if test="${erpEkko.statu=='1'&&erpEkko.bsart!='90'&&erpEkko.bsart!='91'}">
                        <a href="#" class="td_an inspect_confirm" data-ebeln="${erpEkko.ebeln}" data-ono="${orderNo}" data-bsart="${erpEkko.bsart}">确认验收</a>
                    </c:if>
                    <c:if test="${erpEkko.statu=='0'||erpEkko.statu=='3'||(erpEkko.bsart=='90'&&erpEkko.receiveStatus==1)||(erpEkko.bsart=='91'&&erpEkko.receiveStatus==1)}">
                        <a class="td_an" href="/complete/check/threePath/detail?ebeln=${erpEkko.ebeln}&bsart=${erpEkko.bsart}&orderNo=${orderNo}">明细</a>
                    </c:if>
                </td>
            </tr>
        </c:forEach>
        <c:if test="${!empty installList}">
            <c:forEach items="${installList}" var="install">
                <tr>
                    <td>${install.installNo}</td>
                    <td>直配特单-地板</td>
                    <td><fmt:formatDate value="${install.confirmInstallDate}" pattern="yyyy-MM-dd"/></td>
                    <td>
                        <c:if test="${install.state<=20}">未验收</c:if>
                        <c:if test="${install.state>20}">已验收</c:if>
                    </td>
                    <td>
                        <c:if test="${install.state<=20}">
                            <a href="#" class="td_an inspect_confirm" data-flag="floor" data-ono="${orderNo}">确认验收</a>
                        </c:if>
                        <c:if test="${install.state>20}">
                            <a class="td_an" href="/complete/check/threePath/detail?orderNo=${orderNo}&bsart=floor">明细</a>
                        </c:if>
                    </td>
                </tr>
            </c:forEach>
        </c:if>
        <c:if test="${!empty specialsVos}">
            <c:forEach var="specialsVo" items="${specialsVos}">
                <tr>
                    <td>${specialsVo.materialNo}</td>
                    <td>台盆</td>
                    <td><fmt:formatDate value="${specialsVo.sendDate}" pattern="yyyy-MM-dd"/></td>
                    <td>
                        <c:if test="${specialsVo.statu=='0'}">审核</c:if>
                        <c:if test="${specialsVo.statu=='3'}">已收货</c:if>
                    </td>
                    <td>
                        <c:if test="${specialsVo.statu=='0'}">
                            <a class="td_an" href="/complete/check/threePath/confirmUI?flag=basins&ebeln=${specialsVo.materialNo}&orderNo=${specialsVo.orderNo}">确认验收</a>
                        </c:if>
                        <c:if test="${specialsVo.statu=='3'}">
                            <a class="td_an" href="/complete/check/threePath/basinDetail?ebeln=${specialsVo.materialNo}&orderNo=${specialsVo.orderNo}">明细</a>
                        </c:if>
                    </td>
                </tr>
            </c:forEach>
        </c:if>
        </tbody>
    </table>
</div>
<script type="text/javascript">
    $(function() {
        $(".nav").css("left","-16%");
        $(".nav").removeClass("animate");
        $(".content,.title").css("width","100%");
        $(".inspect_confirm").click(function() {
            var ebeln=$(this).data("ebeln");
            var flag=$(this).data("flag");
            if(flag==null||flag=="") {
                var basrt=$(this).data("bsart");
                var orderNo=$(this).data("ono");
                //壁纸(42)或台面(43)
                //去掉台面验收时需要验证提交到木作安装
                if(basrt=="42"/*||basrt=="43"*/) {
                    $.ajax({
                        url:"/complete/check/validFinish",
                        type:"post",
                        dataType:"json",
                        data:{orderNo:orderNo},
                        async:false,
                        cache:false,
                        success:function(result) {
                            if(result.state) {
                                window.location.href="/complete/check/threePath/confirmUI?ebeln="+ebeln+"&orderNo="+orderNo;
                            } else {
                                layer.alert("请到进度通报将【木作安装完工】提报后才可操作 ",{icon:4});
                            }
                        }
                    });
                } else {
                    window.location.href="/complete/check/threePath/confirmUI?ebeln="+ebeln+"&orderNo="+orderNo;
                }
            }
            if(flag=="floor") {
                var orderNo=$(this).data("ono");
                window.location.href="/complete/check/threePath/confirmUI?flag="+flag+"&orderNo="+orderNo;
            }
        });
    });
</script>