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
            	    	</c:if>-卫生间-
       
        <c:forEach  items="${stateMap}"  var="map"  > 
        <c:if test="${map.value eq 0}"><span class="clgj_wcl">未测量</span></c:if>
    	<c:if test="${map.value eq 1}"><span class="clgj_wcl">有遗漏</span></c:if>
    	<c:if test="${map.value eq 2}"><span class="clgj_wcl">已测量</span></c:if>
    	</c:forEach> 
    	<a href="/designerMeasureTools/showIndex/${orderNoStr}">测量其他空间</a></div>
        <h6>注意：★为必填项目</h6>
        
         <c:choose>
        	<c:when test="${erpPaileiDetailsList.size() eq 0 }"> 
        	  <form id="kitchen" action="/designerMeasureTools/three/saveBathroom/${orderNoStr}" method="post">
        <ul>
        	<li>
            	<h2>淋浴房 </h2>
                <div class="clgj_xz">
                    <input id="ly_yes" class="input_yes" name="1" type="radio" value="有">
                    <label for="ly_yes">有</label>
                    <input id="ly_no" class="input_no" name="1" type="radio" value="无">
                    <label for="ly_no">无</label>
                    <input type="hidden" name="txtValue"  value="">
	            	<input type="hidden" name="name"  value="淋浴房 ">
	            	<input type="hidden" name="firstValue"  value="有">
	            	<input type="hidden" name="secondValue"  value="无">
	            	<input type="hidden" name="required"  value="0">
	            	<input type="hidden" name="elementType"  value="0">
	           		<input type="hidden" name="sort"  value="0">
	            	<input type="hidden" name="type"  value="2">
	            	<input type="hidden" name="noteName"  value="建议尺寸">
	            	<input type="hidden" name="noteType"  value="1">
	            	<input type="hidden" name="position" value="">
	            	<input type="hidden" name="updateDate" value="">	
                </div>
                <div class="clgj_tx">
                	<span>建议尺寸</span>
                    <input class="input1" name="length" type="text"><i>长</i>
                    <input class="input1" name="width" type="text"><i>宽</i>
                    <input class="input1" name="high" type="text"><i>高</i>
                </div>
            </li>
            <li>
            	<h2>电热水器 <span>★</span></h2>
                <div class="clgj_xz" style="padding-top:25px;">
                    <input id="rsq_yes" class="input_yes" name="2" type="radio" value="有">
                    <label for="rsq_yes">有</label>
                    <input id="rsq_no" class="input_no" name="2" type="radio" value="无">
                    <label for="rsq_no">无</label>
                <input type="hidden" name="txtValue"  value="">
	            <input type="hidden" name="name"  value="电热水器">
	            <input type="hidden" name="firstValue"  value="有">
	            <input type="hidden" name="secondValue"  value="无">
	            <input type="hidden" name="required"  value="1">
	            <input type="hidden" name="elementType"  value="0">
	            <input type="hidden" name="sort"  value="1">
	            <input type="hidden" name="type"  value="2">
	            <input type="hidden" name="noteName"  value="建议尺寸和位置">
	            <input type="hidden" name="noteType"  value="8">
	            <input type="hidden" name="updateDate" value="">	
                </div>
                <div class="clgj_tx">
                	<span style="margin-bottom:10px;">建议位置</span>
                    <input name="position" type="text"  style="margin-bottom:10px;">
                    <span>建议尺寸</span>
                    <input class="input1" name="length" type="text"><i>长</i>
                    <input class="input1" name="width" type="text"><i>宽</i>
                    <input class="input1" name="high" type="text"><i>高</i>
                </div>
            </li>
            <li>
            	<h2>卫生间干区 <span>★</span></h2>
                <div class="clgj_xz">
                    <input id="wsjgq_yes" name="3" type="radio" value="有下水">
                    <label for="wsjgq_yes">有下水</label>
                    <input id="wsjgq_no" name="3" type="radio" value="无下水">
                    <label for="wsjgq_no">无下水</label>
                    <input type="hidden" name="txtValue"  value="">
	            	<input type="hidden" name="name"  value="卫生间干区">
	            	<input type="hidden" name="firstValue"  value="有下水">
	            	<input type="hidden" name="secondValue"  value="无下水">
	            	<input type="hidden" name="required"  value="1">
	            	<input type="hidden" name="elementType"  value="0">
	            	<input type="hidden" name="sort"  value="2">
	            	<input type="hidden" name="type"  value="2">
	            	<input type="hidden" name="noteName"  value="">
	            	<input type="hidden" name="noteType"  value="0">
	            	<input type="hidden" name="position" value="">
	            	<input type="hidden" name="updateDate" value="">
                    <input type="hidden" name="length" value="">
                    <input type="hidden" name="width" value="">
                    <input type="hidden" name="high" value="">	
                </div>
            </li>
            <li>
            	<h2>卫生间干区 <span>★</span></h2>
                <div class="clgj_xz">
                    <input id="wsjgq_yes1" name="4" type="radio" value="拉毛">
                    <label for="wsjgq_yes1">拉毛</label>
                    <input id="wsjgq_no1" name="4" type="radio" value="无拉毛">
                    <label for="wsjgq_no1">无拉毛</label>
                    <input type="hidden" name="txtValue"  value="">
	            	<input type="hidden" name="name"  value="卫生间干区">
	            	<input type="hidden" name="firstValue"  value="拉毛">
	            	<input type="hidden" name="secondValue"  value="无拉毛">
	            	<input type="hidden" name="required"  value="1">
	            	<input type="hidden" name="elementType"  value="0">
	            	<input type="hidden" name="sort"  value="3">
	            	<input type="hidden" name="type"  value="2">
	            	<input type="hidden" name="noteName"  value="">
	            	<input type="hidden" name="noteType"  value="0">
	            	<input type="hidden" name="position" value="">
	            	<input type="hidden" name="updateDate" value="">
                    <input type="hidden" name="length" value="">
                    <input type="hidden" name="width" value="">
                    <input type="hidden" name="high" value="">	
                </div>
            </li>
            <li>
            	<h2>洗手盆种类 </h2>
                <div class="clgj_xz">
                    <input id="xsp_yes" class="input_yes" name="5" type="radio" value="方">
                    <label for="xsp_yes">方</label>
                    <input id="xsp_no" class="input_no" name="5" type="radio" value="圆">
                    <label for="xsp_no">圆</label>
                    <input type="hidden" name="txtValue"  value="">
	            	<input type="hidden" name="name"  value="洗手盆种类">
	            	<input type="hidden" name="firstValue"  value="方">
	            	<input type="hidden" name="secondValue"  value="圆">
	            	<input type="hidden" name="required"  value="0">
	            	<input type="hidden" name="elementType"  value="0">
	            	<input type="hidden" name="sort"  value="4">
	            	<input type="hidden" name="type"  value="2">
	            	<input type="hidden" name="noteName"  value="">
	            	<input type="hidden" name="noteType"  value="0">
	            	<input type="hidden" name="position" value="">
                    <input type="hidden" name="length" value="">
                    <input type="hidden" name="width" value="">
                    <input type="hidden" name="high" value="">	
                    <input type="hidden" name="updateDate" value="">	
                </div>
            </li>
            <li>
            	<h2>洗衣机 </h2>
                <div class="clgj_xz">
                    <input id="xyj_yes" class="input_yes" name="6" type="radio" value="全自动">
                    <label for="xyj_yes">全自动</label>
                    <input id="xyj_no" class="input_yes" name="6" type="radio" value="滚筒">
                    <label for="xyj_no">滚筒</label>
                    <input type="hidden" name="txtValue"  value="">
	            	<input type="hidden" name="name"  value="洗衣机">
	            	<input type="hidden" name="firstValue"  value="全自动">
	            	<input type="hidden" name="secondValue"  value="滚筒">
	            	<input type="hidden" name="required"  value="0">
	            	<input type="hidden" name="elementType"  value="0">
	            	<input type="hidden" name="sort"  value="5">
	            	<input type="hidden" name="type"  value="2">
	            	<input type="hidden" name="noteName"  value="建议尺寸">
	            	<input type="hidden" name="noteType"  value="1">
	            	<input type="hidden" name="position" value="">
	            	<input type="hidden" name="updateDate" value="">		
                </div>
                <div class="clgj_tx">
                	<span>建议尺寸</span>
                     <input class="input1" name="length" type="text"><i>长</i>
                    <input class="input1" name="width" type="text"><i>宽</i>
                    <input class="input1" name="high" type="text"><i>高</i>
                </div>
            </li>
            <li>
            	<h2>暖气更换 <span>★</span></h2>
                <div class="clgj_xz">
                    <input id="nq_yes" class="input_yes" name="7" type="radio" value="是">
                    <label for="nq_yes">是</label>
                    <input id="nq_no" class="input_no" name="7" type="radio" value="否">
                    <label for="nq_no">否</label>
                    <input type="hidden" name="txtValue"  value="">
	             	<input type="hidden" name="name"  value="暖气更换 ">
	             	<input type="hidden" name="firstValue"  value="是">
	             	<input type="hidden" name="secondValue"  value="否">
	             	<input type="hidden" name="required"  value="1">
	             	<input type="hidden" name="elementType"  value="0">
	             	<input type="hidden" name="sort"  value="6">
	             	<input type="hidden" name="type"  value="2">
	             	<input type="hidden" name="noteName"  value="改动时间">
	             	<input type="hidden" name="noteType"  value="4">
	             	<input type="hidden" name="position" value="">
                	<input type="hidden" name="length" value="">
                 	<input type="hidden" name="width" value="">
                 	<input type="hidden" name="high" value="">		
                </div>
                <div class="clgj_tx">
                	<span>改动时间</span>
                    <input name="updateDate" type="date">
                </div>
            </li>
            <li>
            	<h2>隔音棉 <span>★</span></h2>
                <div class="clgj_xz">
                    <input id="gym_yes" name="8" type="radio" value="有">
                    <label for="gym_yes">有</label>
                    <input id="gym_no" name="8" type="radio" value="无">
                    <label for="gym_no">无</label>
                    <input type="hidden" name="txtValue"  value="">
	            	<input type="hidden" name="name"  value="隔音棉">
	            	<input type="hidden" name="firstValue"  value="有">
	            	<input type="hidden" name="secondValue"  value="无">
	            	<input type="hidden" name="required"  value="1">
	            	<input type="hidden" name="elementType"  value="0">
	            	<input type="hidden" name="sort"  value="7">
	            	<input type="hidden" name="type"  value="2">
	            	<input type="hidden" name="noteName"  value="">
	            	<input type="hidden" name="noteType"  value="0">
	            	<input type="hidden" name="position" value="">
	            	<input type="hidden" name="updateDate" value="">
                    <input type="hidden" name="length" value="">
                    <input type="hidden" name="width" value="">
                    <input type="hidden" name="high" value="">		
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
	            	<input type="hidden" name="name"  value="窗户是否更换">
	            	<input type="hidden" name="firstValue"  value="是">
	            	<input type="hidden" name="secondValue"  value="否">
	            	<input type="hidden" name="required"  value="1">
	            	<input type="hidden" name="elementType"  value="0">
	            	<input type="hidden" name="sort"  value="8">
	            	<input type="hidden" name="type"  value="2">
	            	<input type="hidden" name="noteName"  value="改动时间">
	            	<input type="hidden" name="noteType"  value="4">
	            	<input type="hidden" name="position" value="">
                	<input type="hidden" name="length" value="">
                	<input type="hidden" name="width" value="">
                	<input type="hidden" name="high" value="">	
                </div>
                <div class="clgj_tx">
                	<span>改动时间</span>
                    <input name="updateDate" type="date">
                </div>
            </li>
            
        </ul>
        <h3>客户需求：</h3>
        <textarea name="txtValue" cols="" rows="" placeholder="请在此输入内容"></textarea>
	    <input type="hidden" name="name"  value="客户需求">
	    <input type="hidden" name="firstValue"  value="">
	    <input type="hidden" name="secondValue"  value="">
	    <input type="hidden" name="required"  value="0">
	    <input type="hidden" name="elementType"  value="1">
	    <input type="hidden" name="sort"  value="9">
	    <input type="hidden" name="type"  value="2">
	    <input type="hidden" name="noteName"  value="">
	    <input type="hidden" name="noteType"  value="0">
	    <input type="hidden" name="position" value="">
	    <input type="hidden" name="updateDate" value="">
        <input type="hidden" name="length" value="">
        <input type="hidden" name="width" value="">
        <input type="hidden" name="high" value="">
        <h3>设计师建议：</h3>
        <textarea name="txtValue" cols="" rows="" placeholder="请在此输入内容"></textarea>
        <input type="hidden" name="name"  value="设计师建议">
	    <input type="hidden" name="firstValue"  value="">
	    <input type="hidden" name="secondValue"  value="">
	    <input type="hidden" name="required"  value="0">
	    <input type="hidden" name="elementType"  value="1">
	    <input type="hidden" name="sort"  value="10">
	    <input type="hidden" name="type"  value="2">
	    <input type="hidden" name="noteName"  value="">
	    <input type="hidden" name="noteType"  value="0">
	    <input type="hidden" name="position" value="">
	    <input type="hidden" name="updateDate" value="">
        <input type="hidden" name="length" value="">
        <input type="hidden" name="width" value="">
        <input type="hidden" name="high" value="">
        <input class="clgj_nran"  type="submit" value="保存">
        </form>
       </c:when>
       <c:otherwise>
        	
        <form id="kitchen" action="/designerMeasureTools/three/updateBathroom/${orderNoStr}" method="post">
        <ul>
        	<li>
            	<h2>淋浴房 </h2>
                <div class="clgj_xz">
                <c:if test="${erpPaileiDetailsList[0].txtValue == erpPaileiDetailsList[0].firstValue}">
                    <input id="ly_yes" class="input_yes" name="1" type="radio" value="有" checked="checked">
                    <label for="ly_yes">有</label>
                    <input id="ly_no" class="input_no" name="1" type="radio" value="无">
                    <label for="ly_no">无</label>
                 </c:if>   
                 <c:if test="${erpPaileiDetailsList[0].txtValue == erpPaileiDetailsList[0].secondValue}">
                    <input id="ly_yes" class="input_yes" name="1" type="radio" value="有" >
                    <label for="ly_yes">有</label>
                    <input id="ly_no" class="input_no" name="1" type="radio" value="无" checked="checked">
                    <label for="ly_no">无</label>
                 </c:if>
                 <c:if test="${empty erpPaileiDetailsList[0].txtValue and erpPaileiDetailsList[0].elementType eq 0}">
                    <input id="ly_yes" class="input_yes" name="1" type="radio" value="有" >
                    <label for="ly_yes">有</label>
                    <input id="ly_no" class="input_no" name="1" type="radio" value="无" >
                    <label for="ly_no">无</label>
                 </c:if>
                 	<input type="hidden" name="id"  value="${erpPaileiDetailsList[0].id}">
	             	<input type="hidden" name="txtValue"  value="${erpPaileiDetailsList[0].txtValue}">
	             	<input type="hidden" name="position" value="${erpPaileiDetailsList[0].position}">
	             	<input type="hidden" name="updateDate"  value="${erpPaileiDetailsList[0].updateDate}">
                </div>
                <div class="clgj_tx">
                	<span>建议尺寸</span>
                    <input class="input1" name="length" type="text" value="${erpPaileiDetailsList[0].length}"><i>长</i>
                    <input class="input1" name="width" type="text" value="${erpPaileiDetailsList[0].width}"><i>宽</i>
                    <input class="input1" name="high" type="text" value="${erpPaileiDetailsList[0].high}"><i>高</i>
                </div>
            </li>
            <li>
            	<h2>电热水器 <span>★</span></h2>
                <div class="clgj_xz" style="padding-top:25px;">
                <c:if test="${erpPaileiDetailsList[1].txtValue == erpPaileiDetailsList[1].firstValue}">
                    <input id="rsq_yes" class="input_yes" name="2" type="radio" value="有" checked="checked">
                    <label for="rsq_yes">有</label>
                    <input id="rsq_no" class="input_no" name="2" type="radio" value="无">
                    <label for="rsq_no">无</label>
                </c:if>
                 <c:if test="${erpPaileiDetailsList[1].txtValue == erpPaileiDetailsList[1].secondValue}">
                    <input id="rsq_yes" class="input_yes" name="2" type="radio" value="有">
                    <label for="rsq_yes">有</label>
                    <input id="rsq_no" class="input_no" name="2" type="radio" value="无" checked="checked">
                    <label for="rsq_no">无</label>
                 </c:if>
                 <c:if test="${empty erpPaileiDetailsList[1].txtValue and erpPaileiDetailsList[1].elementType eq 0}">
                    <input id="rsq_yes" class="input_yes" name="2" type="radio" value="有">
                    <label for="rsq_yes">有</label>
                    <input id="rsq_no" class="input_no" name="2" type="radio" value="无" >
                    <label for="rsq_no">无</label>
                 </c:if>
                    <input type="hidden" name="id"  value="${erpPaileiDetailsList[1].id}">
	                <input type="hidden" name="txtValue"  value="${erpPaileiDetailsList[1].txtValue}">
	                <input type="hidden" name="updateDate"  value="${erpPaileiDetailsList[1].updateDate}">
                </div>
                <div class="clgj_tx" >
                	<span style="margin-bottom:10px;">建议位置</span>
                    <input name="position" type="text"  style="margin-bottom:10px;" value="${erpPaileiDetailsList[1].position}">
                    <span>建议尺寸</span>
                    <input class="input1" name="length" type="text" value="${erpPaileiDetailsList[1].length}"><i>长</i>
                    <input class="input1" name="width" type="text" value="${erpPaileiDetailsList[1].width}"><i>宽</i>
                    <input class="input1" name="high" type="text" value="${erpPaileiDetailsList[1].high}"><i>高</i>
                </div>
            </li>
            <li>
            	<h2>卫生间干区 <span>★</span></h2>
                <div class="clgj_xz">
                <c:if test="${erpPaileiDetailsList[2].txtValue == erpPaileiDetailsList[2].firstValue}">
                    <input id="wsjgq_yes" name="3" type="radio" value="有下水" checked="checked">
                    <label for="wsjgq_yes">有下水</label>
                    <input id="wsjgq_no" name="3" type="radio" value="无下水">
                    <label for="wsjgq_no">无下水</label>
                </c:if>
                <c:if test="${erpPaileiDetailsList[2].txtValue == erpPaileiDetailsList[2].secondValue}">
                    <input id="wsjgq_yes" name="3" type="radio" value="有下水" >
                    <label for="wsjgq_yes">有下水</label>
                    <input id="wsjgq_no" name="3" type="radio" value="无下水" checked="checked">
                    <label for="wsjgq_no">无下水</label>
                </c:if>
                <c:if test="${empty erpPaileiDetailsList[2].txtValue and erpPaileiDetailsList[2].elementType eq 0}">
                    <input id="wsjgq_yes" name="3" type="radio" value="有下水">
                    <label for="wsjgq_yes">有下水</label>
                    <input id="wsjgq_no" name="3" type="radio" value="无下水">
                    <label for="wsjgq_no">无下水</label>
                 </c:if>
                    <input type="hidden" name="id"  value="${erpPaileiDetailsList[2].id}">
	                <input type="hidden" name="txtValue"  value="${erpPaileiDetailsList[2].txtValue}">
	                <input type="hidden" name="updateDate" value="${erpPaileiDetailsList[2].updateDate}">
	                <input type="hidden" name="length"  value="${erpPaileiDetailsList[2].length}">
	                <input type="hidden" name="width"  value="${erpPaileiDetailsList[2].width}">
	                <input type="hidden" name="high"  value="${erpPaileiDetailsList[2].high}">
	                <input type="hidden" name="position" value="${erpPaileiDetailsList[2].position}">
                </div>
            </li>
            <li>
            	<h2>卫生间干区 <span>★</span></h2>
                <div class="clgj_xz">
                <c:if test="${erpPaileiDetailsList[3].txtValue == erpPaileiDetailsList[3].firstValue}">
                    <input id="wsjgq_yes1" name="4" type="radio" value="拉毛" checked="checked">
                    <label for="wsjgq_yes1">拉毛</label>
                    <input id="wsjgq_no1" name="4" type="radio" value="无拉毛">
                    <label for="wsjgq_no1">无拉毛</label>
                </c:if>
                 <c:if test="${erpPaileiDetailsList[3].txtValue == erpPaileiDetailsList[3].secondValue}">
                    <input id="wsjgq_yes1" name="4" type="radio" value="拉毛">
                    <label for="wsjgq_yes1">拉毛</label>
                    <input id="wsjgq_no1" name="4" type="radio" value="无拉毛" checked="checked">
                    <label for="wsjgq_no1">无拉毛</label>
                  </c:if>
                <c:if test="${empty erpPaileiDetailsList[3].txtValue and erpPaileiDetailsList[3].elementType eq 0}">
                    <input id="wsjgq_yes1" name="4" type="radio" value="拉毛">
                    <label for="wsjgq_yes1">拉毛</label>
                    <input id="wsjgq_no1" name="4" type="radio" value="无拉毛">
                    <label for="wsjgq_no1">无拉毛</label>
                 </c:if> 
                    <input type="hidden" name="id"  value="${erpPaileiDetailsList[3].id}">
	                <input type="hidden" name="txtValue"  value="${erpPaileiDetailsList[3].txtValue}">
	                <input type="hidden" name="updateDate"  value="${erpPaileiDetailsList[3].updateDate}">
	                <input type="hidden" name="length"  value="${erpPaileiDetailsList[3].length}">
	                <input type="hidden" name="width"  value="${erpPaileiDetailsList[3].width}">
	                <input type="hidden" name="high"  value="${erpPaileiDetailsList[3].high}">
	                <input type="hidden" name="position" value="${erpPaileiDetailsList[3].position}">  
                </div>
            </li>
            <li>
            	<h2>洗手盆种类 </h2>
                <div class="clgj_xz">
                 <c:if test="${erpPaileiDetailsList[4].txtValue == erpPaileiDetailsList[4].firstValue}">
                    <input id="xsp_yes" class="input_yes" name="5" type="radio" value="方" checked="checked">
                    <label for="xsp_yes">方</label>
                    <input id="xsp_no" class="input_no" name="5" type="radio" value="圆">
                    <label for="xsp_no">圆</label>	
                 </c:if>	
                  <c:if test="${erpPaileiDetailsList[4].txtValue == erpPaileiDetailsList[4].secondValue}">
                    <input id="xsp_yes" class="input_yes" name="5" type="radio" value="方" >
                    <label for="xsp_yes">方</label>
                    <input id="xsp_no" class="input_no" name="5" type="radio" value="圆" checked="checked">
                    <label for="xsp_no">圆</label>	
                  </c:if>
                  <c:if test="${empty erpPaileiDetailsList[4].txtValue and erpPaileiDetailsList[4].elementType eq 0}">
                    <input id="xsp_yes" class="input_yes" name="5" type="radio" value="方" >
                    <label for="xsp_yes">方</label>
                    <input id="xsp_no" class="input_no" name="5" type="radio" value="圆">
                    <label for="xsp_no">圆</label>	
                  </c:if>
                    <input type="hidden" name="id"  value="${erpPaileiDetailsList[4].id}">
	                <input type="hidden" name="txtValue"  value="${erpPaileiDetailsList[4].txtValue}">
	                <input type="hidden" name="length"  value="${erpPaileiDetailsList[4].length}">
	                <input type="hidden" name="width"  value="${erpPaileiDetailsList[4].width}">
	                <input type="hidden" name="high"  value="${erpPaileiDetailsList[4].high}">
	                <input type="hidden" name="position" value="${erpPaileiDetailsList[4].position}">
	                <input type="hidden" name="updateDate"  value="${erpPaileiDetailsList[4].updateDate}">   
                </div>
            </li>
            <li>
            	<h2>洗衣机 </h2>
                <div class="clgj_xz">
                <c:if test="${erpPaileiDetailsList[5].txtValue == erpPaileiDetailsList[5].firstValue}">
                     <input id="xyj_yes" class="input_yes" name="6" type="radio" value="全自动" checked="checked">
                     <label for="xyj_yes">全自动</label>
                     <input id="xyj_no" class="input_yes" name="6" type="radio" value="滚筒">
                     <label for="xyj_no">滚筒</label>	
                </c:if>   
                 <c:if test="${erpPaileiDetailsList[5].txtValue == erpPaileiDetailsList[5].secondValue}">
                 	 <input id="xyj_yes" class="input_yes" name="6" type="radio" value="全自动" >
                     <label for="xyj_yes">全自动</label>
                     <input id="xyj_no" class="input_yes" name="6" type="radio" value="滚筒" checked="checked">
                     <label for="xyj_no">滚筒</label>
                 </c:if> 
                 <c:if test="${empty erpPaileiDetailsList[5].txtValue and erpPaileiDetailsList[5].elementType eq 0}">
                 	 <input id="xyj_yes" class="input_yes" name="6" type="radio" value="全自动">
                     <label for="xyj_yes">全自动</label>
                     <input id="xyj_no" class="input_yes" name="6" type="radio" value="滚筒">
                     <label for="xyj_no">滚筒</label>
                 </c:if>
                    <input type="hidden" name="id"  value="${erpPaileiDetailsList[5].id}">
	                <input type="hidden" name="txtValue"  value="${erpPaileiDetailsList[5].txtValue}">
	                <input type="hidden" name="position" value="${erpPaileiDetailsList[5].position}">
	                <input type="hidden" name="updateDate" value="${erpPaileiDetailsList[5].updateDate}">
                </div>
                <div class="clgj_tx">
                	<span>建议尺寸</span>
                    <input class="input1" name="length" type="text" value="${erpPaileiDetailsList[5].length}"><i>长</i>
                    <input class="input1" name="width" type="text" value="${erpPaileiDetailsList[5].width}"><i>宽</i>
                    <input class="input1" name="high" type="text" value="${erpPaileiDetailsList[5].high}"><i>高</i>
                </div>
            </li>
            <li>
            	<h2>暖气更换 <span>★</span></h2>
                <div class="clgj_xz">
                 <c:if test="${erpPaileiDetailsList[6].txtValue == erpPaileiDetailsList[6].firstValue}">
                    <input id="nq_yes" class="input_yes" name="7" type="radio" value="是" checked="checked">
                    <label for="nq_yes">是</label>
                    <input id="nq_no" class="input_no" name="7" type="radio" value="否">
                    <label for="nq_no">否</label>	
                  </c:if> 
                   <c:if test="${erpPaileiDetailsList[6].txtValue == erpPaileiDetailsList[6].secondValue}">
                    <input id="nq_yes" class="input_yes" name="7" type="radio" value="是" >
                    <label for="nq_yes">是</label>
                    <input id="nq_no" class="input_no" name="7" type="radio" value="否" checked="checked">
                    <label for="nq_no">否</label>
                   </c:if>
                   <c:if test="${empty erpPaileiDetailsList[6].txtValue and erpPaileiDetailsList[6].elementType eq 0}">
                    <input id="nq_yes" class="input_yes" name="7" type="radio" value="是" >
                    <label for="nq_yes">是</label>
                    <input id="nq_no" class="input_no" name="7" type="radio" value="否" >
                    <label for="nq_no">否</label>
                   </c:if>
                    <input type="hidden" name="id"  value="${erpPaileiDetailsList[6].id}">
	                <input type="hidden" name="txtValue"  value="${erpPaileiDetailsList[6].txtValue}">
	                <input type="hidden" name="length"  value="${erpPaileiDetailsList[6].length}">
	                <input type="hidden" name="width"  value="${erpPaileiDetailsList[6].width}">
	                <input type="hidden" name="high"  value="${erpPaileiDetailsList[6].high}">
	                <input type="hidden" name="position" value="${erpPaileiDetailsList[6].position}">  
                </div>
                <div id="clgj_nq" class="clgj_tx">
                	<span>改动时间</span>
                    <input name="updateDate" type="date" value="<fmt:formatDate value="${erpPaileiDetailsList[6].updateDate}" pattern="yyyy-MM-dd"/>">
                </div>
            </li>
            <li>
            	<h2>隔音棉 <span>★</span></h2>
                <div class="clgj_xz">
                <c:if test="${erpPaileiDetailsList[7].txtValue == erpPaileiDetailsList[7].firstValue}">
                    <input id="gym_yes" name="8" type="radio" value="有" checked="checked">
                    <label for="gym_yes">有</label>
                    <input id="gym_no" name="8" type="radio" value="无">
                    <label for="gym_no">无</label>
                </c:if>	
                 <c:if test="${erpPaileiDetailsList[7].txtValue == erpPaileiDetailsList[7].secondValue}">
                    <input id="gym_yes" name="8" type="radio" value="有" >
                    <label for="gym_yes">有</label>
                    <input id="gym_no" name="8" type="radio" value="无" checked="checked">
                    <label for="gym_no">无</label>
                 </c:if>
                 <c:if test="${empty erpPaileiDetailsList[7].txtValue and erpPaileiDetailsList[7].elementType eq 0}">
                    <input id="gym_yes" name="8" type="radio" value="有" >
                    <label for="gym_yes">有</label>
                    <input id="gym_no" name="8" type="radio" value="无">
                    <label for="gym_no">无</label>
                 </c:if>
                    <input type="hidden" name="id"  value="${erpPaileiDetailsList[7].id}">
	                <input type="hidden" name="txtValue"  value="${erpPaileiDetailsList[7].txtValue}">
	                <input type="hidden" name="updateDate"  value="${erpPaileiDetailsList[7].updateDate}">
	                <input type="hidden" name="length"  value="${erpPaileiDetailsList[7].length}">
	                <input type="hidden" name="width"  value="${erpPaileiDetailsList[7].width}">
	                <input type="hidden" name="high"  value="${erpPaileiDetailsList[7].high}">
	                <input type="hidden" name="position" value="${erpPaileiDetailsList[7].position}"> 
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
                    <input id="ch_yes" class="input_yes" name="9" type="radio" value="是" >
                    <label for="ch_yes">是</label>
                    <input id="ch_no" class="input_no" name="9" type="radio" value="否" checked="checked">
                    <label for="ch_no">否</label>
                  </c:if>
                   <c:if test="${empty erpPaileiDetailsList[8].txtValue and erpPaileiDetailsList[8].elementType eq 0}">
                    <input id="ch_yes" class="input_yes" name="9" type="radio" value="是" >
                    <label for="ch_yes">是</label>
                    <input id="ch_no" class="input_no" name="9" type="radio" value="否" >
                    <label for="ch_no">否</label>
                   </c:if>
                   <input type="hidden" name="id"  value="${erpPaileiDetailsList[8].id}">
	                <input type="hidden" name="txtValue"  value="${erpPaileiDetailsList[8].txtValue}">
	                <input type="hidden" name="length"  value="${erpPaileiDetailsList[8].length}">
	                <input type="hidden" name="width"  value="${erpPaileiDetailsList[8].width}">
	                <input type="hidden" name="high"  value="${erpPaileiDetailsList[8].high}">
	                <input type="hidden" name="position" value="${erpPaileiDetailsList[8].position}"> 
                </div>
                <div id="clgj_ch" class="clgj_tx">
                	<span>改动时间</span>
                    <input name="updateDate" type="date" value="<fmt:formatDate value="${erpPaileiDetailsList[8].updateDate}" pattern="yyyy-MM-dd"/>">
                </div>
            </li>
            
        </ul>
        <h3>客户需求：</h3>
        <textarea name="txtValue" cols="" rows="" placeholder="请在此输入内容">${erpPaileiDetailsList[9].txtValue}</textarea>
                   <input type="hidden" name="id"  value="${erpPaileiDetailsList[9].id}">
	                <input type="hidden" name="length"  value="${erpPaileiDetailsList[9].length}">
	                <input type="hidden" name="width"  value="${erpPaileiDetailsList[9].width}">
	                <input type="hidden" name="high"  value="${erpPaileiDetailsList[9].high}">
	                <input type="hidden" name="position" value="${erpPaileiDetailsList[9].position}"> 
	                <input type="hidden" name="updateDate"  value="${erpPaileiDetailsList[9].updateDate}">
        <h3>设计师建议：</h3>
        <textarea name="txtValue" cols="" rows="" placeholder="请在此输入内容">${erpPaileiDetailsList[10].txtValue}</textarea>
                     <input type="hidden" name="id"  value="${erpPaileiDetailsList[10].id}">
	                <input type="hidden" name="length"  value="${erpPaileiDetailsList[10].length}">
	                <input type="hidden" name="width"  value="${erpPaileiDetailsList[10].width}">
	                <input type="hidden" name="high"  value="${erpPaileiDetailsList[10].high}">
	                <input type="hidden" name="position" value="${erpPaileiDetailsList[10].position}"> 
	                <input type="hidden" name="updateDate" value="${erpPaileiDetailsList[10].updateDate}">
        <input class="clgj_nran" type="submit" value="保存">
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
    
</body>
</html>
