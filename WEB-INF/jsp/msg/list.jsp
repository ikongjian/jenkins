<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <%@ include file="/WEB-INF/jsp/layout/cssjs.jsp"%>
    <title>消息列表</title>
</head>

<body>
	<%@ include file="/WEB-INF/jsp/layout/menu.jsp"%>
    <!--右侧内容框架-->
    <div class="content">
        <!--消息列表-->
        <div class="title">
            <h2 class="color_fff">消息列表</h2>
            <i><img src="/assets-new/4th/img/nav_0.png"></i>
            <%--<a href="javascript:void(0);"><img src="/assets-new/4th/img/esc.png"></a>--%>
        </div>
        <hr class="content_hr">
        <div class="content_soso">
         <form action="/msg/listMore" method="post" id="pmMsgForm">
            <p class="soso_name">
                <span>消息标题</span>
                <input type="text" name="title" value="${pmMsg.title}">
            </p>
            <p class="soso_date">
                <span>发布日期</span>
                <input class="taskInputdate" type="date" name="start" value="${pmMsg.start}">
                <em>到</em>
                <input class="taskInputdate" type="date" name="end" value="${pmMsg.end}">
            </p>
            <input class="soso_button" type="submit" value="搜索">
       	 </form>
        </div>
        <table class="table_list" border="0" cellspacing="0" cellpadding="0">
            <tbody>
                <tr class="table_listTr">
                    <th scope="col" width="10%">消息类型</th>
					<th scope="col" width="40%">消息标题</th>
					<th scope="col" width="16%">发布时间</th>
					<th scope="col" width="13%">发布人</th>
					<th scope="col" width="14%">阅读状态</th>
					<th scope="col" width="12%">操作</th>
                </tr>
                <input type="hidden" id="nowDate">
                <c:forEach items="${list}" var="pmMsg">
					<tr>
						<td class="text_left">
							<c:if test="${pmMsg.type==1}">重要通知</c:if>										
							<c:if test="${pmMsg.type==2}">紧急通知</c:if>										
							<c:if test="${pmMsg.type==3}">日常通知</c:if>	
							<c:if test="${pmMsg.type==4}">判责罚款</c:if>			
						</td>
						<td>${pmMsg.title}</td>
						<td>
							<fmt:formatDate value="${pmMsg.applyDate}" pattern="yyyy-MM-dd"/>
						</td>
						<td>${pmMsg.createUser}</td>
						<td>
							<c:if test="${pmMsg.readState==1}">未查阅</c:if>
							<c:if test="${pmMsg.readState==2}">已查阅</c:if>
						</td>
						<td><a class="td_an" href="javascript:void(0);" class="view_msg" data-id="${pmMsg.id}">查看</a></td>
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
    <script type="text/javascript">
	function GetDateDiff(startDate,endDate) {
	    var startTime=new Date(Date.parse(startDate.replace(/-/g,"/"))).getTime();     
	    var endTime=new Date(Date.parse(endDate.replace(/-/g,"/"))).getTime();     
	    var dates=(endTime-startTime)/(1000*60*60*24);     
	    return  dates;    
	}
	$(function() {
		$("body").delegate(".td_an","click",function() {
			var id=$(this).data("id");
			window.location.href="/msg/threePath/detail?id="+id;
		});
		$("#pmMsgForm").submit(function() {
			var title=$(":input[name='title']").val().trim();
			var start=$(":input[name='start']").val().trim();
			var end=$(":input[name='end']").val().trim();
			if(title!=null&&title!="") {
				return true;
			} else {
				if(start==null||start==''||end==null||end=='') {
					layer.alert("请选择查询开始与结束日期",{icon:5});
					return false;
				} else {
					var dayDiff=GetDateDiff(start,end);
					if(dayDiff<0) {
						layer.alert("请选择有效的查询开始与结束日期",{icon:5});
						return false;
					} else if(dayDiff>30) {
						layer.alert("仅能查询30天内的数据，请重新设置查询时间",{icon:5});
						return false;
					} else {
						return true;
					}
				}
			}
		});
	});
</script>
</body>

</html>