<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE >
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" name="viewport">
<meta content="no-cache" http-equiv="pragma">
<meta content="no-cache" http-equiv="cache-control">
<meta content="0" http-equiv="expires">
<title>欢迎来到熊师傅</title>
<link rel="stylesheet" type="text/css" href="/assets-new/css/ipad.css">
<style type="text/css">
.spantextcolor{color: red;}
</style>
<script type="text/javascript" language="javascript">
	function selectHref() {
		if (token != null && token != '') {
			window.location = "/logoutFromApp";
		} else {
			window.location = "/logout";
		}
	}
	function tabSpan(type){
		if(type=='work'){
			$("#workSpan").addClass("spantextcolor");
			$("#workSpan").siblings().removeClass("spantextcolor");
			$("#workUL").show();
			$("#zqUL").hide();
			$("#jgUL").hide();
		}
		if(type=='zq'){
			$("#zqSpan").addClass("spantextcolor");
			$("#zqSpan").siblings().removeClass("spantextcolor");
			$("#workUL").hide();
			$("#zqUL").show();
			$("#jgUL").hide();
		}
		if(type=='jg'){
			$("#jgSpan").addClass("spantextcolor");
			$("#jgSpan").siblings().removeClass("spantextcolor");
			$("#workUL").hide();
			$("#zqUL").hide();
			$("#jgUL").show();
		}
	}
	function clickEvent(){
		$.ajax({
			cache: true,
	        type: "POST",
	        url:"/func/click",
	        data:{type:10},
	        async: false
		});
	}
</script>
</head>

<body>
    <!--首页-->
     <div class="home">
         <!--个人信息头像-->
         <div class="width_100 home_top">
             <i class="fl">
             	<c:if test="${!empty imgUrl}"><img src="${domainName}${imgUrl}" width="120px;" height="120px;"></c:if>
             	<c:if test="${empty imgUrl}"><img src="/assets-new/img/img.jpg"></c:if>
             </i>
             <div class="fl home_name">
                 <h2 class="fo_w fos_1_5 color_333">${user.realName}  欢迎来到熊师傅</h2>
                 <p class="fl text_auto color_666 fos_1_2" style="margin-top:8px;">
                     <span>
                     	<c:if test="${levelCode=='L31'}"><img src="/assets-new/img/xing_5.png"></c:if>
                     	<c:if test="${levelCode=='L32'}"><img src="/assets-new/img/xing_4.png"></c:if>
                     	<c:if test="${levelCode=='L33'}"><img src="/assets-new/img/xing_3.png"></c:if>
                     	<c:if test="${levelCode=='L34'}"><img src="/assets-new/img/xing_2.png"></c:if>
                     	<c:if test="${levelCode=='L35'}"><img src="/assets-new/img/xing_1.png"></c:if>
                     	<c:if test="${levelCode=='L36'||levelCode==''}"><img src="/assets-new/img/xing_0.png"></c:if>
                     </span>
                                        星级
                 </p>
                 <p class="fl text_auto color_666 fos_1_2">
                     <span>
                     	<c:if test="${!empty factProjectNum}">${factProjectNum}</c:if>
                     	<c:if test="${empty factProjectNum}">无</c:if>
                     </span>
                                          在施工数
                 </p>
                 <p class="fl text_auto color_666 fos_1_2">
                     <span>
                     	<c:if test="${!empty totalProjectNum}">${totalProjectNum}</c:if>
                     	<c:if test="${empty totalProjectNum}">无</c:if>
                     </span>
                     	总竣工数
                 </p>
                 <p class="fl text_auto color_666 fos_1_2">
                     <span>
                     	<c:if test="${!empty scoreSort}">${scoreSort}</c:if>
                     	<c:if test="${empty scoreSort}">无</c:if>
                     </span>
                                        本月排名
                 </p>
             </div>
             <a class="ba_ff4a00 color_fff text_auto home_esc" href="javascript:void(0);" onclick="selectHref()">退出</a>
         </div>
         <!--个人导航-->
         <div class="width_100 home_nav daohang">
         	<ul>
         		<c:if test="${werks == '101' }">
         			<li id="wyqd"><a href="/pmProject/pmAchieve" class="ba_00a8ff text_auto color_fff fos_1_6 fl">我要抢单</a></li>
         			<li id="xmbb"><a href="/publish/list" class="ba_f4a000 text_auto color_fff fos_1_6 fl">项目播报</a></li>
       			</c:if>
             	<li id="jdtb"><a href="/process/list" class="ba_e94c40 text_auto color_fff fos_1_6 fl">进度通报</a></li>
             	<li id="xcqd"><a href="/pmProject/projectList" class="ba_85d757 text_auto color_fff fos_1_6 fl mr" style="width:25%;">现场签到</a></li>
             </ul>
         </div>
         <!--通知-->
         <div class="home_letter">
         		<div class="fl">
                    <h2 class="fos_1_2 color_333">
                       <img src="/assets-new/img/xin.png">
                       	待办工作
                   </h2>
                    <p class="home_tab">
                        <span id="workSpan" class="auto fl show color_666 ba_f2f2f2 spantextcolor" onclick="tabSpan('work')">待开工<i class="ba_ff4a00 color_fff ">${workList.size() }</i></span>
                        <span id="zqSpan" class="auto fl show color_666 ba_f2f2f2" onclick="tabSpan('zq')">待中期验收<i class="ba_ff4a00 color_fff ">${zqList.size() }</i></span>
                        <span id="jgSpan" class="auto fl show color_666 ba_f2f2f2 mr" onclick="tabSpan('jg')">待竣工验收<i class="ba_ff4a00 color_fff ">${jgList.size() }</i></span>
                    </p>
                    <ul class="ba_f2f2f2" id="workUL">
                    	<c:forEach items="${workList}" var="item">
                    		<li onclick="clickEvent()">
                    			<a href="/confirmWorkDate/threePath/confirmWorkDatePage?orderNo=${item.orderNo }" class="color_666">
                    			${item.community }-${item.building }-${item.unit }-${item.room }-${item.userName }
                    			</a>
                    		</li>
                    	</c:forEach>
                    </ul>
                    <ul class="ba_f2f2f2 hide"  id="zqUL">
                    	<c:forEach items="${zqList}" var="item">
                    		<li onclick="clickEvent()">
                    			<a href="/process/threePath/toSetProcess?orderNo=${item.orderNo }" class="color_666">
                    			${item.community }-${item.building }-${item.unit }-${item.room }-${item.userName }
                    			</a>
                    		</li>
                    	</c:forEach>
                    </ul>
                    <ul class="ba_f2f2f2 hide"  id="jgUL">
                    	<c:forEach items="${jgList}" var="item">
                    		<li onclick="clickEvent()">
                    			<a href="/process/threePath/toSetProcess?orderNo=${item.orderNo }" class="color_666">
                    			${item.community }-${item.building }-${item.unit }-${item.room }-${item.userName }
                    			</a>
                    		</li>
                    	</c:forEach>
                    </ul>
                </div>
	         <c:if test="${!empty pmMsgs}">
	             <div class="fr">
	                 <h2 class="fos_1_2 color_333">
	                     <img src="/assets-new/img/xin.png">
	                                          消息通知
	                 </h2>
	                 <ul id="messageUL" class="ba_f2f2f2 home_prompt">
	                 	<c:forEach items="${pmMsgs}" var="pmMsg">
	                 		<li>
	                 			<a href="#" data-id="${pmMsg.id}" 
	                 			   <c:if test="${pmMsg.type==1}">class="color_f4a000 msg_list"</c:if>
	                 			   <c:if test="${pmMsg.type==2}">class="color_ff4a00 msg_list"</c:if>
	                 			   <c:if test="${pmMsg.type==3}">class="color_666 msg_list"</c:if>
	                 			   <c:if test="${pmMsg.type==4}">class="color_ff4a00 msg_list"</c:if>>
	                 				<c:if test="${pmMsg.type==1}">重要通知：</c:if>
	                 				<c:if test="${pmMsg.type==2}">紧急通知：</c:if>
	                 				<c:if test="${pmMsg.type==3}">日常通知：</c:if>
	                 				<c:if test="${pmMsg.type==4}">判责罚款：</c:if>
	                 				${pmMsg.title}
								</a>
							</li>
	                 	</c:forEach>
	                 </ul>
	             	</div>
	             </c:if>
             <!-- <div class="fr">
                 <h2 class="fos_1_2 color_333">
                     <img src="/assets-new/img/xin.png">
                                          温馨提示
                 </h2>
                 <ul class="ba_f2f2f2">
                     <li><a href="#" class="color_ff4a00">紧急通知：下周一全国工程检查组就到北京；</a></li>
                     <li><a href="#" class="color_f4a000">紧急通知：下周一全国工程检查组就到北京；</a></li>
                     <li><a href="#" class="color_666">紧急通知：下周一全国工程检查组就到北京；</a></li>
                     <li><a href="#" class="color_666">紧急通知：下周一全国工程检查组就到北京；</a></li>
                     <li><a href="#" class="color_666">紧急通知：下周一全国工程检查组就到北京；</a></li>
                 </ul>
             </div> -->
         </div>
         <!--版本-->
         <div class="edition">
             <hr class="width_100 ba_999"><span class="ba_fff color_999">版本：2.2</span>
         </div>
     </div>
     <div id="msgDetail" style="margin:20px;display:none;">
	     <div>
			<div style="float:left">消息类型：</div>
			<div style="float:left" class="type"></div>
		</div>
		<div style="clear:both;"></div>
		<div>
			<div style="float:left">消息标题：</div>
			<div style="float:left" class="title"></div>
		</div>
		<div style="clear:both;"></div>
		<div>
			<div style="float:left">发布时间：</div>
			<div style="float:left" class="create_date"></div>
		</div>
		<div style="clear:both;"></div>
		<div>
			<div style="float:left">发布人：</div>
			<div style="float:left" class="create_user"></div>
		</div>
		<div style="clear:both;"></div>
		<div>
			<div>消息内容：</div>
			<div style="float:left" class="content_detail"></div>
		</div>
		<div style="clear:both;"></div>
     </div> 
     <script type="text/javascript">
	     function getLocalTime(ns) { 
	    	if(ns!=null&&ns!="") {
		 		var now=new Date(ns); 
		 		var year=now.getFullYear();
		 		var month=(now.getMonth()+1)>=10?(now.getMonth()+1):"0"+(now.getMonth()+1);
		 		var day=now.getDate()>=10?now.getDate():"0"+now.getDate();
		 		var hour=now.getHours()>=10?now.getHours():"0"+now.getHours();
		 		var minute=now.getMinutes()>=10?now.getMinutes():"0"+now.getMinutes();
		 		var second=now.getSeconds()>=10?now.getSeconds():"0"+now.getSeconds(); 
		 		return year+"-"+month+"-"+day+" "+hour+":"+minute+":"+second; 
	    	} else {
	    		return "";
	    	}
	 	}
	    setInterval(function() {
	     		$.ajax({
					url:"/msg/msgs",
					type:"get",
					data:{arg:new Date().valueOf()},
					dataType:"json",
					async:false,
					cache:false,
					success:function(result) {
						if(result!=null) {
							$("#messageUL").empty();
							for(var i=0;i<result.length;i++) {
								var type="",cssStyle="";
	    						if(result[i].type==1) {
	    							type="重要通知：";
	    							cssStyle="color_f4a000 msg_list";
	    						}
	    						if(result[i].type==2) {
	    							type="紧急通知：";
	    							cssStyle="color_ff4a00 msg_list";
	    						}
	    						if(result[i].type==3) {
	    							type="日常通知：";
	    							cssStyle="color_666 msg_list";
	    						}
	    						$("#messageUL").append("<li><a href='#' class='"+cssStyle+"' data-id='"+result[i].id+"'>"+type+result[i].title+"</a></li>");
							}
						}
					}
				});
	     	},600000);
     	$(function() {
     		$("body").delegate(".msg_list","click",function() {
     			var id=$(this).data("id");
     			$(".type").html("");
    			$(".title").html("");
    			$(".create_user").html("");
    			$(".create_date").html("");
    			$(".content_detail").html("");
     			$.ajax({
    				url:"/msg/msgInfo",
    				type:"get",
    				dataType:"json",
    				data:{id:id,arg:new Date().valueOf()},
    				async:false,
    				cache:false,
    				success:function(result) {
    					if(result!=null) {
    						var type="";
    						if(result.type==1) {
    							type="重要通知";
    						}
    						if(result.type==2) {
    							type="紧急通知";
    						}
    						if(result.type==3) {
    							type="日常通知";
    						}
    						$(".type").html(type);
    						$(".title").html(result.title);
    						$(".create_user").html(result.createUser);
    						$(".create_date").html(getLocalTime(result.applyDate));
    						$(".content_detail").html(result.content);
    						$("#msgDetail").css("display","block");
    						 layer.open({
 								type:1,
 								area:["905px","580px"],
 								title:["消息详情","text-align:center;"],
 								closeBtn:1,
 								scrollbar:false,
 								shadeClose:false,
 								content:$("#msgDetail"),
 								btn:["关闭"],
 								btn1:function() {
 									window.location.href="/msg/updateMsg?id="+id;
 								},cancel:function() {
 									window.location.href="/msg/updateMsg?id="+id;
 								}
 							 });
    					}
    				}
    			});
     		});
     	});
     </script>
</body>
</html>
