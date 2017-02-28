<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="/pageTag" prefix="page"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" name="viewport">
<meta content="no-cache" http-equiv="pragma">
<meta content="no-cache" http-equiv="cache-control">
<meta content="0" http-equiv="expires">
<title>测量工具</title>
<link href="<%=basePath%>assets-new/css/designerMeasureTools/css.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="<%=basePath%>assets-new/css/designerMeasureTools/css6.css" media="screen and (min-width: 375px)"> 
<link rel="stylesheet" type="text/css" href="<%=basePath%>assets-new/css/designerMeasureTools/css6plus.css" media="screen and (min-width: 414px)"> 
<script src="<%=basePath%>assets-new/js/designerMeasureTools/jquery.min.js" ></script>
<script src="<%=basePath%>assets-new/js/designerMeasureTools/clgj.js"></script>
</head>
<body>
<div class="clgj_home">
    	<div class="clgj_esc">当前测量用户：
    	                <c:if test="${ not empty order.community}">
            	        	${order.community}
            	   		</c:if>
            	    	<c:if test="${ not empty order.building}">
            	        	-${order.building}
            	    	</c:if>
            	    	<c:if test="${ not empty order.unit}">
            	        	-${order.unit}
            	    	</c:if>
            	    	<c:if test="${ not empty order.room}">
            	        	-${order.room}
            	    	</c:if>
            	    	<c:if test="${ not empty order.userName}">
            	        	-${order.userName}
            	    	</c:if>
    	<a href="/designerMeasureTools/show">重新选择</a></div>
        <h1>点击各空间开始测量</h1>
        <div class="clgj_ts">
        	<p class="clgj_tsp1">未测量</p>
            <p class="clgj_tsp2">有遗漏</p>
            <p class="clgj_tsp3">已测量</p>
        </div>
         <ul class="clgj_an">
        	<li class="clgj_li1">
            	<a href="/designerMeasureTools/showKitchen/${orderNoStr}">
                	<p>厨房</p>
                		<c:if test="${stateList[1] eq 0 }">
                    		<!--提示未测量-->
                    		<b><img src="<%=basePath%>/assets-new/img/designerMeasureTools/2.png"></b>
                    	</c:if>
                   		<c:if test="${stateList[1] eq 1}">
                    		<!--提示有遗漏-->
                    		<b><img src="<%=basePath%>/assets-new/img/designerMeasureTools/3.png"></b>
                    	</c:if>
                     	<c:if test="${stateList[1] eq 2}">
                    		<!--提示已测量-->
                    		<b><img src="<%=basePath%>/assets-new/img/designerMeasureTools/4.png"></b>
                    	</c:if> 
                </a>
            </li>
            <li  class="clgj_li2">
            	<a href="/designerMeasureTools/showBathroom/${orderNoStr}">
                	<p>卫生间</p>
                    	<c:if test="${stateList[2] eq 0 }">
                    		<!--提示未测量-->
                    		<b><img src="<%=basePath%>/assets-new/img/designerMeasureTools/2.png"></b>
                    	</c:if>
                   		<c:if test="${stateList[2] eq 1}">
                    		<!--提示有遗漏-->
                    		<b><img src="<%=basePath%>/assets-new/img/designerMeasureTools/3.png"></b>
                    	</c:if>
                     	<c:if test="${stateList[2] eq 2}">
                    		<!--提示已测量-->
                    		<b><img src="<%=basePath%>/assets-new/img/designerMeasureTools/4.png"></b>
                    	</c:if> 
                </a>
            </li>
            <li  class="clgj_li3">
            	<a href="/designerMeasureTools/showDrawingAndDiningRoom/${orderNoStr}">
                	<p>餐客厅</p>
                    	<c:if test="${stateList[3] eq 0 }">
                    		<!--提示未测量-->
                    		<b><img src="<%=basePath%>/assets-new/img/designerMeasureTools/2.png"></b>
                    	</c:if>
                   		<c:if test="${stateList[3] eq 1}">
                    		<!--提示有遗漏-->
                    		<b><img src="<%=basePath%>/assets-new/img/designerMeasureTools/3.png"></b>
                    	</c:if>
                     	<c:if test="${stateList[3] eq 2}">
                    		<!--提示已测量-->
                    		<b><img src="<%=basePath%>/assets-new/img/designerMeasureTools/4.png"></b>
                    	</c:if> 
                </a>
            </li>
            <li  class="clgj_li4">
            	<a href="/designerMeasureTools/showDoorHall/${orderNoStr}">
                	<p>门厅</p>
                    	<c:if test="${stateList[4] eq 0 }">
                    		<!--提示未测量-->
                    		<b><img src="<%=basePath%>/assets-new/img/designerMeasureTools/2.png"></b>
                    	</c:if>
                   		<c:if test="${stateList[4] eq 1}">
                    		<!--提示有遗漏-->
                    		<b><img src="<%=basePath%>/assets-new/img/designerMeasureTools/3.png"></b>
                    	</c:if>
                     	<c:if test="${stateList[4] eq 2}">
                    		<!--提示已测量-->
                    		<b><img src="<%=basePath%>/assets-new/img/designerMeasureTools/4.png"></b>
                    	</c:if> 
                </a>
            </li>
            <li  class="clgj_li5">
            	<a href="/designerMeasureTools/showBedroom/${orderNoStr}">
                	<p>卧室</p>
                   		<c:if test="${stateList[5] eq 0 }">
                    		<!--提示未测量-->
                    		<b><img src="<%=basePath%>/assets-new/img/designerMeasureTools/2.png"></b>
                    	</c:if>
                   		<c:if test="${stateList[5] eq 1}">
                    		<!--提示有遗漏-->
                    		<b><img src="<%=basePath%>/assets-new/img/designerMeasureTools/3.png"></b>
                    	</c:if>
                     	<c:if test="${stateList[5] eq 2}">
                    		<!--提示已测量-->
                    		<b><img src="<%=basePath%>/assets-new/img/designerMeasureTools/4.png"></b>
                    	</c:if> 
                </a>
            </li>
            <li  class="clgj_li6">
            	<a href="/designerMeasureTools/showDiy/${orderNoStr}">
                	<p>个性化需求</p> 
                </a>
            </li>
        </ul>
        <div class="clgj_dx">
        
        <c:choose>
        <c:when test="${erpPaileiDetailsList.size() >0 }">
             
              <form id="updateIndex" action="/designerMeasureTools/updatePreview/${orderNoStr}" method="post">
            	<p class="clgj_dx_p">
            	<span>工程地址：</span>
                <input name="txtValue" type="text" value="${erpPailei.projectAddress}">
                  <input type="hidden" name="id"  value="${erpPailei.id}">
           
            <p class="clgj_dx_p">
            	<span>房本面积：</span>
                <input name="txtValue" type="text" value="${erpPailei.fangbenArea}">
               <input type="hidden" name="id"  value="${erpPailei.id}">
            </p>
            <p class="clgj_dx_p">
            	<span>套内面积：</span>
                <input name="txtValue" type="text" value="${erpPailei.taoneiArea}">
	            	<input type="hidden" name="id"  value="${erpPailei.id}">
            </p>
             <p class="clgj_dx_p">
            	<span>风格：</span>
                <input name="txtValue" type="text" value="${erpPailei.style}">
	            <input type="hidden" name="id"  value="${erpPailei.id}">
            </p>
            <p>
            	<span>业主性别：</span>
            	<c:if test="${erpPailei.gender eq 1}">
            		<input id="xb_n" name="1" type="radio" value="1" checked="checked">
                	<label for="xb_n">男</label>
                	<input id="xb_v" name="1" type="radio" value="0">
                	<label for="xb_v">女</label>
            	</c:if>
            	<c:if test="${erpPailei.gender eq 0}">
            		<input id="xb_n" name="1" type="radio" value="1">
                	<label for="xb_n">男</label>
                	<input id="xb_v" name="1" type="radio" value="0" checked="checked">
                	<label for="xb_v">女</label>
            	</c:if>
                        <input type="hidden" name="id"  value="${erpPailei.id}">
	                    <input type="hidden" name="txtValue"  value="${erpPailei.gender}">
            </p>
        	<p>
            	<span>能否在规定时间开工：</span>
            		<c:if test="${erpPaileiDetailsList[0].txtValue == erpPaileiDetailsList[0].firstValue}">
	                    	<input id="kg_yes" name="2" type="radio" value="是" checked="checked">
                           	<label for="kg_yes">是</label>
               			    <input id="kg_no" name="2" type="radio" value="否">
                            <label for="kg_no">否</label>
	                     </c:if>
	                    
	                    <c:if test="${erpPaileiDetailsList[0].txtValue == erpPaileiDetailsList[0].secondValue}">
	                       <input id="kg_yes" name="2" type="radio" value="是" >
                           	<label for="kg_yes">是</label>
               			    <input id="kg_no" name="2" type="radio" value="否" checked="checked">
                            <label for="kg_no">否</label>
	                    </c:if>
	                    <c:if test="${empty erpPaileiDetailsList[0].txtValue and erpPaileiDetailsList[0].elementType eq 0}">
	                        <input id="kg_yes" name="2" type="radio" value="是">
                           	<label for="kg_yes">是</label>
               			    <input id="kg_no" name="2" type="radio" value="否">
                            <label for="kg_no">否</label>
	                    </c:if>
                        <input type="hidden" name="id"  value="${erpPaileiDetailsList[0].id}">
	                    <input type="hidden" name="txtValue"  value="${erpPaileiDetailsList[0].txtValue}">
 
            </p>
            <p>
            	<span>是否有电梯：</span>
            	     <c:if test="${erpPaileiDetailsList[1].txtValue == erpPaileiDetailsList[1].firstValue}">
	                    <input id="dt_yes" name="21" type="radio" value="是" checked="checked">
                		<label for="dt_yes">是</label>
               			 <input id="dt_no" name="21" type="radio" value="否">
               			 <label for="dt_no">否</label>
	                </c:if>
	                <c:if test="${erpPaileiDetailsList[1].txtValue == erpPaileiDetailsList[1].secondValue}">
	                     <input id="dt_yes" name="21" type="radio" value="是" >
                		<label for="dt_yes">是</label>
               			 <input id="dt_no" name="21" type="radio" value="否" checked="checked">
               			 <label for="dt_no">否</label>
	                </c:if>
	                <c:if test="${empty erpPaileiDetailsList[1].txtValue and erpPaileiDetailsList[1].elementType eq 0}">
	                    <input id="dt_yes" name="21" type="radio" value="是" >
                		<label for="dt_yes">是</label>
               			 <input id="dt_no" name="21" type="radio" value="否">
               			 <label for="dt_no">否</label>
	                </c:if>
	                    <input type="hidden" name="id"  value="${erpPaileiDetailsList[1].id}">
	                    <input type="hidden" name="txtValue"  value="${erpPaileiDetailsList[1].txtValue}">
	                 
            </p>
            <p>
            	<span>是否六环内：</span>
            	    <c:if test="${erpPaileiDetailsList[2].txtValue == erpPaileiDetailsList[2].firstValue}">
	                      <input id="lh_yes" name="3" type="radio" value="是" checked="checked">
                		  <label for="lh_yes">是</label>
                          <input id="lh_no" name="3" type="radio" value="否">
                          <label for="lh_no">否</label>
	                </c:if>
	                <c:if test="${erpPaileiDetailsList[2].txtValue == erpPaileiDetailsList[2].secondValue}">
	                    <input id="lh_yes" name="3" type="radio" value="是" >
                		  <label for="lh_yes">是</label>
                          <input id="lh_no" name="3" type="radio" value="否" checked="checked">
                          <label for="lh_no">否</label>
	                </c:if>
	                <c:if test="${empty erpPaileiDetailsList[2].txtValue and erpPaileiDetailsList[2].elementType eq 0}">
	                    <input id="lh_yes" name="3" type="radio" value="是" >
                		  <label for="lh_yes">是</label>
                          <input id="lh_no" name="3" type="radio" value="否">
                          <label for="lh_no">否</label>
	                </c:if>
	                    <input type="hidden" name="id"  value="${erpPaileiDetailsList[2].id}">
	                    <input type="hidden" name="txtValue"  value="${erpPaileiDetailsList[2].txtValue}">
              
            </p>
            <p>
            	<span>厨房推拉门是否需要垭口：</span>
            	    <c:if test="${erpPaileiDetailsList[3].txtValue == erpPaileiDetailsList[3].firstValue}">
	                     <input id="cf_yes" name="4" type="radio" value="是" checked="checked">
                		 <label for="cf_yes">是</label>
               			 <input id="cf_no" name="4" type="radio" value="否">
                		 <label for="cf_no">否</label>
	                </c:if>
	                <c:if test="${erpPaileiDetailsList[3].txtValue == erpPaileiDetailsList[3].secondValue}">
	                     <input id="cf_yes" name="4" type="radio" value="是" >
                		 <label for="cf_yes">是</label>
               			 <input id="cf_no" name="4" type="radio" value="否" checked="checked">
                		 <label for="cf_no">否</label>
	                </c:if>
	                 <c:if test="${empty erpPaileiDetailsList[3].txtValue and erpPaileiDetailsList[3].elementType eq 0}">
	                     <input id="cf_yes" name="4" type="radio" value="是" >
                		 <label for="cf_yes">是</label>
               			 <input id="cf_no" name="4" type="radio" value="否">
                		 <label for="cf_no">否</label>
	                 </c:if>
	                
	                    <input type="hidden" name="id"  value="${erpPaileiDetailsList[3].id}">
	                    <input type="hidden" name="txtValue"  value="${erpPaileiDetailsList[3].txtValue}">
  
            </p>
            <b id="home_ts"></b>
            <h2>其他补充：</h2>
            <textarea name="txtValue" cols="" rows="" placeholder="请在此输入内容">${erpPaileiDetailsList[4].txtValue}</textarea>
             <input type="hidden" name="id"  value="${erpPaileiDetailsList[4].id}">
            <h2>设计师建议：</h2>
             <textarea name="txtValue" cols="" rows="" placeholder="请在此输入内容">${erpPaileiDetailsList[5].txtValue}</textarea>
             <input type="hidden" name="id"  value="${erpPaileiDetailsList[5].id}">
            <c:choose>
              		<c:when test="${stateList[1]eq 0 or stateList[1] eq 1}">
              		    <b class="home_no">确认预览</b>
              		 	<b class="home_ts">＊厨房有未填写项目</b>
              		</c:when>
              		<c:otherwise>
              	   <c:choose>
              			<c:when test="${stateList[2]eq 0 or stateList[2] eq 1}">
              			    <b class="home_no">确认预览</b> 
              		 		<b class="home_ts">＊卫生间有未填写项目</b>
              		    </c:when>
              		    <c:otherwise>
              		    <c:choose>
	              		   	<c:when test="${stateList[3]eq 0 or stateList[3] eq 1}">
	              		   	    <b class="home_no">确认预览</b>
	              		 		<b class="home_ts">＊客厅有未填写项目</b>
	              		    </c:when>
              		        <c:otherwise>
              		        <c:choose>
              		        	<c:when test="${stateList[4]eq 0 or stateList[4] eq 1}">
              		        	    <b class="home_no">确认预览</b>
	              		 			<b class="home_ts">＊门厅有未填写项目</b>
	              		        </c:when>
	              		        <c:otherwise>
	              		        <c:choose>
		              		        <c:when test="${stateList[5]eq 0 or stateList[5] eq 1}">
		              		            <b class="home_no">确认预览</b>
		              		 			<b class="home_ts">＊客厅有未填写项目</b>
		              		        </c:when>
		              		        <c:otherwise>
		              		          <input class="home_ok" name="" type="submit" value="确认预览">
		              		        </c:otherwise>
	              		      </c:choose>
	              		        </c:otherwise>
              		        	 </c:choose>	
              		        </c:otherwise>
              		          </c:choose>
              		    </c:otherwise>
              		    </c:choose>
              		</c:otherwise>
              </c:choose>
            </form>
        	</c:when>
        	
        	<c:otherwise>
        	   
              		
              		
             <form id="saveIndex" action="/designerMeasureTools/savePreview/${orderNoStr}" method="post">
            	
            <p class="clgj_dx_p">
            	<span>工程地址：</span>
                <input name="txtValue" type="text" value="${erpPailei.projectAddress}">
                  <input type="hidden" name="id"  value="${erpPailei.id}">
	            	<input type="hidden" name="name"  value="工程地址 ">
	            	<input type="hidden" name="firstValue"  value="是">
	            	<input type="hidden" name="secondValue"  value="否">
	            	<input type="hidden" name="required"  value="1">
	            	<input type="hidden" name="elementType"  value="0">
	            	<input type="hidden" name="sort"  value="0">
	            	<input type="hidden" name="type"  value="0">
	            	<input type="hidden" name="noteName"  value="">
	            	<input type="hidden" name="noteType"  value="0">
            <p class="clgj_dx_p">
            	<span>房本面积：</span>
                <input name="txtValue" type="text" value="${erpPailei.fangbenArea}">
               <input type="hidden" name="id"  value="${erpPailei.id}">
	            	<input type="hidden" name="name"  value="房本面积 ">
	            	<input type="hidden" name="firstValue"  value="是">
	            	<input type="hidden" name="secondValue"  value="否">
	            	<input type="hidden" name="required"  value="1">
	            	<input type="hidden" name="elementType"  value="0">
	            	<input type="hidden" name="sort"  value="2">
	            	<input type="hidden" name="type"  value="0">
	            	<input type="hidden" name="noteName"  value="">
	            	<input type="hidden" name="noteType"  value="0">
            </p>
            <p class="clgj_dx_p">
            	<span>套内面积：</span>
                <input name="txtValue" type="text" value="${erpPailei.taoneiArea}">
	            	<input type="hidden" name="id"  value="${erpPailei.id}">
	            	<input type="hidden" name="name"  value="套内面积">
	            	<input type="hidden" name="firstValue"  value="是">
	            	<input type="hidden" name="secondValue"  value="否">
	            	<input type="hidden" name="required"  value="1">
	            	<input type="hidden" name="elementType"  value="0">
	            	<input type="hidden" name="sort"  value="3">
	            	<input type="hidden" name="type"  value="0">
	            	<input type="hidden" name="noteName"  value="">
	            	<input type="hidden" name="noteType"  value="0">
            </p>
             <p class="clgj_dx_p">
            	<span>风格：</span>
                <input name="txtValue" type="text" value="${erpPailei.style}">
	            <input type="hidden" name="id"  value="${erpPailei.id}">
	            	<input type="hidden" name="name"  value="能否在规定时间开工 ">
	            	<input type="hidden" name="firstValue"  value="是">
	            	<input type="hidden" name="secondValue"  value="否">
	            	<input type="hidden" name="required"  value="0">
	            	<input type="hidden" name="elementType"  value="0">
	            	<input type="hidden" name="sort"  value="4">
	            	<input type="hidden" name="type"  value="0">
	            	<input type="hidden" name="noteName"  value="">
	            	<input type="hidden" name="noteType"  value="0">
            </p>
            <p>
            	<span>业主性别：</span>
            	<c:if test="${erpPailei.gender eq 1}">
            		<input id="xb_n" name="1" type="radio" value="1" checked="checked">
                	<label for="xb_n">男</label>
                	<input id="xb_v" name="1" type="radio" value="0">
                	<label for="xb_v">女</label>
            	</c:if>
            	<c:if test="${erpPailei.gender eq 0}">
            		<input id="xb_n" name="1" type="radio" value="1">
                	<label for="xb_n">男</label>
                	<input id="xb_v" name="1" type="radio" value="0" checked="checked">
                	<label for="xb_v">女</label>
            	</c:if>
                    <input type="hidden" name="id"  value="${erpPailei.id}">
	                <input type="hidden" name="txtValue"  value="${erpPailei.gender}">
	            	<input type="hidden" name="name"  value="能否在规定时间开工 ">
	            	<input type="hidden" name="firstValue"  value="是">
	            	<input type="hidden" name="secondValue"  value="否">
	            	<input type="hidden" name="required"  value="1">
	            	<input type="hidden" name="elementType"  value="0">
	            	<input type="hidden" name="sort"  value="5">
	            	<input type="hidden" name="type"  value="0">
	            	<input type="hidden" name="noteName"  value="">
	            	<input type="hidden" name="noteType"  value="0">
            </p>
        	<p>
            	<span>能否在规定时间开工：</span>
                <input id="kg_yes" name="2" type="radio" value="是">
                <label for="kg_yes">是</label>
                <input id="kg_no" name="2" type="radio" value="否">
                <label for="kg_no">否</label>
                    <input type="hidden" name="txtValue"  value="">
	            	<input type="hidden" name="name"  value="能否在规定时间开工 ">
	            	<input type="hidden" name="firstValue"  value="是">
	            	<input type="hidden" name="secondValue"  value="否">
	            	<input type="hidden" name="required"  value="1">
	            	<input type="hidden" name="elementType"  value="0">
	            	<input type="hidden" name="sort"  value="5">
	            	<input type="hidden" name="type"  value="0">
	            	<input type="hidden" name="noteName"  value="">
	            	<input type="hidden" name="noteType"  value="0">
 
            </p>
            <p>
            	<span>是否有电梯：</span>
                <input id="dt_yes" name="20" type="radio" value="是">
                <label for="dt_yes">是</label>
                <input id="dt_no" name="20" type="radio" value="否">
                <label for="dt_no">否</label>
                    <input type="hidden" name="txtValue"  value="">
	            	<input type="hidden" name="name"  value="是否有电梯 ">
	            	<input type="hidden" name="firstValue"  value="是">
	            	<input type="hidden" name="secondValue"  value="否">
	            	<input type="hidden" name="required"  value="1">
	            	<input type="hidden" name="elementType"  value="0">
	            	<input type="hidden" name="sort"  value="6">
	            	<input type="hidden" name="type"  value="0">
	            	<input type="hidden" name="noteName"  value="建议">
	            	<input type="hidden" name="noteType"  value="0">	
            </p>
            <p>
            	<span>是否六环内：</span>
                <input id="lh_yes" name="3" type="radio" value="是">
                <label for="lh_yes">是</label>
                <input id="lh_no" name="3" type="radio" value="否">
                <label for="lh_no">否</label>
                    <input type="hidden" name="txtValue"  value="">
	            	<input type="hidden" name="name"  value="是否六环内 ">
	            	<input type="hidden" name="firstValue"  value="是">
	            	<input type="hidden" name="secondValue"  value="否">
	            	<input type="hidden" name="required"  value="1">
	            	<input type="hidden" name="elementType"  value="0">
	            	<input type="hidden" name="sort"  value="7">
	            	<input type="hidden" name="type"  value="0">
	            	<input type="hidden" name="noteName"  value="">
	            	<input type="hidden" name="noteType"  value="0">
            </p>
            <p>
            	<span>厨房推拉门是否需要垭口：</span>
                 <input id="cf_yes" name="4" type="radio" value="是">
                <label for="cf_yes">是</label>
                <input id="cf_no" name="4" type="radio" value="否">
                <label for="cf_no">否</label>
                    <input type="hidden" name="txtValue"  value="">
	            	<input type="hidden" name="name"  value="厨房推拉门是否需要垭口 ">
	            	<input type="hidden" name="firstValue"  value="是">
	            	<input type="hidden" name="secondValue"  value="否">
	            	<input type="hidden" name="required"  value="1">
	            	<input type="hidden" name="elementType"  value="0">
	            	<input type="hidden" name="sort"  value="8">
	            	<input type="hidden" name="type"  value="0">
	            	<input type="hidden" name="noteName"  value="">
	            	<input type="hidden" name="noteType"  value="0">
	            	
            </p>
            <b id="home_ts"></b>
            <h2>其他补充：</h2>
            <textarea name="txtValue" cols="" rows="" placeholder="请在此输入内容"></textarea>
             <input type="hidden" name="note"  value="">
	        <input type="hidden" name="name"  value="其他补充 ">
	   	 	<input type="hidden" name="firstValue"  value="">
	    	<input type="hidden" name="secondValue"  value="">
	   	 	<input type="hidden" name="required"  value="0">
	    	<input type="hidden" name="elementType"  value="1">
	    	<input type="hidden" name="sort"  value="9">
	    	<input type="hidden" name="type"  value="0">
	    	<input type="hidden" name="noteName"  value="">
	    	<input type="hidden" name="noteType"  value="0">
	    	
            <h2>设计师建议：</h2>
            <textarea name="txtValue" cols="" rows="" placeholder="请在此输入内容"></textarea>
             <input type="hidden" name="note"  value="">
	    	<input type="hidden" name="name"  value="设计师建议">
	    	<input type="hidden" name="firstValue"  value="">
	    	<input type="hidden" name="secondValue"  value="">
	    	<input type="hidden" name="required"  value="0">
	    	<input type="hidden" name="elementType"  value="1">
	    	<input type="hidden" name="sort"  value="10">
	    	<input type="hidden" name="type"  value="0">
	    	<input type="hidden" name="noteName"  value="">
	    	<input type="hidden" name="noteType"  value="0">
             
              	<c:choose>
              		<c:when test="${stateList[1]eq 0 or stateList[1] eq 1}">
              		    <b class="home_no">确认预览</b>
              		 	<b class="home_ts">＊厨房有未填写项目</b>
              		</c:when>
              		<c:otherwise>
              	   <c:choose>
              			<c:when test="${stateList[2]eq 0 or stateList[2] eq 1}">
              			    <b class="home_no">确认预览</b> 
              		 		<b class="home_ts">＊卫生间有未填写项目</b>
              		    </c:when>
              		    <c:otherwise>
              		    <c:choose>
	              		   	<c:when test="${stateList[3]eq 0 or stateList[3] eq 1}">
	              		   	    <b class="home_no">确认预览</b>
	              		 		<b class="home_ts">＊客厅有未填写项目</b>
	              		    </c:when>
              		        <c:otherwise>
              		        <c:choose>
              		        	<c:when test="${stateList[4]eq 0 or stateList[4] eq 1}">
              		        	    <b class="home_no">确认预览</b>
	              		 			<b class="home_ts">＊门厅有未填写项目</b>
	              		        </c:when>
	              		        <c:otherwise>
	              		        <c:choose>
		              		        <c:when test="${stateList[5]eq 0 or stateList[5] eq 1}">
		              		            <b class="home_no">确认预览</b>
		              		 			<b class="home_ts">＊客厅有未填写项目</b>
		              		        </c:when>
		              		        <c:otherwise>
		              		          <input class="home_ok" name="" type="submit" value="确认预览">
		              		        </c:otherwise>
	              		      </c:choose>
	              		        </c:otherwise>
              		        	 </c:choose>	
              		        </c:otherwise>
              		          </c:choose>
              		    </c:otherwise>
              		    </c:choose>
              		</c:otherwise>
              </c:choose>
            </form> 
        	</c:otherwise>
        </c:choose>
        
        </div>
    </div>
     <script type="text/javascript">
    $(document).ready(function() {
		$("input[type=radio]").change(function() {
					$(this).parent().find("input[name=txtValue]").val($(this).val());
								})
						})
     </script>
</body>
</html>