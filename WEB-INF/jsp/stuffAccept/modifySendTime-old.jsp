<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE >
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" name="viewport">
<meta content="no-cache" http-equiv="pragma">
<meta content="no-cache" http-equiv="cache-control">
<meta content="0" http-equiv="expires">
<title>收货时间申请</title>
<script type="text/javascript">
  function saveWorkDate() {
	  $.ajax({
		 url:"/stuffAccept/validDate",
			type:"post",
			dataType:"json",
			async:false,
			cache:false,
			success:function(result) {
				$("#nowDate").val(result.nowDate);
			}
	 });
	 var projectId = $("#projectId").val();
	 var batchId = $("#batchId").val();
	 var sendTime = $("#sendTime").val();
	 var remark = $("#remark").val();
	 var areaCode = $("#areaCode").val();
	 if(sendTime!=""&&sendTime!=null) {
		 if(batchId=="10"||batchId=="20"||batchId=="50") {
			 var nowDate=$("#nowDate").val().trim();
			 var date=new Date(Date.parse(sendTime.replace(/-/g,"/")));
			 var todayDate;
			 if(nowDate!=null&&nowDate!="") {
				 todayDate=new Date(Date.parse(nowDate.replace(/-/g,"/")));
			 } else {
				todayDate=new Date();
			 }
			 if(areaCode=="101"||areaCode=="303"||areaCode=="304"||areaCode=="404") {
				 var todayDateHour=todayDate.getHours();
				 if(todayDateHour>=12) {
					todayDate.setDate(todayDate.getDate()+3);
				 } else {
					todayDate.setDate(todayDate.getDate()+2);
				 }
				 var year=todayDate.getFullYear();
				 var month=(todayDate.getMonth()+1)>=10?(todayDate.getMonth()+1):"0"+(todayDate.getMonth()+1);
				 var day=todayDate.getDate()>=10?todayDate.getDate():"0"+todayDate.getDate();
				 var targetDayStr=year+"-"+month+"-"+day;
				 var targetDay=new Date(Date.parse(targetDayStr.replace(/-/g,"/")));
				 if(date<targetDay) {
					layer.alert("选择的期望送货日期必须为："+targetDayStr+"（含）日之后的时间",{skin:'layui-layer-molv',closeBtn:0});
					return false;
				 } else {
					 $("#okbtn").attr("disabled","disabled");
					 layer.msg('提交中，请稍后',{icon:16,time:5000,shade:0.1});
					 $("form[name='saveform']").submit();
				 }
			 } else {
				 var year=todayDate.getFullYear();
				 var month=(todayDate.getMonth()+1)>=10?(todayDate.getMonth()+1):"0"+(todayDate.getMonth()+1);
				 var day=todayDate.getDate()>=10?todayDate.getDate():"0"+todayDate.getDate();
				 var targetDayStr=year+"-"+month+"-"+day;
				 var targetDay=new Date(Date.parse(targetDayStr.replace(/-/g,"/")));
				 if(date<targetDay) {
					 layer.alert("选择的材料进场时间必须为："+targetDayStr+"（含）日之后的时间",{skin:'layui-layer-molv',closeBtn:0});
					 return false;
				 } else {
					 $("#okbtn").attr("disabled","disabled");
					 layer.msg('提交中，请稍后',{icon:16,time:5000,shade:0.1});
					 $("form[name='saveform']").submit();
				 }
			 }
	 	} else {
	 		$("#okbtn").attr("disabled","disabled");
	 		layer.msg('提交中，请稍后',{icon:16,time:5000,shade:0.1});
	 		$("form[name='saveform']").submit();
	 	}
	} else {
		layer.alert("请选择期望送货日期",{skin:'layui-layer-molv',closeBtn:0});
		return false;
	}
 } 
</script>
</head>

<body>
    <!--3级页面框架-->
    <div class="right frame">
    	<!--头部-->
    	<header>
        	<h6>收货时间申请</h6>
        	<a href="javascript:void(0);" onclick="winBack()"><img src="/assets-new/img/esc.png"></a>
        </header>
        <div class="content">
           <form action="/stuffAccept/modifySendTime" method="post" name="saveform">
            <input type="hidden" name="projectId" id="projectId" value="${projectId }">
            <input type="hidden" name="batchId" id="batchId" value="${batchId }">
            <input type="hidden" name="areaCode" id="areaCode" value="${areaCode }">
        	<div class="start input_p">
        		<p>
                	<span>业主：</span>
                    <b>${orderInfo.community}-${orderInfo.building}-${orderInfo.unit}-${orderInfo.room}-${orderInfo.userName}</b>
                </p>
            	<p>
                	<span>日程：</span>
                	<c:if test="${batchId == '10' }">
		        	   	 主材第一次发货
		        	</c:if>
		        	<c:if test="${batchId == '20' }">
		        		 主材第二次发货
		        	</c:if>
		        	<c:if test="${batchId == '30' }">
		        		辅料第一次发货
		        	</c:if>
		        	<c:if test="${batchId == '40' }">
		        		辅料第二次发货
		        	</c:if>
		        	<c:if test="${batchId == '50' }">
		        		木作第一次发货
		        	</c:if>
		        	<c:if test="${batchId == '51' }">
		        		木作第二次发货
		        	</c:if>
                </p>
                <%-- <p>
                	<span>计划送货日期：</span>
                    <fmt:formatDate value="${planSendTime }" pattern="yyyy-MM-dd"/>
                </p> --%>
                <p>
                	<span>期望送货日期：</span>
                    <input class="input_date" type="date" name="sendTime" id="sendTime"/>
                </p>
                <p class="textarea_p">
                	<span>备注：</span>
                    <textarea name="remark" id="remark" rows="" cols="">${remark }</textarea>
                </p>
                <p>
                	<span>&nbsp;&nbsp;</span>
                    <input id="okbtn" class="input_ok" type="button" value="确定" onclick="saveWorkDate()">
                </p>
            </div>
            </form>
            <input type="hidden" id="nowDate">
        </div>
    </div>
</body>
</html>
