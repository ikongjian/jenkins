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
<title>厨房</title>
<link href="<%=basePath%>assets-new/css/designerMeasureTools/css.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="<%=basePath%>assets-new/css/designerMeasureTools/css6.css" media="screen and (min-width: 375px)"> 
<link rel="stylesheet" type="text/css" href="<%=basePath%>assets-new/css/designerMeasureTools/css6plus.css" media="screen and (min-width: 414px)"> 
<script src="<%=basePath%>assets-new/js/designerMeasureTools/jquery.min.js" ></script>
<script src="<%=basePath%>assets-new/js/designerMeasureTools/clgj.js"></script>
<script src="<%=basePath%>assets-new/js/designerMeasureTools/ui/jquery.ui.core.js"></script>
<script src="<%=basePath%>assets-new/js/designerMeasureTools/ui/jquery.ui.datepicker.js"></script>
<script src="<%=basePath%>assets-new/js/designerMeasureTools/ui/i18n/jquery.ui.datepicker-zh-CN.js"></script>
<%-- <link rel="stylesheet" href="<%=basePath%>/assets-new/js/designerMeasureTool/themes/jquery.ui.all.css"/> --%>
</head>
<body>
 
<div class="clgj_nr">
    	<div class="clgj_esc">当前测量区域： <c:if test="${ not empty order.community}">
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
            	    	</c:if>-厨房-
        <c:forEach  items="${stateMap}"  var="map"  > 
        <c:if test="${map.value eq 0}"><span class="clgj_wcl">未测量</span></c:if>
    	<c:if test="${map.value eq 1}"><span class="clgj_wcl">有遗漏</span></c:if>
    	<c:if test="${map.value eq 2}"><span class="clgj_wcl">已测量</span></c:if>
    	</c:forEach> 
    	<a href="/designerMeasureTools/showIndex/${orderNoStr}">测量其他空间</a></div>
        <h6>注意：★为必填项目</h6>
        <!-- 添加和保存两种情况-->
        <c:choose>
        	<c:when test="${erpPaileiDetailsList.size() eq 0 }">
        	<form id="kitchen" action="/designerMeasureTools/three/saveKitchen/${orderNoStr}" method="post">
	           <ul>
	        	 <li>
	            	<h2>厨房阳台拉毛<span>★</span></h2>
	                 <div class="clgj_xz">
                        <input id="lm1" name="1" type="radio" value="有">
                        <label id="lm_s" for="lm1">有</label>                   
                        <input id="lm2" name="1" type="radio" value="无">
                        <label id="lm_n" for="lm2">无</label>    
                        <input type="hidden" name="txtValue"  value="">
                        <input type="hidden" name="name"  value="厨房阳台拉毛">
                        <input type="hidden" name="firstValue"  value="有">
                        <input type="hidden" name="secondValue"  value="无">
                        <input type="hidden" name="required"  value="1">
                        <input type="hidden" name="elementType"  value="0">
                        <input type="hidden" name="sort"  value="0">
                        <input type="hidden" name="type"  value="1">
                        <input type="hidden" name="noteName"  value="">
                        <input type="hidden" name="noteType"  value="0">
                        <input type="hidden" name="position" value="">
                        <input type="hidden" name="updateDate" value="">
                    </div>
                </li> 
               <li>
                    <h2>燃气热水器 <span>★</span></h2>
                    <div class="clgj_xz">
                        <input id="rq_yes" class="input_yes" name="2" type="radio" value="有">
                        <label for="rq_yes">有</label>
                        <input id="rq_no" class="input_no" name="2" type="radio" value="无">
                        <label for="rq_no">无</label>
                        <input type="hidden" name="txtValue"  value="">
                        <input type="hidden" name="firstValue"  value="有">  
                        <input type="hidden" name="name"  value="燃气热水器">
                        <input type="hidden" name="secondValue"  value="无">
                        <input type="hidden" name="required"  value="1">
                        <input type="hidden" name="elementType"  value="0">
                        <input type="hidden" name="sort"  value="1">
                        <input type="hidden" name="type"  value="1">
                        <input type="hidden" name="noteName"  value="建议位置">
                        <input type="hidden" name="noteType"  value="3">
                        <input type="hidden" name="updateDate" value="">
                    </div>
                    <div class="clgj_tx">
                        <span>建议位置</span>
                        <input id="rqAddress" name="position" type="text">
                    </div>
                </li> 
                 <li>
                    <h2>烟机款式</h2>
                    <div class="clgj_xz">
                        <input id="yj_yes" name="3" type="radio" value="直吸">
                        <label for="yj_yes">直吸</label>
                        <input id="yj_no" name="3" type="radio" value="侧吸">
                        <label for="yj_no">侧吸</label>
                        <input type="hidden" name="txtValue"  value=""> 
                        <input type="hidden" name="name"  value="烟机款式">
                        <input type="hidden" name="firstValue"  value="直吸">
                        <input type="hidden" name="secondValue"  value="侧吸">
                        <input type="hidden" name="required"  value="0">
                        <input type="hidden" name="elementType"  value="0">
                        <input type="hidden" name="sort"  value="2">
                        <input type="hidden" name="type"  value="1">
                        <input type="hidden" name="noteName"  value="">
                        <input type="hidden" name="noteType"  value="0">
                        <input type="hidden" name="position" value="">
                        <input type="hidden" name="updateDate" value="">
                    </div>
                </li>
                 <li>
                    <h2>燃气是否改动 <span>★</span></h2>
                    <div class="clgj_xz">
                    <input id="rq_yes" class="input_yes" name="4" type="radio" value="是">
                    <label for="rq_yes">是</label>
                    <input id="rq_no" class="input_no" name="4" type="radio" value="否">
                    <label for="rq_no">否</label>
                    <input type="hidden" name="txtValue"  value=""> 
                    <input type="hidden" name="name"  value="燃气是否改动">
                    <input type="hidden" name="firstValue"  value="是">
                    <input type="hidden" name="secondValue"  value="否">
                    <input type="hidden" name="required"  value="1">
                    <input type="hidden" name="elementType"  value="0">
                    <input type="hidden" name="sort"  value="3">
                    <input type="hidden" name="type"  value="1">
                    <input type="hidden" name="noteName"  value="改动时间">
                    <input type="hidden" name="noteType"  value="4">
                    <input type="hidden" name="position" value="">  
                    </div>
                    <div class="clgj_tx">
                    <span>改动时间</span>
                    <input name="updateDate" type="date">
                    </div>
                  </li>  
                    <li>
                      <h2>暖气是否更换 <span>★</span></h2>
                      <div class="clgj_xz">
                      <input id="nq_yes" class="input_yes" name="5" type="radio" value="是">
                      <label for="nq_yes">是</label>
                      <input id="nq_no" class="input_no" name="5" type="radio" value="否">
                      <label for="nq_no">否</label>  
                      <input type="hidden" name="txtValue"  value="">
                      <input type="hidden" name="name"  value="暖气是否更换">
                      <input type="hidden" name="firstValue"  value="是">
                      <input type="hidden" name="secondValue"  value="否">
                      <input type="hidden" name="required"  value="1">
                      <input type="hidden" name="elementType"  value="0">
                      <input type="hidden" name="sort"  value="4">
                      <input type="hidden" name="type"  value="1">
                      <input type="hidden" name="noteName"  value="改动时间">
                      <input type="hidden" name="noteType"  value="4">
                      <input type="hidden" name="position" value="">
                     </div>
                     <div class="clgj_tx">
                       <span>改动时间</span>
                       <input name="updateDate" type="date">
                     </div> 
                  </li>
                  <li>
                    <h2>冰箱位置 </h2>
                      <div class="clgj_xz">
                      <input id="bx_yes" name="6" type="radio" value="厨房">
                      <label for="bx_yes">厨房</label>
                      <input id="bx_no" name="6" type="radio" value="非厨房">
                      <label for="bx_no">非厨房</label>
                      <input type="hidden" name="txtValue"  value="">   
                      <input type="hidden" name="name"  value="冰箱位置">
                      <input type="hidden" name="firstValue"  value="厨房">
                      <input type="hidden" name="secondValue"  value="非厨房">
                      <input type="hidden" name="required"  value="0">
                      <input type="hidden" name="elementType"  value="0">
                      <input type="hidden" name="sort"  value="5">
                      <input type="hidden" name="type"  value="1">
                      <input type="hidden" name="noteName"  value="">
                      <input type="hidden" name="noteType"  value="0">
                      <input type="hidden" name="position" value="">
                      <input type="hidden" name="updateDate" value="">  
                      </div>
                   </li>
                  <li>
                    <h2>厨房电器功能柜 </h2>
                    <div class="clgj_xz">
                    <input id="dq_yes" name="7" type="radio" value="有">
                    <label for="dq_yes">有</label>
                    <input id="dq_no" name="7" type="radio" value="无">
                    <label for="dq_no">无</label>    
                        <input type="hidden" name="txtValue"  value=""> 
                        <input type="hidden" name="name"  value="厨房电器功能柜">
                        <input type="hidden" name="firstValue"  value="有">
                        <input type="hidden" name="secondValue"  value="无">
                        <input type="hidden" name="required"  value="0">
                        <input type="hidden" name="elementType"  value="0">
                        <input type="hidden" name="sort"  value="6">
                        <input type="hidden" name="type"  value="1">
                        <input type="hidden" name="noteName"  value="">
                        <input type="hidden" name="noteType"  value="0">
                        <input type="hidden" name="position" value="">
                        <input type="hidden" name="updateDate" value="">
                    </div>
                </li>
                <li>
                <h2>洗菜盆 </h2>
                <div class="clgj_xz">
                 <input id="xc_yes" name="8" type="radio" value="单">
                 <label for="xc_yes">单</label>
                 <input id="xc_no" name="8" type="radio" value="双">
                 <label for="xc_no">双</label>
                  <input type="hidden" name="txtValue"  value="">   
                  <input type="hidden" name="name"  value="洗菜盆">
                  <input type="hidden" name="firstValue"  value="单">
                  <input type="hidden" name="secondValue"  value="双">
                  <input type="hidden" name="required"  value="0">
                  <input type="hidden" name="elementType"  value="0">
                  <input type="hidden" name="sort"  value="7">
                  <input type="hidden" name="type"  value="1">
                  <input type="hidden" name="noteName"  value="">
                  <input type="hidden" name="noteType"  value="0">
                  <input type="hidden" name="position" value="">
                  <input type="hidden" name="updateDate" value="">
                 </div>
                </li>
                <li>
                  <h2>窗户是否更换 <span>★</span></h2>
                    <div class="clgj_xz">
                    <input id="ch_yes" class="input_yes" name="9" type="radio" value="是">
                    <label for="ch_yes">是</label>
                    <input id="ch_no" class="input_no" name="9" type="radio" value="否">
                    <label for="ch_no">否</label>
                  <input type="hidden" name="txtValue"  value="">   
                  <input type="hidden" name="name"  value="窗户是否更换 ">
                  <input type="hidden" name="firstValue"  value="是">
                  <input type="hidden" name="secondValue"  value="否">
                  <input type="hidden" name="required"  value="1">
                  <input type="hidden" name="elementType"  value="0">
                  <input type="hidden" name="sort"  value="8">
                  <input type="hidden" name="type"  value="1">
                  <input type="hidden" name="noteName"  value="改动时间">
                  <input type="hidden" name="noteType"  value="4">
                  <input type="hidden" name="position" value="">    
                  </div>
                  <div class="clgj_tx">
                    <span>改动时间</span>
                    <input name="updateDate" type="date">
                   </div>
                </li>
                <li>
                  <h2>隔音棉 <span>★</span></h2>
                  <div class="clgj_xz">
                   <input id="gym_yes" name="10" type="radio" value="有">
                   <label for="gym_yes">有</label>
                   <input id="gym_no" name="10" type="radio" value="无">
                   <label for="gym_no">无</label>
                   <input type="hidden" name="txtValue"  value="">  
                  <input type="hidden" name="name"  value="隔音棉  ">
                  <input type="hidden" name="firstValue"  value="有">
                  <input type="hidden" name="secondValue"  value="无">
                  <input type="hidden" name="required"  value="1">
                  <input type="hidden" name="elementType"  value="0">
                  <input type="hidden" name="sort"  value="9">
                  <input type="hidden" name="type"  value="1">
                  <input type="hidden" name="noteName"  value="">
                  <input type="hidden" name="noteType"  value="0">
                  <input type="hidden" name="position" value="">
                  <input type="hidden" name="updateDate" value="">
                  </div>
                </li>
           </ul>
               <h3>客户需求：</h3>
                <textarea name="txtValue"  cols="" rows="" placeholder="请在此输入内容"></textarea>
                 <input type="hidden" name="name"  value="客户需求  ">
                  <input type="hidden" name="firstValue"  value="">
                  <input type="hidden" name="secondValue"  value="">
                  <input type="hidden" name="required"  value="0">
                  <input type="hidden" name="elementType"  value="1">
                  <input type="hidden" name="sort"  value="10">
                  <input type="hidden" name="type"  value="1">
                  <input type="hidden" name="noteName"  value="">
                  <input type="hidden" name="noteType"  value="0">
                  <input type="hidden" name="position" value="">
                  <input type="hidden" name="updateDate" value="">
                <h3>设计师建议：</h3>
                <textarea name="txtValue"  cols="" rows="" placeholder="请在此输入内容"></textarea>
                <input type="hidden" name="name"  value="设计师建议  ">
                  <input type="hidden" name="firstValue"  value="">
                  <input type="hidden" name="secondValue"  value="">
                  <input type="hidden" name="required"  value="0">
                  <input type="hidden" name="elementType"  value="1">
                  <input type="hidden" name="sort"  value="11">
                  <input type="hidden" name="type"  value="1">
                  <input type="hidden" name="noteName"  value="">
                  <input type="hidden" name="noteType"  value="0">
                  <input type="hidden" name="position" value="">
                  <input type="hidden" name="updateDate" value="">
                <input class="clgj_nran"  type="submit" value="保存">
            </form>
            </c:when>
            
            <c:otherwise>
        	<form id="updateKitchen" action="/designerMeasureTools/three/updateKitchen/${orderNoStr}" method="post">
	           <ul>
	        	 <li>
	            	<h2>厨房阳台拉毛 <span>★</span></h2>
	                <div class="clgj_xz">
	                   	<c:if test="${erpPaileiDetailsList[0].txtValue == erpPaileiDetailsList[0].firstValue}">
	                    	<input id="lm1" name="1" type="radio" value="有" checked="checked">
                    		<label id="lm_s" for="lm1">有</label>                   
                    		<input id="lm2" name="1" type="radio" value="无">
                    		<label id="lm_n" for="lm2">无</label>
	                     </c:if>
	                    
	                    <c:if test="${erpPaileiDetailsList[0].txtValue == erpPaileiDetailsList[0].secondValue}">
	                        <input id="lm1" name="1" type="radio" value="有">
	                        <label id="lm_s" for="lm1">有</label>
	                    	<input id="lm2" name="1" type="radio" value="无"  checked="checked" >
	                    	<label id="lm_n" for="lm2">无</label>
	                    </c:if>
	                    <c:if test="${empty erpPaileiDetailsList[0].txtValue and erpPaileiDetailsList[0].elementType eq 0}">
	                        <input id="lm1" name="1" type="radio" value="有">
	                        <label id="lm_s" for="lm1">有</label>
	                    	<input id="lm2" name="1" type="radio" value="无">
	                    	<label id="lm_n" for="lm2">无</label>
	                    </c:if>
	                    <input type="hidden" name="id"  value="${erpPaileiDetailsList[0].id}">
	                    <input type="hidden" name="txtValue"  value="${erpPaileiDetailsList[0].txtValue}"> 
	                    <input type="hidden" name="position"  value="${erpPaileiDetailsList[0].position}">
	                    <input type="hidden" name="updateDate" value="${erpPaileiDetailsList[0].updateDate}"> 
	                </div>
	            </li> 
	            <li>
	            	<h2>燃气热水器 <span>★</span></h2>
	                <div class="clgj_xz">
	                <c:if test="${erpPaileiDetailsList[1].txtValue == erpPaileiDetailsList[1].firstValue}">
	                    <input id="rq_yes" class="input_yes" name="2" type="radio" value="有" checked="checked">
                    	<label for="rq_yes">有</label>
                    	<input id="rq_no" class="input_no" name="2" type="radio" value="无">
                    	<label for="rq_no">无</label>	
	                </c:if>
	                <c:if test="${erpPaileiDetailsList[1].txtValue == erpPaileiDetailsList[1].secondValue}">
	                    <input id="rq_yes" class="input_yes" name="2" type="radio" value="有" >
                    	<label for="rq_yes">有</label>
                    	<input id="rq_no" class="input_no" name="2" type="radio" value="无" checked="checked">
                    	<label for="rq_no">无</label>
	                </c:if>
	                <c:if test="${empty erpPaileiDetailsList[1].txtValue and erpPaileiDetailsList[1].elementType eq 0}">
	                    <input id="rq_yes" class="input_yes" name="2" type="radio" value="有" >
                    	<label for="rq_yes">有</label>
                    	<input id="rq_no" class="input_no" name="2" type="radio" value="无" >
                    	<label for="rq_no">无</label>
	                </c:if>
	                    <input type="hidden" name="id"  value="${erpPaileiDetailsList[1].id}">
	                    <input type="hidden" name="txtValue"  value="${erpPaileiDetailsList[1].txtValue}">
	                    <input type="hidden" name="updateDate"  value="${erpPaileiDetailsList[1].updateDate}">
	                </div>
	                	<div class="clgj_tx">
	                		<span>建议位置</span>
	                    	<input id="rqAddress" name="position" type="text" value="${erpPaileiDetailsList[1].position}">
	                	</div>
	            </li>  
	               <li>
	            	<h2>烟机款式</h2>
	                <div class="clgj_xz">
	                <c:if test="${erpPaileiDetailsList[2].txtValue == erpPaileiDetailsList[2].firstValue}">
	                    <input id="yj_yes" name="3" type="radio" value="直吸" checked="checked">
                    	<label for="yj_yes">直吸</label>
                   		<input id="yj_no" name="3" type="radio" value="侧吸">
                    	<label for="yj_no">侧吸</label>	
	                </c:if>
	                <c:if test="${erpPaileiDetailsList[2].txtValue == erpPaileiDetailsList[2].secondValue}">
	                    <input id="yj_yes" name="3" type="radio" value="直吸">
                    	<label for="yj_yes">直吸</label>
                   		<input id="yj_no" name="3" type="radio" value="侧吸" checked="checked">
                    	<label for="yj_no">侧吸</label>	
	                </c:if>
	                 <c:if test="${empty erpPaileiDetailsList[2].txtValue and erpPaileiDetailsList[2].elementType eq 0}">
	                    <input id="yj_yes" name="3" type="radio" value="直吸">
                    	<label for="yj_yes">直吸</label>
                   		<input id="yj_no" name="3" type="radio" value="侧吸">
                    	<label for="yj_no">侧吸</label>	
	                 </c:if>
	                
	                    <input type="hidden" name="id"  value="${erpPaileiDetailsList[2].id}">
	                    <input type="hidden" name="txtValue"  value="${erpPaileiDetailsList[2].txtValue}">
	                    <input type="hidden" name="position"  value="${erpPaileiDetailsList[2].position}">
	                    <input type="hidden" name="updateDate"  value="${erpPaileiDetailsList[2].updateDate}">
	                  </div>
	            </li> 
	            <li>
	            	<h2>燃气是否改动 <span>★</span></h2>
	                <div class="clgj_xz">
	                <c:if test="${erpPaileiDetailsList[3].txtValue == erpPaileiDetailsList[3].firstValue}">
	                    <input id="rq_yes" class="input_yes" name="4" type="radio" value="是" checked="checked">
                    	<label for="rq_yes">是</label>
                    	<input id="rq_no" class="input_no" name="4" type="radio" value="否">
                    	<label for="rq_no">否</label>
	                </c:if>
	                <c:if test="${erpPaileiDetailsList[3].txtValue == erpPaileiDetailsList[3].secondValue}">
	                    <input id="rq_yes" class="input_yes" name="4" type="radio" value="是">
                    	<label for="rq_yes">是</label>
                    	<input id="rq_no" class="input_no" name="4" type="radio" value="否" checked="checked">
                    	<label for="rq_no">否</label>
	                </c:if> 
	                <c:if test="${empty erpPaileiDetailsList[3].txtValue and erpPaileiDetailsList[3].elementType eq 0}">
	                    <input id="rq_yes" class="input_yes" name="4" type="radio" value="是">
                    	<label for="rq_yes">是</label>
                    	<input id="rq_no" class="input_no" name="4" type="radio" value="否">
                    	<label for="rq_no">否</label>
	                </c:if>  
	                    <input type="hidden" name="id"  value="${erpPaileiDetailsList[3].id}">
	                    <input type="hidden" name="txtValue"  value="${erpPaileiDetailsList[3].txtValue}">
	                    <input type="hidden" name="position"  value="${erpPaileiDetailsList[3].position}">
	                </div>
	               		<div class="clgj_tx">
	                		<span>改动时间</span>
	                    	<input id="rqDate" name="updateDate" type="date" value="<fmt:formatDate value="${erpPaileiDetailsList[3].updateDate}" pattern="yyyy-MM-dd"/>">
	                	</div>
	            </li>
	            <li>
	            	<h2>暖气是否更换 <span>★</span></h2>
	                <div class="clgj_xz">
	                <c:if test="${erpPaileiDetailsList[4].txtValue == erpPaileiDetailsList[4].firstValue}">
	            	    <input id="nq_yes" class="input_yes" name="5" type="radio" value="是" checked="checked">
                    	<label for="nq_yes">是</label>
                   		<input id="nq_no" class="input_no" name="5" type="radio" value="否">
                    	<label for="nq_no">否</label>
	                 </c:if> 
	                 <c:if test="${erpPaileiDetailsList[4].txtValue == erpPaileiDetailsList[4].secondValue}">
	                    <input id="nq_yes" class="input_yes" name="5" type="radio" value="是">
                    	<label for="nq_yes">是</label>
                   		<input id="nq_no" class="input_no" name="5" type="radio" value="否" checked="checked">
                    	<label for="nq_no">否</label>
	                 </c:if>  
	                 <c:if test="${empty erpPaileiDetailsList[4].txtValue and erpPaileiDetailsList[4].elementType eq 0}">
	                    <input id="nq_yes" class="input_yes" name="5" type="radio" value="是">
                    	<label for="nq_yes">是</label>
                   		<input id="nq_no" class="input_no" name="5" type="radio" value="否">
                    	<label for="nq_no">否</label>		
	                 </c:if>
	                    <input type="hidden" name="id"  value="${erpPaileiDetailsList[4].id}">
	                    <input type="hidden" name="txtValue"  value="${erpPaileiDetailsList[4].txtValue}">
	                    <input type="hidden" name="position"  value="${erpPaileiDetailsList[4].position}">
	                </div>
	                <div class="clgj_tx">
	                	<span>改动时间</span>
	                    <input id="nqDate" name="updateDate" type="date" value="<fmt:formatDate value="${erpPaileiDetailsList[4].updateDate}" pattern="yyyy-MM-dd"/>">
	                </div>
	                   
	            </li>
	            <li>
	            	<h2>冰箱位置 </h2>
	                <div class="clgj_xz">
	                <c:if test="${erpPaileiDetailsList[5].txtValue == erpPaileiDetailsList[5].firstValue}">
	                    <input id="bx_yes" name="6" type="radio" value="厨房" checked="checked">
                    	<label for="bx_yes">厨房</label>
                    	<input id="bx_no" name="6" type="radio" value="非厨房">
                    	<label for="bx_no">非厨房</label>	
	                </c:if>  
	                <c:if test="${erpPaileiDetailsList[5].txtValue == erpPaileiDetailsList[5].secondValue}">
	                    <input id="bx_yes" name="6" type="radio" value="厨房">
                    	<label for="bx_yes">厨房</label>
                    	<input id="bx_no" name="6" type="radio" value="非厨房" checked="checked">
                    	<label for="bx_no">非厨房</label>	
	                </c:if> 
	                <c:if test="${empty erpPaileiDetailsList[5].txtValue and erpPaileiDetailsList[5].elementType eq 0}">
	                    <input id="bx_yes" name="6" type="radio" value="厨房">
                    	<label for="bx_yes">厨房</label>
                    	<input id="bx_no" name="6" type="radio" value="非厨房">
                    	<label for="bx_no">非厨房</label>
	                </c:if>
	                    <input type="hidden" name="id"  value="${erpPaileiDetailsList[5].id}">
	                    <input type="hidden" name="txtValue"  value="${erpPaileiDetailsList[5].txtValue}">
	                    <input type="hidden" name="position"  value="${erpPaileiDetailsList[5].position}">
	                    <input type="hidden" name="updateDate"  value="${erpPaileiDetailsList[5].updateDate}">
	                </div>
	            </li>
	            <li>
	            	<h2>厨房电器功能柜 </h2>
	                <div class="clgj_xz">
	                   <c:if test="${erpPaileiDetailsList[6].txtValue == erpPaileiDetailsList[6].firstValue}">
	                    	 <input id="dq_yes" name="7" type="radio" value="有" checked="checked">
                    		 <label for="dq_yes">有</label>
                    		 <input id="dq_no" name="7" type="radio" value="无">
                    		 <label for="dq_no">无</label>		
	                    </c:if>
	                    <c:if test="${erpPaileiDetailsList[6].txtValue == erpPaileiDetailsList[6].secondValue}">
	                   		 <input id="dq_yes" name="7" type="radio" value="有">
                    		 <label for="dq_yes">有</label>
                    		 <input id="dq_no" name="7" type="radio" value="无" checked="checked">
                    		 <label for="dq_no">无</label>		
	                    </c:if>
 						<c:if test="${empty erpPaileiDetailsList[6].txtValue and erpPaileiDetailsList[6].elementType eq 0}">
 							 <input id="dq_yes" name="7" type="radio" value="有">
                    		 <label for="dq_yes">有</label>
                    		 <input id="dq_no" name="7" type="radio" value="无">
                    		 <label for="dq_no">无</label>	
 						</c:if>	
 						<input type="hidden" name="id"  value="${erpPaileiDetailsList[6].id}">
	                    <input type="hidden" name="txtValue"  value="${erpPaileiDetailsList[6].txtValue}">
	                    <input type="hidden" name="position"  value="${erpPaileiDetailsList[6].position}">
	                    <input type="hidden" name="updateDate"  value="${erpPaileiDetailsList[6].updateDate}">                  
	                </div>
	            </li>
	            <li>
	            	<h2>洗菜盆 </h2>
	                <div class="clgj_xz">
	                 <c:if test="${erpPaileiDetailsList[7].txtValue == erpPaileiDetailsList[7].firstValue}">
	                    <input id="xc_yes" name="8" type="radio" value="单" checked="checked">
                    	<label for="xc_yes">单</label>
                    	<input id="xc_no" name="8" type="radio" value="双">
                    	<label for="xc_no">双</label>
	                 </c:if>
	                 <c:if test="${erpPaileiDetailsList[7].txtValue == erpPaileiDetailsList[7].secondValue}">
	                    <input id="xc_yes" name="8" type="radio" value="单">
                    	<label for="xc_yes">单</label>
                    	<input id="xc_no" name="8" type="radio" value="双" checked="checked">
                    	<label for="xc_no">双</label>
	                 </c:if> 
	                 <c:if test="${empty erpPaileiDetailsList[7].txtValue and erpPaileiDetailsList[7].elementType eq 0}"> 
	                    <input id="xc_yes" name="8" type="radio" value="单">
                    	<label for="xc_yes">单</label>
                    	<input id="xc_no" name="8" type="radio" value="双">
                    	<label for="xc_no">双</label>
	                 </c:if>
	                    <input type="hidden" name="id"  value="${erpPaileiDetailsList[7].id}">
	                    <input type="hidden" name="txtValue"  value="${erpPaileiDetailsList[7].txtValue}">
	                    <input type="hidden" name="position"  value="${erpPaileiDetailsList[7].position}">
	                    <input type="hidden" name="updateDate"  value="${erpPaileiDetailsList[7].updateDate}">
	                </div>
	            </li>
	            <li>
	            	<h2>窗户是否更换 <span>★</span></h2>
	                <div class="clgj_xz">
	                 <c:if test="${erpPaileiDetailsList[8].txtValue == erpPaileiDetailsList[8].firstValue}">
	                    <input id="ch_yes" class="input_yes" name="9" type="radio" value="是" checked="checked">
                    	<label for="ch_yes">是</label>
                    	<input id="ch_no" class="input_no" name="9" type="radio" value="否">
                    	<label for="ch_no">否</label>	
	                 </c:if> 
	                 <c:if test="${erpPaileiDetailsList[8].txtValue == erpPaileiDetailsList[8].secondValue}">
	                    <input id="ch_yes" class="input_yes" name="9" type="radio" value="是">
                    	<label for="ch_yes">是</label>
                    	<input id="ch_no" class="input_no" name="9" type="radio" value="否" checked="checked">
                    	<label for="ch_no">否</label>	
	                  </c:if> 
	                  <c:if test="${empty erpPaileiDetailsList[8].txtValue and erpPaileiDetailsList[8].elementType eq 0}">
	                    <input id="ch_yes" class="input_yes" name="9" type="radio" value="是">
                    	<label for="ch_yes">是</label>
                    	<input id="ch_no" class="input_no" name="9" type="radio" value="否">
                    	<label for="ch_no">否</label>	
	                  </c:if> 
	                    <input type="hidden" name="id"  value="${erpPaileiDetailsList[8].id}">
	                    <input type="hidden" name="txtValue"  value="${erpPaileiDetailsList[8].txtValue}">
	                    <input type="hidden" name="position"  value="${erpPaileiDetailsList[8].position}">
	                </div>
	                	<div class="clgj_tx">
	                		<span>改动时间</span>
	                   		<input id="chDate" name="updateDate" type="date" value="<fmt:formatDate value="${erpPaileiDetailsList[8].updateDate}" pattern="yyyy-MM-dd"/>">
	                	</div>
	            </li>
	            <li>
	            	<h2>隔音棉 <span>★</span></h2>
	                <div class="clgj_xz">
	                <c:if test="${erpPaileiDetailsList[9].txtValue == erpPaileiDetailsList[9].firstValue}">
	                    <input id="gym_yes" name="10" type="radio" value="有" checked="checked">
                    	<label for="gym_yes">有</label>
                    	<input id="gym_no" name="10" type="radio" value="无">
                    	<label for="gym_no">无</label>
                   </c:if>
                   <c:if test="${erpPaileiDetailsList[9].txtValue == erpPaileiDetailsList[9].secondValue}">
	                    <input id="gym_yes" name="10" type="radio" value="有" >
                    	<label for="gym_yes">有</label>
                    	<input id="gym_no" name="10" type="radio" value="无" checked="checked">
                    	<label for="gym_no">无</label>	
	              </c:if> 
	               <c:if test="${empty erpPaileiDetailsList[9].txtValue and erpPaileiDetailsList[9].elementType eq 0}">
	               		<input id="gym_yes" name="10" type="radio" value="有" >
                    	<label for="gym_yes">有</label>
                    	<input id="gym_no" name="10" type="radio" value="无" >
                    	<label for="gym_no">无</label>
	               </c:if>
	                    <input type="hidden" name="id"  value="${erpPaileiDetailsList[9].id}">
	                    <input type="hidden" name="txtValue"  value="${erpPaileiDetailsList[9].txtValue}">
	                    <input type="hidden" name="position"  value="${erpPaileiDetailsList[9].position}">
	                    <input type="hidden" name="updateDate"  value="${erpPaileiDetailsList[9].updateDate}">
	                </div>
	            </li> 
	       		</ul>
		       <h3>客户需求：</h3>
		        <textarea  name="txtValue"  cols="" rows="" placeholder="请在此输入内容">${erpPaileiDetailsList[10].txtValue}</textarea>
		                <input type="hidden" name="id"  value="${erpPaileiDetailsList[10].id}">
	                    <input type="hidden" name="position"  value="${erpPaileiDetailsList[10].position}">
	                    <input type="hidden" name="updateDate"  value="${erpPaileiDetailsList[10].updateDate}">
		        <h3>设计师建议：</h3>
		        <textarea  name="txtValue"  cols="" rows="" placeholder="请在此输入内容">${erpPaileiDetailsList[11].txtValue}</textarea>
		                <input type="hidden" name="id"  value="${erpPaileiDetailsList[11].id}">
	                    <input type="hidden" name="position"  value="${erpPaileiDetailsList[11].position}">
	                    <input type="hidden" name="updateDate" value="${erpPaileiDetailsList[11].updateDate}">
	            
		        <input class="clgj_nran"  type="submit" value="保存">
		    </form>
		   </c:otherwise>
		   </c:choose>
    </div>
    
    		<script type="text/javascript">
				$(document).ready(function() {
					$("input[type=radio]").change(function() {
								$(this).parent().find("input[name=txtValue]").val($(this).val());
											})
									})
	         </script>
    		<!--  <script>
            	$(document).ready(function(){
            		$("#").datepicker({
						dateFormat : 'yyyy-mm-dd',
						changeYear : true,
						minDate:'+21d',
						maxDate:new Date(new Date().getFullYear()+1,11,31)
					});
            	}) 
     		</script> -->
</body>
</html>
