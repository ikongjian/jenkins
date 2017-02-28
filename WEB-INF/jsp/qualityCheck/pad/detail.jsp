<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="en" uri="/enumTag"%>
<title>质检报告详情</title>
<%@ include file="/WEB-INF/jsp/layout/cssjs.jsp"%>
<!-- Add jQuery library -->
	<script type="text/javascript" src="/assets-new/fancyBox/lib/jquery-1.10.2.min.js"></script>
	<!-- Add mousewheel plugin (this is optional) -->
	<script type="text/javascript" src="/assets-new/fancyBox/lib/jquery.mousewheel.pack.js?v=3.1.3"></script>
	<!-- Add fancyBox main JS and CSS files -->
	<script type="text/javascript" src="/assets-new/fancyBox/source/jquery.fancybox.pack.js?v=2.1.5"></script>
	<link rel="stylesheet" type="text/css" href="/assets-new/fancyBox/source/jquery.fancybox.css?v=2.1.5" media="screen" />
	<!-- Add Button helper (this is optional) -->
	<link rel="stylesheet" type="text/css" href="/assets-new/fancyBox/source/helpers/jquery.fancybox-buttons.css?v=1.0.5" />
	<script type="text/javascript" src="/assets-new/fancyBox/source/helpers/jquery.fancybox-buttons.js?v=1.0.5"></script>
	<!-- Add Thumbnail helper (this is optional) -->
	<link rel="stylesheet" type="text/css" href="/assets-new/fancyBox/source/helpers/jquery.fancybox-thumbs.css?v=1.0.7" />
	<script type="text/javascript" src="/assets-new/fancyBox/source/helpers/jquery.fancybox-thumbs.js?v=1.0.7"></script>
	<!-- Add Media helper (this is optional) -->
	<script type="text/javascript" src="/assets-new/fancyBox/source/helpers/jquery.fancybox-media.js?v=1.0.6"></script>
	<script type="text/javascript" src="/assets-new/fancyBox/check_detail.js"></script>
	<style type="text/css">
		.fancybox-custom .fancybox-skin {
			box-shadow: 0 0 50px #222;
		}
	</style>
</head>
	<script type="text/javascript">
	
	    /* $(function(){
	    	//质检报告详情
	    	$(".goods_zk").click(function(e) {
	    		$(this).parent().parent().parent().find(".table_goods").toggle()
	    		$(this).parent().find("a").toggle()
	    	});
	    }); */
		function getDate(parentId,checkId,index){
			var tab = $("#tab01_"+index+"").html();
			if(tab==null||tab.length == 0){
				$.post("/check/getDetailByParentType",
						{parentId:parentId,checkId:checkId},
					function(data){
					  if(data.length>0){
						  var str = "";
						  for (var i = 0; i < data.length; i++) {
							  str += detailList(data[i],i+1);
						  }
						  $("#tab01_"+index+"").html(str);
					  }
				});
			}
		}
		function detailList(data,no){
		  var detailStatus = "";
		  if(data.status == 0){ 
			  detailStatus = "合格";
		  }else{
			  detailStatus = "不合格";
		  }
		  
		  var moneyStr = "";
		  if(data.disposeFine != null && data.disposeFine == 1){
			  moneyStr = "罚款:"+data.disposeMoney+"元  ";
		  }
		  if(data.disposeWarning != null && data.disposeWarning == 1){
			  //警告
			  moneyStr += "警告  ";
		  }
 		  if(data.disposeRectificationNow != null && data.disposeRectificationNow == 1){
			  //现场整改
 			  moneyStr += "现场整改  ";
		  }
 		  if(data.disposeRectificationDelay != null && data.disposeRectificationDelay == 1){
			  //限期整改
			  var date = new Date(data.limitTime);
			  var dateStr = date.getFullYear()+"-"+(date.getMonth()+1)+"-"+date.getDate();
 			  moneyStr += "限期整改："+dateStr;
		  }
 		  
 		  var checkDescription = "";
 		  if(data.status == 1){
 			 checkDescription = data.checkDescription;
 		  }
 		  
/*    <li>
         <div class="zchenck_px">
             <p class="zchenck_p1">1</p>
             <p class="zchenck_p2">施工现场卫生</p>
             <p class="zchenck_p3">不合格</p>
             <p class="zchenck_p4">
                 <a class="goods_zk goods_zk1">详细</a>
                 <a class="goods_zk goods_zk2">收起</a>
             </p>
         </div>
         
         <div class="zchenck_nr">
             <p><span>违规形式：</span>施工现场的危险区域无防护设施或明显标志</p>
             <p><span>处理方式：</span>罚款  200元</p>
         </div>
      </li> */
 		  
		  var str="<li>"+
	        	"<div class='zchenck_px'>"+
	            	"<p class='zchenck_p1'>"+ no +"</p>"+
	                "<p class='zchenck_p2'>"+ data.checkName +"</p>"+
	                "<p class='zchenck_p3'>"+ detailStatus +"</p>"+
	                "<p class='zchenck_p4'>"+
	                    "<a class='goods_zk goods_zk1' onclick=getImg('img_"+data.parentCategoryId +"_"+data.detailId+"','"+data.detailId+"',this)>详细</a>"+
	                    "<a class='goods_zk goods_zk2' onclick=getImg('img_"+data.parentCategoryId +"_"+data.detailId+"','"+data.detailId+"',this)>收起</a>"+
	                "</p>"+
	            "</div>"+
	            "<div class='zchenck_nr table_goods'>"+
	            	"<p><span>违规形式：</span>"+ checkDescription +"</p>"+
	                "<p><span>处理方式：</span>"+ moneyStr +"</p>"+
	                //"<p><span>现场图片：</span></p>"+
	                //"<ul id='img_"+data.parentCategoryId +"_"+data.detailId+"'></ul>"+
	            "</div>"+
	        "</li>";
	        return str;
		}
		
		function detailList_bak(data,no){
			  var detailStatus = "";
			  if(data.status == 0){ 
				  detailStatus = "合格";
			  }else{
				  detailStatus = "不合格";
			  }
			  
			  var moneyStr = "";
			  if(data.disposeFine != null && data.disposeFine == 1){
				  moneyStr = "罚款:"+data.disposeMoney+"元  ";
			  }
			  if(data.disposeWarning != null && data.disposeWarning == 1){
				  //警告
				  moneyStr += "警告  ";
			  }
	 		  if(data.disposeRectificationNow != null && data.disposeRectificationNow == 1){
				  //现场整改
	 			  moneyStr += "现场整改  ";
			  }
	 		  if(data.disposeRectificationDelay != null && data.disposeRectificationDelay == 1){
				  //限期整改
				  var date = new Date(data.limitTime);
				  var dateStr = date.getFullYear()+"-"+(date.getMonth()+1)+"-"+date.getDate();
	 			  moneyStr += "限期整改："+dateStr;
			  }
	 		  
	 		  var checkDescription = "";
	 		  if(data.status == 1){
	 			 checkDescription = data.checkDescription;
	 		  }
			  var str="<li>"+
		        	"<div class='zchenck_px'>"+
		            	"<p class='zchenck_p1'>"+ no +"</p>"+
		                "<p class='zchenck_p2'>"+ data.checkName +"</p>"+
		                "<p class='zchenck_p3'>"+ detailStatus +"</p>"+
		                "<p class='zchenck_p4'>"+
		                    "<a class='goods_zk goods_zk1' onclick=getImg('img_"+data.parentCategoryId +"_"+data.detailId+"','"+data.detailId+"',this)>详细</a>"+
		                    "<a class='goods_zk goods_zk2' onclick=getImg('img_"+data.parentCategoryId +"_"+data.detailId+"','"+data.detailId+"',this)>收起</a>"+
		                "</p>"+
		            "</div>"+
		            "<div class='zchenck_nr table_goods'>"+
		            	"<p><span>违规形式：</span>"+ checkDescription +"</p>"+
		                "<p><span>处理方式：</span>"+ moneyStr +"</p>"+
		                //"<p><span>现场图片：</span></p>"+
		                //"<ul id='img_"+data.parentCategoryId +"_"+data.detailId+"'></ul>"+
		            "</div>"+
		        "</li>";
		        return str;
			}
		
		
		function getImg(imgId,detailId,obj){
			$(obj).parent().parent().parent().find(".table_goods").toggle();
    		$(obj).parent().find(".goods_zk1").toggle();
    		$(obj).parent().find(".goods_zk2").toggle();
			var imgs = $("#"+imgId+"").html();
			if(imgs==null||imgs.length == 0){
				$.post("/check/viewPic",
						{detailId:detailId},
						function(data){
						if(data.length>0){
							var str = "";
							for (var i = 0; i < data.length; i++) {
								str += "<li><img src="+ data[i] +"></li>";
							}
							$("#"+imgId+"").html(str);
						}
				});
			}
		}
	</script>
</head>

<body>

   <!--右侧内容框架-->
   <div class="content" style="width:100%;">
        <!--质检报告-->
        <div class="title" style="width:100%;">
            <h2>质检报告详情</h2>
            <a href="javascript:void(0);" onclick="window.history.go(-1);"><img src="/assets-new/img/esc.png"></a>
        </div>
        <hr class="content_hr">
        <div class="formDetail">
            <ul class="twoColumn">
                <li class="w100">
                    <span>客户信息</span>
                    <p>${order.community }${order.building }-${order.unit }-${order.room }-${order.userName }</p>
                </li>
                <li>
                    <span>质检员</span>
                    <p>${order.qualityChecker }</p>
                </li>
                <li>
                    <span>质检日期</span>
                    <p><fmt:formatDate value="${check.updateTime }" pattern="yyyy-MM-dd HH:mm:ss"/></p>
                </li>
                <li>
                    <span>质检类型</span>
                    <p>
	                    <c:if test="${check.type == 10 }">巡检</c:if>
	                	<c:if test="${check.type == 20 }">约检</c:if>
	                	<c:if test="${check.type == 30 }">线上复检</c:if>
	                	<c:if test="${check.type == 40 }">现场复检</c:if>
                    </p>
                </li>
                <li>
                    <span>检察人</span>
                    <p>${info.name }</p>
                </li>
                <li>
                    <span>验收日期</span>
                    <p><fmt:formatDate value="${check.acceptDate }" pattern="yyyy-MM-dd"/></p>
                </li>
                <li>
                    <span>实际得分</span>
                    <%-- <p>${score }/${scoreTotal}</p> --%>
                    <p>${score }</p>
                </li>
                <li>
                    <span>现场照片</span>
                    <p>
	                    <!-- <a class="fancybox" href="${DOMAIN_NAME }${imgList[0].imgUrl}" data-fancybox-group="gallery" 
	            			title="Lorem ipsum dolor sit amet">  -->
	            		<a class="fancybox-buttons" data-fancybox-group="button" href="${DOMAIN_NAME }${imgList[0].imgUrl}">
	            			<!-- <img src="demo/1_s.jpg" alt="" /> -->
	            			<c:if test="${not empty imgList }">${imgList.size() }张    查看照片</c:if>
	            		</a>
	            		<c:forEach var="item" items="${imgList }" varStatus="status">
	            			<c:if test="${status.index > 0 }">
	            				<a class="fancybox-buttons" data-fancybox-group="button" href="${DOMAIN_NAME }${item.imgUrl}"></a>
	            			</c:if>
	            		</c:forEach>
	            		<c:if test="${empty imgList }">0张</c:if>
                    </p>
                </li>
            </ul>
        </div>
        <!--质检报告内详情 tab-->
        <div class="qaTab">
            <!-- <ul class="zcheck_tab">
                <li id="tab011" onClick="set('tab01',1,6)" class="hover" >现场文明施工</li>
                <li id="tab012" onClick="set('tab01',2,6)">成品保护</li>
                <li id="tab013" onClick="set('tab01',3,6)">施工安全、材料码放</li>
                <li id="tab014" onClick="set('tab01',4,6)">工艺规范：水电</li>
                <li id="tab015" onClick="set('tab01',5,6)">工艺规范：瓦工</li>
                <li id="tab016" onClick="set('tab01',6,6)">工艺规范：木工</li>
            </ul> -->
           <ul class="zcheck_tab"> 
            <c:forEach var="item" items="${categoryList }" varStatus="status">
           		<li id="tab01${status.index+1 }" 
           			onClick="set('tab01',${status.index+1 },${categorySize});getDate('${item.id }','${check.id }','${status.index+1 }')"
           			<c:if test="${status.index == 0 }">class="hover"</c:if>>
           			${item.parentCategoryName }
           		</li>
            </c:forEach>
           </ul>
        </div>
        <!--质检报告内详情TAB内容-->
        <div class="zcheck_text">
            <ul id="tab01_1">
                <!-- <li>
                    <div class="zchenck_px">
                        <p class="zchenck_p1">1</p>
                        <p class="zchenck_p2">施工现场卫生</p>
                        <p class="zchenck_p3">不合格</p>
                        <p class="zchenck_p4">
                            <a class="goods_zk goods_zk1">详细</a>
                            <a class="goods_zk goods_zk2">收起</a>
                        </p>
                    </div>
                    
                    <div class="zchenck_nr">
                        <p><span>违规形式：</span>施工现场的危险区域无防护设施或明显标志</p>
                        <p><span>处理方式：</span>罚款  200元</p>
                    </div>
                </li> -->
             <c:forEach var="item" items="${checkDetails }" varStatus="status">
         		<li>
                   	<div class="zchenck_px">
                       	<p class="zchenck_p1">${status.index+1 }</p>
                        <p class="zchenck_p2">${item.checkName }</p>
                        <p class="zchenck_p3">
                           	<c:if test="${item.status == 0 }">合格</c:if>
                           	<c:if test="${item.status == 1 }">不合格</c:if>
                        </p>
                        <p class="zchenck_p4">
                               <a class="goods_zk goods_zk1" onclick="getImg('img_${item.parentCategoryId }_${item.detailId}','${item.detailId}',this)" style="display: inline;">详细</a>
                               <a class="goods_zk goods_zk2" onclick="getImg('img_${item.parentCategoryId }_${item.detailId}','${item.detailId}',this)" style="display: none;">收起</a>
                        </p>
                     </div>
                     
                     <div  class="zchenck_nr table_goods">
                       	<p><span>违规形式：</span>
                       		<c:if test="${item.status == 1 }">${item.checkDescription }</c:if>
                       	</p>
                        <p><span>处理方式：</span>
                           	<c:if test="${not empty item.disposeFine and item.disposeFine == 1}">罚款:${item.disposeMoney }元&nbsp;&nbsp;</c:if>
                           	<c:if test="${not empty item.disposeWarning and item.disposeWarning == 1}">警告&nbsp;&nbsp;</c:if>
                           	<c:if test="${not empty item.disposeRectificationNow and item.disposeRectificationNow == 1}">现场整改&nbsp;&nbsp;</c:if>
                           	<c:if test="${not empty item.disposeRectificationDelay and item.disposeRectificationDelay == 1}">
                           		限期整改:<fmt:formatDate value="${item.limitTime }" pattern="yyyy-MM-dd"/>
                           	</c:if>
                           </p>
                           <p><span>现场图片：</span></p>
                           <ul id="img_${item.parentCategoryId }_${item.detailId}"></ul>
                     </div>
                </li>
            </c:forEach>
                
            </ul>
            
            <!-- <ul id="tab01_2" style="display:none;">
                <li>
                    <div class="zchenck_px">
                        <p class="zchenck_p1">1</p>
                        <p class="zchenck_p2">施工现场卫生</p>
                        <p class="zchenck_p3">不合格</p>
                        <p class="zchenck_p4">
                            <a class="goods_zk goods_zk1">详细</a>
                            <a class="goods_zk goods_zk2">收起</a>
                        </p>
                    </div>
                    <div class="zchenck_nr">
                        <p><span>违规形式：</span>施工现场的危险区域无防护设施或明显标志</p>
                        <p><span>处理方式：</span>罚款  200元</p>
                    </div>
                </li>
            </ul> -->

            <!-- 处理第二个及以上的  质检分类  -->
            <c:forEach var="item" items="${categoryList }" varStatus="status">
                <c:if test="${status.index >= 1 }">
                	<ul id="tab01_${status.index+1 }" style="display:none;"></ul>
                </c:if>
            </c:forEach>
            
        </div>
    </div>
    <!--右侧内容框架结束-->
    
        <!--本页JS-->
    <script>
        /* $(function () {
            //隐藏返回按钮
            $(".nav").css("left","-16%");
            $(".nav").removeClass("animate");
            $(".content,.title").css("width","100%");
            $(".goods_zk").click(function(e) {
                $(this).parent().parent().parent().find(".zchenck_nr").toggle()
                $(this).parent().find("a").toggle()
            });
        }); */
        //质检报告内详情 tab
        function set(name, cursel, n) {
            for (i = 1; i <= n; i++) {
                var menu = document.getElementById(name + i);
                var con = document.getElementById(name + "_" + i);
                menu.className = i == cursel ? "hover" : "";
                con.style.display = i == cursel ? "block" : "none";
            }
        }
        function showList(id, num) {
            if (num == 1) {
                document.getElementById(id).style.display = "block";
            }
            else {
                document.getElementById(id).style.display = "none";
            }
        }
    </script>

</body>

<%-- <body>
	<!--3级页面框架-->
    <div class="right frame">
    	<!--头部-->
    	<header>
        	<h6>质检报告列表</h6>
        	<a href="javascript:void(0);" onclick="window.history.go(-1);"><img src="/assets-new/img/esc.png"></a>
        </header>
        <div class="content">
        	<!--质检报告详情-->
            <div class="zcheck">
            	<p class="w100"><span>客户信息：</span>${order.community }${order.building }-${order.unit }-${order.room }-${order.userName }</p>
                <p><span>质检日期：</span><fmt:formatDate value="${check.updateTime }" pattern="yyyy-MM-dd HH:mm:ss"/></p>
                <p><span>质  检 员：</span>${order.qualityChecker }</p>
                <p><span>检      查 人：</span>${info.name }</p>
                <p><span>质检类型：</span>
                	<c:if test="${check.type == 10 }">巡检</c:if>
                	<c:if test="${check.type == 20 }">约检</c:if>
                	<c:if test="${check.type == 30 }">线上复检</c:if>
                	<c:if test="${check.type == 40 }">现场复检</c:if>
                </p>
                <p><span>实际得分：</span>${score }/${scoreTotal }</p>
                <p><span>验收日期：</span><fmt:formatDate value="${check.acceptDate }" pattern="yyyy-MM-dd"/></p>
            	<p><span>现场照片：</span>
            		<!-- <a class="fancybox" href="${DOMAIN_NAME }${imgList[0].imgUrl}" data-fancybox-group="gallery" 
            			title="Lorem ipsum dolor sit amet">  -->
            		<a class="fancybox-buttons" data-fancybox-group="button" href="${DOMAIN_NAME }${imgList[0].imgUrl}">
            			<!-- <img src="demo/1_s.jpg" alt="" /> -->
            			<c:if test="${not empty imgList }">${imgList.size() }张    查看照片</c:if>
            		</a>
            		<c:forEach var="item" items="${imgList }" varStatus="status">
            			<c:if test="${status.index > 0 }">
            				<a class="fancybox-buttons" data-fancybox-group="button" href="${DOMAIN_NAME }${item.imgUrl}"></a>
            			</c:if>
            		</c:forEach>
            		<c:if test="${empty imgList }">0张</c:if>
            	</p>
            </div>
            <!--质检报告详情TAB-->
            <div class="zcheck_tab">
            	<c:forEach var="item" items="${categoryList }" varStatus="status">
            		<p id="tab01${status.index+1 }" 
            			onClick="set('tab01',${status.index+1 },${categorySize});getDate('${item.id }','${check.id }','${status.index+1 }')"
            			<c:if test="${status.index == 0 }">class="z_hover"</c:if>>
            			${item.parentCategoryName }
            		</p>
            	</c:forEach>
            	<!-- <p id="tab011" onClick="set('tab01',1,6)" class="z_hover" >现场文明施工</p>
                <p id="tab012" onClick="set('tab01',2,6)">成品保护</p>
                <p id="tab013" onClick="set('tab01',3,6)">施工安全、材料码放</p>
                <p id="tab014" onClick="set('tab01',4,6)">工艺规范：水电</p>
                <p id="tab015" onClick="set('tab01',5,6)">工艺规范：瓦工</p>
                <p id="tab016" onClick="set('tab01',6,6)">工艺规范：木工</p> -->
            </div>
            <!--质检报告内详情TAB内容-->
            <div class="zcheck_text">
            	<c:if test="${not empty categoryList }">
	            	<ul id="tab01_1">
            			<c:forEach var="item" items="${checkDetails }" varStatus="status">
            				<li>
		                    	<div class="zchenck_px">
		                        	<p class="zchenck_p1">${status.index+1 }</p>
		                            <p class="zchenck_p2">${item.checkName }</p>
		                            <p class="zchenck_p3">
		                            	<c:if test="${item.status == 0 }">合格</c:if>
		                            	<c:if test="${item.status == 1 }">不合格</c:if>
		                            </p>
		                            <p class="zchenck_p4">
		                                <a href="javascript:void(0);" class="goods_zk goods_zk1" onclick="getImg('img_${item.parentCategoryId }_${item.detailId}','${item.detailId}',this)">详细</a>
		                                <a href="javascript:void(0);" class="goods_zk goods_zk2" onclick="getImg('img_${item.parentCategoryId }_${item.detailId}','${item.detailId}',this)">收起</a>
		                            </p>
		                        </div>
		                        <div class="zchenck_nr table_goods">
		                        	<p><span>违规形式：</span>
		                        		<c:if test="${item.status == 1 }">${item.checkDescription }</c:if>
		                        	</p>
		                            <p><span>处理方式：</span>
		                            	<c:if test="${not empty item.disposeFine and item.disposeFine == 1}">罚款:${item.disposeMoney }元&nbsp;&nbsp;</c:if>
		                            	<c:if test="${not empty item.disposeWarning and item.disposeWarning == 1}">警告&nbsp;&nbsp;</c:if>
		                            	<c:if test="${not empty item.disposeRectificationNow and item.disposeRectificationNow == 1}">现场整改&nbsp;&nbsp;</c:if>
		                            	<c:if test="${not empty item.disposeRectificationDelay and item.disposeRectificationDelay == 1}">
		                            		限期整改:<fmt:formatDate value="${item.limitTime }" pattern="yyyy-MM-dd"/>
		                            	</c:if>
		                            </p>
		                            <p><span>现场图片：</span></p>
		                            <ul id="img_${item.parentCategoryId }_${item.detailId}"></ul>
		                        </div>
		                    </li>
            			</c:forEach>
	                </ul>
                </c:if>
                <c:forEach var="item" items="${categoryList }" varStatus="status">
                	<c:if test="${status.index >= 1 }">
                		<ul id="tab01_${status.index+1 }" style="display:none;"></ul>
                	</c:if>
            	</c:forEach>
               <!--  
                <ul id="tab01_3" style="display:none;"></ul>
                <ul id="tab01_4" style="display:none;"></ul>
                <ul id="tab01_5" style="display:none;"></ul>
                <ul id="tab01_6" style="display:none;"></ul> -->
            </div>
        </div>
    </div>
</body> --%>

