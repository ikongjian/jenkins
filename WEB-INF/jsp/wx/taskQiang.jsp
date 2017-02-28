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
<meta name="format-detection" content="telephone=no" />
<title>抢任务</title>
<link rel="stylesheet" type="text/css" href="/assets-new/wx/css/css.css">
<script type="text/javascript" src="/assets-new/wx/js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="/assets-new/layer-v2.0/layer/layer.js"></script>
</head>

<body>
	<!--抢任务-->
    <div class="grab">
    	<div class="grab_head">
        	<div class="grab_icon"><img src="/assets-new/wx/img/icon.png"></div>
            <div class="grab_name">${memberInfo.name}<br><span>${memberInfo.category}</span></div>
        </div>
        <!--抢任务框-->
        <div class="grab_task">
            <c:forEach var="item" items="${voList }">
	        	<!--任务-->
	        	<div class="grab_task1">
	            	<h2>任务：${item.packageName }<a href="/wx/taskInfo?packageId=${item.packageId }">查看详情></a></h2>
	                <div class="grab_task_text">
	                	<p><span>价钱：</span><b>${item.packageMoney }元</b></p>
	                    <p><span>工期：</span><b><fmt:formatDate value="${item.startTime }"/>至<fmt:formatDate value="${item.endTime }"/></b></p>
	                    <p><span>地点：</span><b>${item.fullName }-${item.community }-${item.building }-${item.unit }-${item.room }-${item.userName }</b></p>
	                </div>
	                <input type="hidden" name="start_${item.packageId }" id="start_${item.packageId }" value="<fmt:formatDate value='${item.startTime }' pattern='yyyy-MM-dd'/>"/>
	                <div class="grab_task_time">倒计时：<span id="times_${item.packageId }"></span></div>
                	<c:if test="${isLeader == true }">
	                	<c:if test="${empty map or empty map[item.packageId] or map[item.packageId] == 0 }">
	                		<a class="grab_button" href="javascript:void(0);" onclick="qiangDan('${item.packageId }')">
	                    	     我要抢任务
	                    	</a>
	                    </c:if>
	                    <c:if test="${not empty map and map[item.packageId]==1 }">
	                    	<a class="grab_button1" href="javascript:void(0);">
	                    	      已参与抢单
	                    	</a>
	                    </c:if>
                    </c:if>
	            </div>
            </c:forEach>
            <!--任务-->
        	<!-- <div class="grab_task1">
            	<h2>任务：瓦工任务包<a href="#">查看详情></a></h2>
                <div class="grab_task_text">
                	<p><span>价钱：</span><b>3000元</b></p>
                    <p><span>工期：</span><b>2015-11-16至2015-11-19</b></p>
                    <p><span>地点：</span><b>鹿港嘉苑-10-3-2001-张三嘉苑-10-3-2001-嘉苑-10-3-2001-</b></p>
                </div>
                <div class="grab_task_time">倒计时：<span id="times"></span></div>
                <a class="grab_button" href="#">我要抢任务</a>
            </div> -->
        </div>
    </div>
</body>
<script>
var nowtime =parseInt('${fwqDate}');//服務器时间戳
var nowStr = '${fwqStr}';//服務器日期字符串
var now = new Date();//本地浏览器时间
//服务器时间与本地时间时间差
var diff = parseInt((nowtime-now.getTime())/1000);
fresh();
var sh;
sh=setInterval(fresh,1000);
function fresh(){
	var startPackages = $("input[name^='start_']");
	if(startPackages!=null&&startPackages.length>0){
		for (var i = 0; i < startPackages.length; i++) {
			var endtime=0;
			/* var start = $(startPackages[i]).val();//包开始时间
			var startDate = new Date(start.replace(/-/g,"/"))
			//包开始时间-1
			startDate.setDate(startDate.getDate()-1); */
			var nowDate = new Date(nowStr.replace(/-/g,"/"));
			//天数=包开始时间与服务器时间差
			//var diffDays = parseInt((startDate.getTime()-nowDate.getTime())/(1000*60*60*24));
			//判断如果包开始时间-1与当前服务器时间，如果=0，则今天下午开枪，>0:加一天计数
			/* if(diffDays==0){
				endtime=parseInt('${lastDate}');
			}else if(diffDays>0){
				endtime = parseInt('${lastDate}')+24*60*60*1000*diffDays;
			} */
			endtime = parseInt('${lastDate}');
			var now = new Date();//本地时间
			//剩余时间=结束时间-本地时间-时间差
		    var leftSecond = parseInt((endtime-now.getTime())/1000)-diff;
		    d=parseInt(leftSecond/(60*60*24));
		    h=parseInt((leftSecond/(60*60))%24);
		    m=parseInt((leftSecond/60)%60);
		    s=parseInt(leftSecond%60);
		    var name = $(startPackages[i]).attr("name");
			document.getElementById("times_"+name.split("_")[1]).innerHTML=d+"天"+h+"小时"+m+"分"+s+"秒";
		    if(leftSecond<=0){
		    	var aEle = $(startPackages[i]).parent().find("a[class=grab_button]");
		    	$(aEle).attr("class","grab_button1");
		    	$(aEle).html("参与抢单已结束，等待系统分配");
		    	$(aEle).removeAttr("onclick");
		        document.getElementById("times_"+name.split("_")[1]).innerHTML="已结束";
		    }
		}
	}
}
function qiangDan(id){
	$.post("/wx/saveThisPackage",{id:id},function(data){
		layer.msg(data.result, {
		    icon: 6,
		    time: 2000 //2秒关闭（如果不配置，默认是3秒）
		}, function(){
			window.location.reload(true);
		});
	})
}
</script>
</html>
