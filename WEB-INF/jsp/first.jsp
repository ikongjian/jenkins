<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>首页</title>
    <%@ include file="/WEB-INF/jsp/layout/cssjs.jsp"%>
    <style type="text/css">
        .home .houme_work ul .no_inner {
            background: #f9f9f9 none no-repeat scroll 96% center / 1rem auto;
        }
        .home .houme_notice ul .no_inner {
            background: #f9f9f9 none no-repeat scroll 96% center / 1rem auto;
        }
        .content{position:relative;}
        .home .houme_work ul.houmel2,.home .houme_work ul.houmel3,.home .houme_work ul.houmel4,.home .houme_work ul.houmel5,.home .houme_work ul.houmel6 {
            display: none;
        }
    </style>
    <script type="text/javascript" language="javascript">
	function selectHref() {
		if (token != null && token != '') {
			window.location = "/logoutFromApp";
		} else {
			window.location = "/logout";
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
	<%@ include file="/WEB-INF/jsp/layout/menu.jsp"%>
    <!--右侧内容框架-->
    <div class="content">
        <!--首页-->
        <div class="home">
            <!--个人信息头像-->
            <div class="home_top">
                <i>
                	<c:if test="${!empty imgUrl}"><img src="${domainName}${imgUrl}" width="120px;" height="120px;"></c:if>
             		<c:if test="${empty imgUrl}"><img src="/assets-new/4th/img/img.jpg"></c:if>
                </i>
                <div class="home_name">
                    <h2>${user.realName}<span>欢迎来到项目管家</span></h2>
                    <p>
                        <span>
                        	<c:if test="${levelCode=='L31'}"><img src="/assets-new/4th/img/xing_5.png"></c:if>
	                     	<c:if test="${levelCode=='L32'}"><img src="/assets-new/4th/img/xing_4.png"></c:if>
	                     	<c:if test="${levelCode=='L33'}"><img src="/assets-new/4th/img/xing_3.png"></c:if>
	                     	<c:if test="${levelCode=='L34'}"><img src="/assets-new/4th/img/xing_2.png"></c:if>
	                     	<c:if test="${levelCode=='L35'}"><img src="/assets-new/4th/img/xing_1.png"></c:if>
	                     	<c:if test="${levelCode=='L36'||levelCode==''}"><img src="/assets-new/4th/img/xing_0.png"></c:if>
                        </span>星级
                    </p>
                    <p>
                        <span>
	                        <c:if test="${!empty factProjectNum}">${factProjectNum}</c:if>
	                     	<c:if test="${empty factProjectNum}">无</c:if>
                     	</span>在施工数
                    </p>
                    <p>
                        <span>
							<c:if test="${!empty totalProjectNum}">${totalProjectNum}</c:if>
                     		<c:if test="${empty totalProjectNum}">无</c:if>
						</span>总竣工数
                    </p>
                    <p>
                        <span>
                        	<c:if test="${!empty scoreSort}">${scoreSort}</c:if>
                     		<c:if test="${empty scoreSort}">无</c:if>
                        </span>本月排名
                    </p>
                </div>
                <a href="javascript:void(0);" onclick="selectHref()">退出</a>
            </div>
            <!--个人导航-->
            <div class="home_nav">
            	<c:if test="${sessionScope.werks == '101' }">
         			<%--<a href="/pmProject/pmAchieve" class="home_nav1">我要抢单</a>--%>
         			<a href="/publish/list" class="home_nav3">项目播报</a>
       			</c:if>
             	<a href="/process/list" class="home_nav2">进度通报</a>
             	<a href="/pmProject/projectList" class="home_nav4">现场签到</a>
            </div>
            <!--待办-->
            <div class="houme_work">
                <h2 class="houme_title">待办工作</h2>
                <div class="houme_workTab">
                    <p id="workSpan" class="houme_workOver">待开工<small>${workList.size()}</small></p>
                    <p id="zcSpan">待申请主材<small>${zcList.size()}</small></p>
                    <p id="sdSpan">待水电验收<small>${sdList.size()}</small></p>
                    <p id="qzSpan">待墙砖完工<small>${qzList.size()}</small></p>
                    <p id="zqSpan">待中期验收<small>${zqList.size()}</small></p>
                    <p id="jgSpan">待竣工验收<small>${jgList.size()}</small></p>
                </div>
                <!--待开工-->
                <ul class="houmel1" id="workUL">
                    <c:if test="${!empty workList}">
                        <c:forEach items="${workList}" var="item">
                            <li onclick="clickEvent()">
                                <a href="/confirmWorkDate/threePath/confirmWorkDatePage?orderNo=${item.orderNo }">
                                    ${item.community}-${item.building}-${item.unit}-${item.room}-${item.userName}
                                </a>
                            </li>
                        </c:forEach>
                    </c:if>
                    <c:if test="${empty workList}">
                        <li class="no_inner"></li>
                    </c:if>
                </ul>
                <!--待申请主材-->
                <ul class="houmel2" id="zcUL">
                    <c:if test="${!empty zcList}">
                        <c:forEach items="${zcList}" var="item">
                            <li onclick="clickEvent()">
                                <a href="/stuffAccept/threePath/toModifySendTime?projectId=${item.ternr}&batchId=${item.bdart}&areaCode=${item.areaCode}">
                                        ${item.community}-${item.building}-${item.unit}-${item.room}-${item.customName}
                                            &nbsp;&nbsp;<c:if test="${item.bdart=='10'}">主材第一次</c:if><c:if test="${item.bdart=='20'}">主材第二次</c:if>
                                </a>
                            </li>
                        </c:forEach>
                    </c:if>
                    <c:if test="${empty zcList}">
                        <li class="no_inner"></li>
                    </c:if>
                </ul>
                <!--待水电验收-->
                <ul class="houmel3" id="sdUL">
                    <c:if test="${!empty sdList}">
                        <c:forEach items="${sdList}" var="item">
                            <li onclick="clickEvent()">
                                <a href="/process/threePath/toSetProcess?orderNo=${item.orderNo}">
                                        ${item.community}-${item.building}-${item.unit}-${item.room}-${item.userName}
                                </a>
                            </li>
                        </c:forEach>
                    </c:if>
                    <c:if test="${empty sdList}">
                        <li class="no_inner"></li>
                    </c:if>
                </ul>
                <!--待墙砖验收-->
                <ul class="houmel4" id="qzUL">
                    <c:if test="${!empty qzList}">
                        <c:forEach items="${qzList}" var="item">
                            <li onclick="clickEvent()">
                                <a href="/process/threePath/toSetProcess?orderNo=${item.orderNo}">
                                        ${item.community}-${item.building}-${item.unit}-${item.room}-${item.userName}
                                </a>
                            </li>
                        </c:forEach>
                    </c:if>
                    <c:if test="${empty qzList}">
                        <li class="no_inner"></li>
                    </c:if>
                </ul>
                <!--待中期验收-->
                <ul class="houmel5" id="zqUL">
                    <c:if test="${!empty zqList}">
                        <c:forEach items="${zqList}" var="item">
                            <li onclick="clickEvent()">
                                <a href="/process/threePath/toSetProcess?orderNo=${item.orderNo}">
                                        ${item.community}-${item.building}-${item.unit}-${item.room}-${item.userName}
                                </a>
                            </li>
                        </c:forEach>
                    </c:if>
                    <c:if test="${empty zqList}">
                        <li class="no_inner"></li>
                    </c:if>
                </ul>
                <!--待竣工验收-->
                <ul class="houmel6" id="jgUL">
                    <c:if test="${!empty jgList}">
                        <c:forEach items="${jgList}" var="item">
                            <li onclick="clickEvent()">
                                <a href="/process/threePath/toSetProcess?orderNo=${item.orderNo}">
                                ${item.community}-${item.building}-${item.unit}-${item.room}-${item.userName}
                                </a>
                            </li>
                        </c:forEach>
                    </c:if>
                    <c:if test="${empty jgList}">
                        <li class="no_inner"></li>
                    </c:if>
                </ul>
            </div>
            <!--通知-->
            <div class="houme_notice">
                <h2 class="houme_title">消息通知</h2>   
                <ul id="messageUL">
                    <c:if test="${!empty pmMsgs}">
                        <c:forEach items="${pmMsgs}" var="pmMsg">
                            <li>
                                <a href="#" data-id="${pmMsg.id}" class="msg_list">
                                    <c:if test="${pmMsg.type==1}"><span class="colored6c00">［重要通知］</span></c:if>
                                    <c:if test="${pmMsg.type==2}"><span class="colorff0000">［紧急通知］</span></c:if>
                                    <c:if test="${pmMsg.type==3}"><span>［日常通知］</span></c:if>
                                    <c:if test="${pmMsg.type==4}"><span class="color007aff">［判责罚款］</span></c:if>
                                        ${pmMsg.title}
                                </a>
                            </li>
                        </c:forEach>
                    </c:if>
                    <c:if test="${empty pmMsgs}">
                        <li class="no_inner"></li>
                    </c:if>
                </ul>
            </div>
            <!--版本-->
            <div class="edition">
                <hr>
                <span>版本：2.2</span>
            </div>
        </div>
    </div>
    <!--右侧内容框架结束-->
    <div id="msgDetail" style="margin:20px;display:none;">
	     <div>
			<div style="float:left">消息类型：</div>
			<div style="float:left" class="type"></div>
		</div>
		<div style="clear:both;"></div>
		<div>
			<div style="float:left">消息标题：</div>
			<div style="float:left" class="msg_title"></div>
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
								var type="";
	    						if(result[i].type==1) {
	    							type="<span class='colored6c00'>［重要通知］</span>";
	    						}
	    						if(result[i].type==2) {
	    							type="<span class='colorff0000'>［紧急通知］</span>";
	    						}
	    						if(result[i].type==3) {
	    							type="<span>［日常通知］</span>";
	    						}
                                if(result[i].type==4) {
                                    type="<span class='color007aff'>［判责罚款］</span>";
                                }
	    						$("#messageUL").append("<li><a href='#' class='msg_list' data-id='"+result[i].id+"'>"+type+result[i].title+"</a></li>");
							}
						}
					}
				});
	     	},600000);
     	$(function() {
     		$("body").delegate(".msg_list","click",function() {
     			var id=$(this).data("id");
     			$(".type").html("");
    			$(".msg_title").html("");
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
                            if(result.type==4) {
                                type="判责罚款";
                            }
    						$(".type").html(type);
    						$(".msg_title").html(result.title);
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
<script>
    $(".houme_workTab p").click(function(){
        var Tabonum = $(this).index();
        $(".houme_workTab p").removeClass("houme_workOver");
        $(this).addClass("houme_workOver");
        $(".houme_work ul").hide();
        $(this).parent().parent().find("ul").eq(Tabonum).show()
    })
</script>
</html>