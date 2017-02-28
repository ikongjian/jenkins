<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">

<head>
	<%@ include file="/WEB-INF/jsp/layout/cssjs.jsp"%>
    <title>查看计划</title>
</head>

<body>
    <!--右侧内容框架-->
    <div class="content">
        <!--任务管理包-->
        <div class="title">
            <h2>查看计划</h2>
            <%--<i><img src="/assets-new/img/nav_0.png"></i>--%>
            <a href="/pkg/planList"><img src="/assets-new/img/esc.png"></a>
        </div>
        <hr class="content_hr">
        <div class="currentTack">
            <div class="fL name">${orderInfo.community }${orderInfo.building }-${orderInfo.unit }-${orderInfo.room }-${orderInfo.khName }</div>
            <%--<div class="fR"><button class="td_an add">新增一行</button><button class="td_an" onclick="window.location.reload(true);">刷新</button></div>--%>
        </div>
        <form action="/pkg/savePlanDetail" method="post" name="saveform" id="saveform" class="form-inline">
			<input type="hidden" name="orderNo" value="${orderNo }">
			<input type="hidden" name="storeNo" value="${storeNo }">
			<input type="hidden" name="planIds" id="planIds">
        <table class="table_list table_list_task table_list_taskDet" border="0" cellspacing="0" cellpadding="0">
            <tbody>
                <tr class="table_listTr">
                    <%--<th class="textL" scope="col" width="7%">顺序</th>--%>
                    <th scope="col" width="12%">任务包名称</th>
                    <th scope="col" width="25%">开始日期</th>
                    <th scope="col" width="25%">结束日期</th>
                    <th scope="col" width="10%">签到日期</th>
                    <th scope="col" width="10%">完工日期</th>
                    <th scope="col" width="8%">计划状态</th>
                    <th scope="col" width="15%">操作</th>
                </tr>
                <c:forEach var="item" items="${planList }" varStatus="status">
                <tr>
                        <%--<td><input name="sort" type="text" size="4" value="${item.sort }">
                            <input name="id" type="hidden" value="${item.id }">
                        </td>--%>
                    <td>
                        <select name="name" disabled="disabled">
                            <c:forEach var="pkg" items="${detailList }">
                            	<option value="${pkg.name },${pkg.type}" <c:if test='${pkg.type == item.type }'>selected='selected'</c:if>>${pkg.name }</option>
                            </c:forEach>
                        </select>
                    </td>
                    <td>
                        <c:if test="${item.state == 10||item.state == 15}">
                            <div class="date_span">
                                <input class="taskInputdate fL" style="width:13.5rem;" name="startDate" type="date"
                                       value="<fmt:formatDate value='${item.startDate }' pattern='yyyy-MM-dd'/>">
                                <span class="week_span" style="display:inline; float:none;">${item.startDateWeek}</span>
                            </div>
                        </c:if>
                        <c:if test="${item.state == 20 }">
                            <fmt:formatDate value='${item.startDate }' pattern='yyyy-MM-dd EEEE'/>
                        </c:if>
                    </td>
                    <td>
                        <c:if test="${item.state == 10||item.state == 15}">
                            <div class="date_span">
                                <input class="taskInputdate" style="width:13.5rem;" name="endDate" type="date"
                                       value="<fmt:formatDate value='${item.endDate }' pattern='yyyy-MM-dd'/>">
                                <span class="week_span" style="display:inline; float:none;">${item.endDateWeek}</span>
                            </div>
                        </c:if>
                        <c:if test="${item.state == 20 }">
                            <fmt:formatDate value='${item.endDate }' pattern='yyyy-MM-dd EEEE'/>
                        </c:if>
                    </td>
                    <td><fmt:formatDate value='${item.signDate }' pattern='yyyy-MM-dd'/></td>
                    <td><fmt:formatDate value='${item.completeDate }' pattern='yyyy-MM-dd'/></td>
                    <td>
                        <c:if test="${item.state == 10 }">未确认</c:if>
                        <c:if test="${item.state == 15 }">已确认</c:if>
                        <c:if test="${item.state == 20 }">已派工</c:if>
                    <td>
                    	<c:if test="${item.state == 10 }">
                            <a class="td_an confirmBtn" href="javascript:void(0);" data-id="${item.id}">确认</a>
                        </c:if>
                        <c:if test="${item.state == 15 }">
                            <a class="td_an confirmBtn" href="javascript:void(0);" data-id="${item.id}">调整</a>
                        </c:if>
                   </td>
                </tr>
                </c:forEach>
            </tbody>
        </table>
        </form>
        <%--<input class="buttom_1" onclick="saveforms()" type="button" value="确定">--%>
        <!--弹窗-->
        <div class="taskMaterial taskRectify">
            <div class="taskMaterialB"><img class="none" src="/assets-new/img/esc_1.png"></div>
            <!--辅料单-->
            <div class="taskMaterialT">
                <div class="rectifyWrap">                
                    <div>请根据实际工程情况，填写期望的派工到场施工日期</div>
                    <input class="taskInputdate" type="date" placeholder="开始日期">
                    <input class="taskInputdate" type="date" placeholder="结束日期">
                    <div class="tips">提示：<br>
                        中午12点前，可支持最早后天的任务调整；中午12点后，可支持最早3天后的任务调整。<br>
                        如特殊情况请联系调度员。
                    </div>
                </div>
                <input class="buttom_2" type="button" value="申请调整">
            </div>
        </div>
    </div>
    <!--右侧内容框架结束-->
    <!--本页JS-->
    <script type="text/javascript">
        function getDayOfWeek(inputDate) {
            if (inputDate != null && inputDate != "") {
                var arys1 = inputDate.split("-");
                var ssdate = new Date(arys1[0], parseInt(arys1[1] - 1), arys1[2]);
                var week1 = String(ssdate.getDay()).replace("0", "日").replace("1", "一").replace("2", "二").replace("3", "三").replace("4", "四").replace("5", "五").replace("6", "六");
                return "星期" + week1;
            } else {
                return "";
            }
        }
        $(function () {
            $(".date_span .taskInputdate").change(function () {
                var startDate = $(this).val().trim();
                var dayOfWeek = getDayOfWeek(startDate);
                $(this).parent(".date_span").find(".week_span").html(dayOfWeek);
            });

            $(".confirmBtn").click(function () {
                var startDate = $(this).parents("tr").find("input[name='startDate']").val();
                var endDate = $(this).parents("tr").find("input[name='endDate']").val();
                var planId = $(this).data("id");
                $.ajax({
                    url: "/pkg/savePlanPkg",
                    type: "post",
                    dataType: "json",
                    data: {planId: planId, startDate: startDate, endDate: endDate},
                    async: false,
                    cache: false,
                    success: function (data) {
                        alert(data.msg);
                        if (data.state == 3) {
                            window.location.reload(true);
                        }
                    }
                });
            });
            
            //隐藏返回按钮
            $(".nav").css("left","-16%");
            $(".nav").removeClass("animate");
            $(".content,.title").css("width","100%");
            //删除行
            $(".deletBtn").click(function() {
                $(this).parents("tr").remove();
        		var id = $(this).parent().parent().find("input[name='id']").val();
        		if(id!=null&&id.length>0){
        			if($("#planIds").val()==null||$("#planIds").val().length==0){
        				$("#planIds").val(id);
        			}else{
        				$("#planIds").val($("#planIds").val()+","+id);
        			}
        			/* $.ajax({
        		        cache: true,
        		        type: "POST",
        		        url:"/pkg/deletePlan",
        		        data:{id:id},
        		        async: false,
        		        success: function(data) {
        		           window.location.reload(true);
        		        }
        		    }); */
        		}
                //RefreshNum();
            });
            var temList = eval('${detailListJson }');
            var str = "";
            for (var i = 0; i < temList.length; i++) {
            	str+="<option value='"+temList[i].name+","+temList[i].type+"'>"+temList[i].name+"</option>";
			}
            //增加行
            $(".currentTack .add").click(function() {
                var taskTr = "<tr>"+
                             "<td><input name='sort' size='2'></td>"+
                             "<td>"+
                             "<select name='name'>"+str+"</select>"+
                             "</td>"+
                             "<td><input class=\"taskInputdate\" name='startDate' type=\"date\"></td>"+
                             "<td><input class=\"taskInputdate\" name='endDate' type=\"date\"></td>"+
                             "<td><a class=\"td_an deletBtn\" href=\"javascript:void(0);\">删除</a></td>"+
                             "</tr>";
                $(".table_list").append(taskTr);
                $(".deletBtn").on("click",function(){
                    $(this).parents("tr").remove();
                    //RefreshNum();
                });
                //RefreshNum();
            });
            /* function RefreshNum(){
                var len = $(".table_list tr").length;
                for(var i = 1;i<len;i++){
                    $('.table_list tr:eq('+i+') td:first').text(i);
                }
            } */
        });
        function saveforms(){
        	$.ajax({
    	        cache: true,
    	        type: "POST",
    	        url:"/pkg/savePlanDetail",
    	        data:$('#saveform').serialize(),
    	        async: false,
    	        success: function(data) {
    	        	window.location.reload(true);
    	        }
    	    });
        }
    </script>
</body>

</html>