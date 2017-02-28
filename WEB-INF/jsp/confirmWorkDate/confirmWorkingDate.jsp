<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="en" uri="/enumTag"%>
<head>
<%@ include file="/WEB-INF/jsp/layout/cssjs.jsp"%>
<title>确认开工</title>
<script type="text/javascript">
	function checkWorkDate(){
		var planDate = $("#planWorkingDate").val();
		var workDate = $("#workingDate").val();
		if(workDate==null||workDate.length==0){return false;}
		var planWorkingDate =  new Date(planDate.replace(/\-/g, "\/")); 
		var workingDate = new Date(workDate.replace(/\-/g, "\/"));
		if(planWorkingDate<workingDate){
			$("#laterDiv").show();
		}else{
			$("#laterDiv").hide();
		}
	}
	function saveWorkDate(){
		
		var planDate = $("#planWorkingDate").val().trim();
		var workDate = $("#workingDate").val().trim();
		$("#token").val(token);
		$("#loginUserName").val(loginUserName);
		var holidayWork=$("input[name='holidayWork']:checked").val();
        if(holidayWork==""||holidayWork==null) {
            layer.alert("请选择周末是否施工",{icon:2});
            return false;
        }
        var hasIndividuation=$("input[name='hasIndividuation']:checked").val();
        if(hasIndividuation==""||hasIndividuation==null) {
            layer.alert("请选择是否有个性化",{icon:2});
            return false;
        }
        var planWorkingDate =  new Date(planDate.replace(/\-/g, "\/"));
        var workingDate = new Date(workDate.replace(/\-/g, "\/"));
		if(workDate==null||workDate=="") {
			layer.alert("请选择实际开工日期",{icon:2});
			return false;
		}

        if(holidayWork!=null&&holidayWork=="2") {
            var dayOfWeek=workingDate.getDay();
            if(dayOfWeek=="0"||dayOfWeek=="6") {
                layer.alert("因您已选周末不施工，开工日期不能为周末",{icon:2});
                return false;
            }
        }

		if(planWorkingDate<workingDate) {
			var type = $("input[name='workingDelayType']").val();
			if(type==null||type.length==0){
				layer.alert("请选择延期类型",{icon:2});
				return false;
			}
			var remark = $("#workingDelayRemark").val();
			if(remark==null||remark.length==0) {
				layer.alert("请填写延期说明",{icon:2});
				return false;
			} else {
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
				var nowDate=$("#nowDate").val().trim();
				var date=new Date(Date.parse(workDate.replace(/-/g,"/")));
				var todayDate;
				if(nowDate!=null&&nowDate!="") {
					todayDate=new Date(Date.parse(nowDate.replace(/-/g,"/")));
				} else {
					todayDate=new Date();
				}
				var year=todayDate.getFullYear();
				var month=(todayDate.getMonth()+1)>=10?(todayDate.getMonth()+1):"0"+(todayDate.getMonth()+1);
				var day=todayDate.getDate()>=10?todayDate.getDate():"0"+todayDate.getDate();
				var targetDayStr=year+"-"+month+"-"+day;
				var targetDay=new Date(Date.parse(targetDayStr.replace(/-/g,"/")));
                todayDate.setDate(todayDate.getDate()+1);
                if(date<targetDay||date>todayDate) {
					//layer.alert("选择的开工日期必须为："+targetDayStr+"（含）日之后的时间",{skin:'layui-layer-molv',closeBtn:0});
                    layer.alert("开工日期只能选择今明两天",{icon:2});
					return false;
				} else {
					$.ajax({
						url:"/confirmWorkDate/updateContract",
						data:$("#saveForm").serialize(),
						type:"POST",
						dataType:"json",
						success:function(responseText){
							if(responseText.result==0){
								layer.alert(responseText.errorMsg,{icon:2});
							}else{
								if(responseText.resultCode==1){
									layer.alert(responseText.resultMsg,{icon:6},function(){
										window.location.href="/confirmWorkDate/index";
									});
									
								}else if(responseText.resultCode==-1||responseText.resultCode==0){
									layer.alert(responseText.resultMsg,{icon:2});
								}
							} 
						}
				   });
				}
			}
		} else {
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
			var nowDate=$("#nowDate").val().trim();
			var date=new Date(Date.parse(workDate.replace(/-/g,"/")));
			var todayDate;
			if(nowDate!=null&&nowDate!="") {
				todayDate=new Date(Date.parse(nowDate.replace(/-/g,"/")));
			} else {
				todayDate=new Date();
			}
			var year=todayDate.getFullYear();
			var month=(todayDate.getMonth()+1)>=10?(todayDate.getMonth()+1):"0"+(todayDate.getMonth()+1);
			var day=todayDate.getDate()>=10?todayDate.getDate():"0"+todayDate.getDate();
			var targetDayStr=year+"-"+month+"-"+day;
			var targetDay=new Date(Date.parse(targetDayStr.replace(/-/g,"/")));
            todayDate.setDate(todayDate.getDate()+1);
            if(date<targetDay||date>todayDate) {
				//layer.alert("选择的开工日期必须为："+targetDayStr+"（含）日之后的时间",{skin:'layui-layer-molv',closeBtn:0});
                layer.alert("开工日期只能选择今明两天",{icon:2});
				return false;
			} else {
				$.ajax({
					url:"/confirmWorkDate/updateContract",
					data:$("#saveForm").serialize(),
					type:"POST",
					dataType:"json",
					success:function(responseText){
						if(responseText.result==0){
							layer.alert(responseText.errorMsg,{icon:2});
						}else{
							if(responseText.resultCode==1){
								layer.alert(responseText.resultMsg,{icon:6},function(){
									window.location.href="/confirmWorkDate/index";
								});
								
							}else if(responseText.resultCode==-1||responseText.resultCode==0){
								layer.alert(responseText.resultMsg,{icon:2});
							}
						} 
					}
			   });
			}
		}
	}
</script>

<style>
<!--
input[type=button] {
  margin-top: 1rem;
  width: 100%;
  height: 4.16rem;
  font-size: 2rem;
  background: #ed6c00;
  border-radius: 0.5rem;
  color: #fff;
}
-->
</style>
</head>
    <div class="content">
        <div class="title">
            <h2>确认开工</h2>
            <%--<i><img src="/assets-new/img/nav_0.png"></i>--%>
            <a href="javascript:void(0);" onclick="window.history.go(-1);"><img src="/assets-new/img/esc.png"></a>
        </div>
        <hr class="content_hr">
        <div class="projectForm">
           <!--  <form method="post" action=""> -->
           <form action="/confirmWorkDate/updateContract" method="post" name="saveForm" id="saveForm">
          	   <input type="hidden" id="nowDate">
               <input type="hidden" name="token" id="token">
               <input type="hidden" name="loginUserName" id="loginUserName">
               <input type="hidden" name="orderNo" id="orderNo" value="${orderInfo.orderNo }">
            
                <div class="formGroupBox">
                    <div class="formGroup">
                        <label>预计开工时间</label>
                        <p><fmt:formatDate value="${orderInfo.planWorkingDate }" pattern="yyyy-MM-dd"/></p>
                    </div>
                    <div class="formGroup">
                        <label>业主</label>
                        <p>
                        	${orderInfo.community}-${orderInfo.building}-${orderInfo.unit}-${orderInfo.room}-${orderInfo.userName}
                        </p>
                    </div>
                    <div class="formGroup">
                        <label>新旧房</label>
                        <p>
                            <c:if test="${orderInfo.productNo=='10002669'}">
                                <input id="newHouse" type="radio" name="newOldHouse" value="0" checked="checked">
                                <label class="radio radio_hover" for="newHouse">新房</label>
                                <input id="oldHouse" type="radio" name="newOldHouse" value="1">
                                <label class="radio" for="oldHouse">旧房</label>
                            </c:if>
                            <c:if test="${orderInfo.productNo=='10002685'}">
                                <input id="newHouse" type="radio" name="newOldHouse" value="0">
                                <label class="radio" for="newHouse">新房</label>
                                <input id="oldHouse" type="radio" name="newOldHouse" value="1" checked="checked">
                                <label class="radio radio_hover" for="oldHouse">旧房</label>
                            </c:if>
                            <span style="color:red;">请与业主确认后再修改</span>
                        </p>
                    </div>
                    <div class="formGroup">
                        <label>周末是否施工</label>
                        <p>
                            <input id="holidayWorkY" type="radio" name="holidayWork" value="1">
                            <label class="radio" for="holidayWorkY">施工</label>
                            <input id="holidayWorkN" type="radio" name="holidayWork" value="2">
                            <label class="radio" for="holidayWorkN">不施工</label>
                            <span style="color:red;">请与业主确认后再修改</span>
                        </p>
                    </div>
                    <div class="formGroup">
                        <label>是否有个性化</label>
                        <p>
                            <input id="hasIndividuationY" type="radio" name="hasIndividuation" value="1">
                            <label class="radio" for="hasIndividuationY">有</label>
                            <input id="noIndividuationN" type="radio" name="hasIndividuation" value="2">
                            <label class="radio" for="noIndividuationN">无</label>
                            <span style="color:red;">请与设计师确认后再修改</span>
                        </p>
                    </div>
                    <div class="formGroup">
                        <label>实际开工日期</label>
                        <p class="iconForward">
                            <input class="input_date" type="hidden" name="planWorkingDate" id="planWorkingDate" 
                			value="<fmt:formatDate value="${orderInfo.planWorkingDate }" pattern="yyyy-MM-dd"/>"/>
                            <input class="taskInputdate" type="date" name="workingDate" id="workingDate" onblur="checkWorkDate()">
                        </p>
                    </div>
                    <div class="formGroup" id="laterDiv" style="display: none;">
                        <label>开工延期类型</label>
                        <p>
                            <!-- <input id="ikj" class="danxuan" name="workingDelayType" type="radio" checked="checked" value="1">
	                        <label for="ikj">爱空间原因</label>
	                        <input id="ikj_kh" class="danxuan" name="workingDelayType" type="radio" value="0">
	                        <label for="ikj_kh">业主原因</label> -->
	                    
                            <input id="ikongjian" type="radio" name="workingDelayType" checked="checked" value="1"><label class="radio radio_hover" for="ikongjian">爱空间原因</label>
                            <input id="customer" type="radio" name="workingDelayType" value="0"><label class="radio" for="customer">业主原因</label>
                        </p>
                    </div>
                    <div class="formGroup">
                        <label for="workingDelayRemark">延期开工说明</label>
                        <p>
                            <textarea name="workingDelayRemark" id="workingDelayRemark" ></textarea>
                        </p>
                    </div>
                </div>
                <div class="submitWrap">
                	<!-- <input type="submit" value="确定"> -->
                	<input class="input_ok" type="button" value="确定" onclick="saveWorkDate()">
                </div>
            </form>
        </div>
    </div>
    <!--右侧内容框架结束-->
    <!--本页JS-->
    <script>
        $(function () {
            //隐藏返回按钮
            $(".nav").css("left","-16%");
            $(".nav").removeClass("animate");
            $(".content,.title").css("width","100%");
        });
    </script>