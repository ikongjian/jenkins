<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="en" uri="/enumTag"%>
<!DOCTYPE html>
<html lang="en">

<head>
	<%@ include file="/WEB-INF/jsp/layout/cssjs.jsp"%>
    <title>任务包计划</title>
</head>

<body>
    <%@ include file="/WEB-INF/jsp/layout/menu.jsp"%>
    <!--右侧内容框架-->
    <div class="content">
        <!--任务管理包-->
        <div class="title">
            <h2>任务包计划</h2>
            <i><img src="/assets-new/img/nav_0.png"></i>
            <%--<a href="#"><img src="/assets-new/img/esc.png"></a>--%>
        </div>
        <hr class="content_hr">
        <table class="table_list table_list_task" border="0" cellspacing="0" cellpadding="0">
            <tbody>
                <tr class="table_listTr">
                    <th scope="col" width="17%">顾客</th>
                    <th scope="col" width="17%">任务包</th>
                    <th scope="col" width="17%">计划开始日期</th>
                    <th scope="col" width="17%">计划结束日期</th>
                    <th scope="col" width="18%">任务包计划状态</th>
                    <th scope="col" width="14%">操作</th>
                </tr>
                <c:forEach var="item" items="${planList }">
                <tr>
                    <td><a class="td_none" href="javascript:void(0);">${item.community }${item.building }-${item.unit }-${item.room }-${item.khName }</a></td>
                    <td>${item.name }</td>
                    <td>
                    	<fmt:formatDate value="${item.startDate }" pattern="yyyy-MM-dd"/>
                    </td>
                    <td>
                    	<fmt:formatDate value="${item.endDate }" pattern="yyyy-MM-dd"/>
                    </td>
                    <td>
                        <c:if test="${item.state==10}">未确认</c:if>
                        <c:if test="${item.state==15}">已确认</c:if>
                        <c:if test="${item.state==20}">已派工</c:if>
                    </td>
                    <td>
                        <c:if test="${item.state ==10}">
                            <a class="td_an rectifyBtn" href="javascript:void(0);" onclick="applyUpdate('${item.id}','${item.orderNo }')">确认计划</a>
                        </c:if>
                        <c:if test="${item.state ==15}">
                    		<a class="td_an rectifyBtn" href="javascript:void(0);" onclick="applyUpdate('${item.id}','${item.orderNo }')">调整计划</a>
                    	</c:if> 
                    	<a class="td_an" href="/pkg/planDetail?orderNo=${item.orderNo }&temId=${item.temId}">查看计划</a>
                    </td>
                </tr>
                </c:forEach>
            </tbody>
        </table>
        <!--弹窗-->
        <div class="taskMaterial taskRectify">
            <div class="taskMaterialB"><img class="none" src="/assets-new/img/esc_1.png"></div>
            <!--辅料单-->
            <div class="taskMaterialT">
                <div class="rectifyWrap">                
                    <div>请根据实际工程情况，填写期望的派工到场施工日期</div>
                    <input type="hidden" name="planPkgId" id="planPkgId">
                    <input type="hidden" name="orderNo" id="orderNo">
                    <div style="overflow:hidden">
                        <input class="taskInputdate taskInputdate_startDate" name="startDate" id="startDate" type="date" style="float:left;">
                        <input type="text" id="startDateWeek" readonly="readonly" style="float:left; width: 5rem;">
                    </div>
                    <div style="overflow:hidden">
                        <input class="taskInputdate taskInputdate_endDate" name="endDate" id="endDate" type="date" style="float:left;">
                        <input type="text" id="endDateWeek" readonly="readonly" style="float:left; width: 5rem;">
                    </div>
                    <div class="tips">提示：<br>
                        中午12点前，可支持最早后天的任务调整；中午12点后，可支持最早3天后的任务调整。<br>
                        如特殊情况请联系调度员。
                    </div>
                </div>
                <input class="buttom_2" type="button" onclick="saveUpdate()" value="确认">
            </div>
        </div>
    </div>
    <!--右侧内容框架结束-->
    <!--本页JS-->
    <script type="text/javascript">

        function getDayOfWeek(inputDate) {
            if(inputDate!=null&&inputDate!="") {
                var arys1=inputDate.split("-");
                var ssdate=new Date(arys1[0],parseInt(arys1[1]-1),arys1[2]);
                var week1=String(ssdate.getDay()).replace("0","日").replace("1","一").replace("2","二").replace("3","三").replace("4","四").replace("5","五").replace("6","六");
                return "星期"+week1;
            } else {
                return "";
            }
        }

        $(function () {
            //隐藏返回按钮
            $(".title a").hide();
            //申请调整
            $(".rectifyBtn").click(function () {
                $(".taskMaterialB img").css("margin","15% 0 0 13%");
                $(".taskMaterial").show();
                $(".taskMaterialB img").fadeIn(2400);
                $(".taskMaterialT").animate({right:"0",},1500);
                var startDate = $(this).parent().parent().find("td").eq(2).html();
            	var endDate = $(this).parent().parent().find("td").eq(3).html();
            	$("#startDate").val(startDate.trim());
            	$("#startDateWeek").val(getDayOfWeek(startDate.trim()));
            	$("#endDate").val(endDate.trim());
            	$("#endDateWeek").val(getDayOfWeek(endDate.trim()));
            });
            //退出 .buttom_2  ,.taskMaterialT
            $(".taskMaterialB").click(function () {
                $(".taskMaterial").fadeOut();
                $(".taskMaterialB img").hide();
                $(".taskMaterialT,.taskStaff").css({right:"-100%"})
            });

            $(".taskInputdate_startDate").change(function() {
                var startDate=$("#startDate").val().trim();
                $("#startDateWeek").val(getDayOfWeek(startDate.trim()));
            });
            $(".taskInputdate_endDate").change(function() {
                var endDate=$("#endDate").val().trim();
                $("#endDateWeek").val(getDayOfWeek(endDate.trim()));
            });
        });
        function applyUpdate(planId,orderNo){
        	$("#planPkgId").val(planId);
        	$("#orderNo").val(orderNo);
        }
        function saveUpdate(){
        	var planId = $("#planPkgId").val();
        	var startDate = $("#startDate").val();
        	var endDate = $("#endDate").val();
        	var orderNo = $("#orderNo").val();
        	$.post("/pkg/savePlanPkg",
        			{planId:planId,
	        		 startDate:startDate,
	        		 endDate:endDate,
	        		 orderNo:orderNo},
	        		 function(data){
        		        alert(data.msg);
                         if(data.state==3) {
                             window.location.href="/pkg/planList";
                         }
        	});
        }
    </script>
</body>

</html>