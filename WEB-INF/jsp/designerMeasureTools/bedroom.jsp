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
<title>卧室</title>
<link href="<%=basePath%>assets-new/css/designerMeasureTools/css.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="<%=basePath%>assets-new/css/designerMeasureTools/css6.css" media="screen and (min-width: 375px)"> 
<link rel="stylesheet" type="text/css" href="<%=basePath%>assets-new/css/designerMeasureTools/css6plus.css" media="screen and (min-width: 414px)"> 
<script src="<%=basePath%>assets-new/js/designerMeasureTools/jquery.min.js" ></script>
<script src="<%=basePath%>assets-new/js/designerMeasureTools/clgj.js"></script>
</head>
<body>
<div class="clgj_nr">
    	<div class="clgj_esc">当前测量区域： <c:if test="${ not empty order.building}">
            	        	${order.community}
            	   		</c:if>
            	    	<c:if test="${ not empty order.community}">
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
            	    	</c:if>-卧室-
        <c:forEach  items="${stateMap}"  var="map"  > 
        <c:if test="${map.value eq 0}"><span class="clgj_wcl">未测量</span></c:if>
    	<c:if test="${map.value eq 1}"><span class="clgj_wcl">有遗漏</span></c:if>
    	<c:if test="${map.value eq 2}"><span class="clgj_wcl">已测量</span></c:if>
    	</c:forEach> 
    	<a href="/designerMeasureTools/showIndex/${orderNoStr}">测量其他空间</a>
    	</div>
        <h6>注意：★为必填项目</h6>
        <c:choose>
       <c:when test="${erpPaileiDetailsList.size() eq 0 }"> 
        <form id="bedroom" action="/designerMeasureTools/three/saveBedroom/${orderNoStr}" method="post">
        <ul>
        	<li>
            	<h2>个性化吊顶 <span>★</span></h2>
                <div class="clgj_xz">
                	<input id="dd_yes" class="input_yes" name="1" type="radio" value="有">
                    <label for="dd_yes">有</label>
                    <input id="dd_no" class="input_no" name="1" type="radio" value="无">
                    <label for="dd_no">无</label>
                    <input type="hidden" name="txtValue"  value="">
	            	<input type="hidden" name="name"  value="个性化吊顶">
	            	<input type="hidden" name="firstValue"  value="有">
	            	<input type="hidden" name="secondValue"  value="无">
	            	<input type="hidden" name="required"  value="1">
	            	<input type="hidden" name="elementType"  value="0">
	            	<input type="hidden" name="sort"  value="0">
	            	<input type="hidden" name="type"  value="5">
	            	<input type="hidden" name="noteName"  value="预算金额">
	            	<input type="hidden" name="noteType"  value="6">
	            	<input type="hidden" name="position" value="">
	            	<input type="hidden" name="updateDate" value="">
                	<input type="hidden" name="length" value="">
                	<input type="hidden" name="width" value="">
                	<input type="hidden" name="high" value="">	
                </div>
                <div class="clgj_tx">
                	<span>预算金额</span>
                    <input name="note" type="text" >
                    <i>元</i>
                </div>
            </li>
            <li>
            	<h2>个性化弱电 <span>★</span></h2>
                <div class="clgj_xz">
                    <input id="rd_yes" class="input_yes" name="2" type="radio" value="有">
                    <label for="rd_yes">有</label>
                    <input id="rd_no" class="input_no" name="2" type="radio" value="无">
                    <label for="rd_no">无</label>
                    <input type="hidden" name="txtValue"  value="">
	            	<input type="hidden" name="name"  value="个性化弱电">
	            	<input type="hidden" name="firstValue"  value="有">
	            	<input type="hidden" name="secondValue"  value="无">
	            	<input type="hidden" name="required"  value="1">
	            	<input type="hidden" name="elementType"  value="0">
	            	<input type="hidden" name="sort"  value="1">
	            	<input type="hidden" name="type"  value="5">
	            	<input type="hidden" name="noteName"  value="预算金额">
	            	<input type="hidden" name="noteType"  value="6">
	            	<input type="hidden" name="position" value="">
	            	<input type="hidden" name="updateDate" value="">
                	<input type="hidden" name="length" value="">
                	<input type="hidden" name="width" value="">
                	<input type="hidden" name="high" value="">	
                </div>
                <div class="clgj_tx">
                	<span>预算金额</span>
                    <input name="note" type="text" >
                     <i>元</i>
                </div>
            </li>
            <li>
            	<h2>家具 <span>★</span></h2>
                <div class="clgj_xz">
                    <input id="jj_yes" class="input_yes" name="3" type="radio" value="新购">
                    <label for="jj_yes">新购</label>
                    <input id="jj_no" class="input_yes" name="3" type="radio" value="原有">
                    <label for="jj_no">原有</label>
                    <input type="hidden" name="txtValue"  value="">
	            	<input type="hidden" name="name"  value="家具">
	            	<input type="hidden" name="firstValue"  value="新购">
	            	<input type="hidden" name="secondValue"  value="原有">
	            	<input type="hidden" name="required"  value="1">
	            	<input type="hidden" name="elementType"  value="0">
	            	<input type="hidden" name="sort"  value="2">
	            	<input type="hidden" name="type"  value="5">
	            	<input type="hidden" name="noteName"  value="风格">
	            	<input type="hidden" name="noteType"  value="7">
	            	<input type="hidden" name="position" value="">
	            	<input type="hidden" name="updateDate" value="">
                	<input type="hidden" name="length" value="">
                	<input type="hidden" name="width" value="">
                	<input type="hidden" name="high" value="">	
                </div>
                <div class="clgj_tx">
                	<span style="text-align:right">风格</span>
                    <input name="note" type="text" >
                </div>
            </li>
            <li>
            	<h2>双控 <span>★</span></h2>
                <div class="clgj_xz">
                    <input id="sk_yes" class="input_yes" name="4" type="radio" value="需要">
                    <label for="sk_yes">需要</label>
                    <input id="sk_no" class="input_no" name="4" type="radio" value="不需要">
                    <label for="sk_no">不需要</label>
                    <input type="hidden" name="txtValue"  value="">
	            	<input type="hidden" name="name"  value="双控">
	            	<input type="hidden" name="firstValue"  value="需要">
	            	<input type="hidden" name="secondValue"  value="不需要">
	            	<input type="hidden" name="required"  value="1">
	            	<input type="hidden" name="elementType"  value="0">
	            	<input type="hidden" name="sort"  value="3">
	            	<input type="hidden" name="type"  value="5">
	            	<input type="hidden" name="noteName"  value="预算金额">
	            	<input type="hidden" name="noteType"  value="6">
	            	<input type="hidden" name="position" value="">
	            	<input type="hidden" name="updateDate" value="">
                	<input type="hidden" name="length" value="">
                	<input type="hidden" name="width" value="">
                	<input type="hidden" name="high" value="">	
                </div>
                <div class="clgj_tx">
                	<span>预算金额</span>
                    <input name="note" type="text" >
                    <i>元</i>
                </div>
            </li>
            <li>
            	<h2>地面材质  <span>★</span></h2>
                <div class="clgj_xz">
                    <input id="db_yes" name="5" type="radio" value="地板">
                    <label for="db_yes">地板</label>
                    <input id="db_no" name="5" type="radio" value="地砖">
                    <label for="db_no">地砖</label>
                    <input type="hidden" name="txtValue"  value="">
	            	<input type="hidden" name="name"  value="地面材质">
	            	<input type="hidden" name="firstValue"  value="地板">
	            	<input type="hidden" name="secondValue"  value="地砖">
	            	<input type="hidden" name="required"  value="1">
	            	<input type="hidden" name="elementType"  value="0">
	            	<input type="hidden" name="sort"  value="4">
	            	<input type="hidden" name="type"  value="5">
	            	<input type="hidden" name="noteName"  value="">
	            	<input type="hidden" name="noteType"  value="0">
	            	<input type="hidden" name="position" value="">
	            	<input type="hidden" name="updateDate" value="">
                	<input type="hidden" name="length" value="">
                	<input type="hidden" name="width" value="">
                	<input type="hidden" name="high" value="">
                	<input type="hidden" name="note" value="">	
                </div>
            </li>
            <li>
            	<h2>暖气更换 <span>★</span></h2>
                <div class="clgj_xz">
                    <input id="nq_yes" class="input_yes" name="6" type="radio" value="是">
                    <label for="nq_yes">是</label>
                    <input id="nq_no" class="input_no" name="6" type="radio" value="否">
                    <label for="nq_no">否</label>
                    <input type="hidden" name="txtValue"  value="">
	            	<input type="hidden" name="name"  value="暖气更换">
	            	<input type="hidden" name="firstValue"  value="是">
	            	<input type="hidden" name="secondValue"  value="否">
	            	<input type="hidden" name="required"  value="1">
	            	<input type="hidden" name="elementType"  value="0">
	            	<input type="hidden" name="sort"  value="5">
	            	<input type="hidden" name="type"  value="5">
	            	<input type="hidden" name="noteName"  value="改动时间">
	            	<input type="hidden" name="noteType"  value="4">
	            	<input type="hidden" name="position" value="">
                	<input type="hidden" name="length" value="">
                	<input type="hidden" name="width" value="">
                	<input type="hidden" name="high" value="">
                	<input type="hidden" name="note" value="">	
                </div>
                <div class="clgj_tx">
                	<span>改动时间</span>
                    <input name="updateDate" type="date">
                </div>
            </li>
            <li>
            	<h2>飘窗石英石 <span>★</span></h2>
                <div class="clgj_xz">
                    <input id="sys_yes" class="input_yes" name="7" type="radio" value="是">
                    <label for="sys_yes">是</label>
                    <input id="sys_no" class="input_no" name="7" type="radio" value="否">
                    <label for="sys_no">否</label>
                    <input type="hidden" name="txtValue"  value="">
	            	<input type="hidden" name="name"  value="飘窗石英石">
	            	<input type="hidden" name="firstValue"  value="是">
	            	<input type="hidden" name="secondValue"  value="否">
	            	<input type="hidden" name="required"  value="1">
	            	<input type="hidden" name="elementType"  value="0">
	            	<input type="hidden" name="sort"  value="6">
	            	<input type="hidden" name="type"  value="5">
	            	<input type="hidden" name="noteName"  value="预算金额">
	            	<input type="hidden" name="noteType"  value="6">
	            	<input type="hidden" name="position" value="">
                	<input type="hidden" name="length" value="">
                	<input type="hidden" name="width" value="">
                	<input type="hidden" name="high" value="">
                	<input type="hidden" name="updateDate" value="">
                </div>
                <div class="clgj_tx">
                	<span>预算金额</span>
                    <input name="note" type="text" >
                    <i>元</i>
                </div>
            </li>
            <li>
            	<h2>个性化窗帘盒 <span>★</span></h2>
                <div class="clgj_xz">
                    <input id="clh_yes" class="input_yes" name="8" type="radio" value="有">
                    <label for="clh_yes">有</label>
                    <input id="clh_no" class="input_no" name="8" type="radio" value="无">
                    <label for="clh_no">无</label>
                    <input type="hidden" name="txtValue"  value="">
	            	<input type="hidden" name="name"  value="个性化窗帘盒">
	            	<input type="hidden" name="firstValue"  value="有">
	            	<input type="hidden" name="secondValue"  value="无">
	            	<input type="hidden" name="required"  value="1">
	            	<input type="hidden" name="elementType"  value="0">
	            	<input type="hidden" name="sort"  value="7">
	            	<input type="hidden" name="type"  value="5">
	            	<input type="hidden" name="noteName"  value="预算金额">
	            	<input type="hidden" name="noteType"  value="6">
	            	<input type="hidden" name="position" value="">
                	<input type="hidden" name="length" value="">
                	<input type="hidden" name="width" value="">
                	<input type="hidden" name="high" value="">
                	<input type="hidden" name="updateDate" value="">	
                </div>
                <div id="clgj_clh" class="clgj_tx">
                	<span>预算金额</span>
                    <input name="note" type="text">
                    <i>元</i>
                </div>
            </li>
            <li>
            	<h2>个性化强电 <span>★</span></h2>
                <div class="clgj_xz">
                    <input id="qd_yes" class="input_yes" name="9" type="radio" value="有">
                    <label for="qd_yes">有</label> 
                    <input id="yes_no" class="input_no" name="9" type="radio" value="无">
                    <label for="yes_no">无</label>
                    <input type="hidden" name="txtValue"  value="">
	            	<input type="hidden" name="name"  value="个性化强电">
	            	<input type="hidden" name="firstValue"  value="有">
	            	<input type="hidden" name="secondValue"  value="无">
	            	<input type="hidden" name="required"  value="1">
	            	<input type="hidden" name="elementType"  value="0">
	            	<input type="hidden" name="sort"  value="8">
	            	<input type="hidden" name="type"  value="5">
	            	<input type="hidden" name="noteName"  value="预算金额">
	            	<input type="hidden" name="noteType"  value="6">
	            	<input type="hidden" name="position" value="">
                	<input type="hidden" name="length" value="">
                	<input type="hidden" name="width" value="">
                	<input type="hidden" name="high" value="">
                	<input type="hidden" name="updateDate" value="">	
                </div>
                <div class="clgj_tx">
                	<span>预算金额</span>
                    <input name="note" type="text">
                    <i>元</i>
                </div>
            </li>
            <li>
            	<h2>灯位 <span>★</span></h2>
                <div class="clgj_xz">
                    <input id="dw_yes" class="input_yes" name="10" type="radio" value="有">
                    <label for="dw_yes">有</label>
                    <input id="dw_no" class="input_no" name="10" type="radio" value="无">
                    <label for="dw_no">无</label>
                    <input type="hidden" name="txtValue"  value="">
	            	<input type="hidden" name="name"  value="灯位">
	            	<input type="hidden" name="firstValue"  value="有">
	            	<input type="hidden" name="secondValue"  value="无">
	            	<input type="hidden" name="required"  value="1">
	            	<input type="hidden" name="elementType"  value="0">
	            	<input type="hidden" name="sort"  value="9">
	            	<input type="hidden" name="type"  value="5">
	            	<input type="hidden" name="noteName"  value="预算金额">
	            	<input type="hidden" name="noteType"  value="6">
	           	 	<input type="hidden" name="position" value="">
                	<input type="hidden" name="length" value="">
                	<input type="hidden" name="width" value="">
                	<input type="hidden" name="high" value="">
                	<input type="hidden" name="updateDate" value="">	
                </div>
                <div class="clgj_tx">
                	<span>预算金额</span>
                    <input name="note" type="text">
                    <i>元</i>
                </div>
            </li>
            <li>
            	<h2>阳台铺砖及吊顶  <span>★</span></h2>
                <div class="clgj_xz">
                    <input id="pwdd_yes" class="input_yes" name="11" type="radio" value="需要">
                    <label for="pwdd_yes">需要</label>
                    <input id="pwdd_no"  class="input_no" name="11" type="radio" value="不需要">
                    <label for="pwdd_no">不需要</label>	
                    <input type="hidden" name="txtValue"  value="">
	            	<input type="hidden" name="name"  value="阳台铺砖及吊顶 ">
	            	<input type="hidden" name="firstValue"  value="需要">
	            	<input type="hidden" name="secondValue"  value="不需要">
	            	<input type="hidden" name="required"  value="1">
	            	<input type="hidden" name="elementType"  value="0">
	            	<input type="hidden" name="sort"  value="10">
	            	<input type="hidden" name="type"  value="5">
	            	<input type="hidden" name="noteName"  value="预算金额">
	            	<input type="hidden" name="noteType"  value="6">
	            	<input type="hidden" name="position" value="">
                	<input type="hidden" name="length" value="">
                	<input type="hidden" name="width" value="">
                	<input type="hidden" name="high" value="">
                	<input type="hidden" name="updateDate" value="">
                </div>
                <div class="clgj_tx">
                	<span>预算金额</span>
                    <input name="note" type="text" >
                     <i>元</i>
                </div>
            </li>
            <li>
            	<h2>个性化墙面  </h2>
                <div class="clgj_xz">
                    <input id="qm_yes" class="input_yes" name="12" type="radio" value="有">
                    <label for="qm_yes">有</label>
                    <input id="qm_no" class="input_no" name="12" type="radio" value="无">
                    <label for="qm_no">无</label>
                    <input type="hidden" name="txtValue"  value="">
	            	<input type="hidden" name="name"  value="个性化墙面 ">
	            	<input type="hidden" name="firstValue"  value="有">
	            	<input type="hidden" name="secondValue"  value="无">
	            	<input type="hidden" name="required"  value="0">
	            	<input type="hidden" name="elementType"  value="0">
	            	<input type="hidden" name="sort"  value="11">
	            	<input type="hidden" name="type"  value="5">
	            	<input type="hidden" name="noteName"  value="预算金额">
	            	<input type="hidden" name="noteType"  value="6">
	            	<input type="hidden" name="position" value="">
                	<input type="hidden" name="length" value="">
                	<input type="hidden" name="width" value="">
                	<input type="hidden" name="high" value="">
                	<input type="hidden" name="updateDate" value="">
                </div>
                <div class="clgj_tx">
                	<span>预算金额</span>
                    <input name="note" type="text">
                    <i>元</i>
                </div>
            </li>
            <li>
            	<h2>卧室电视是否壁挂 <span>★</span></h2>
                <div class="clgj_xz">
                    <input id="dsbg_yes" class="input_yes" name="13" type="radio" value="挂">
                    <label for="dsbg_yes">挂</label>
                    <input id="dsbg_no" class="input_no" name="13" type="radio" value="不挂">
                    <label for="dsbg_no">不挂</label>
                    <input type="hidden" name="txtValue"  value="">
	            	<input type="hidden" name="name"  value="卧室电视是否壁挂 ">
	            	<input type="hidden" name="firstValue"  value="挂">
	            	<input type="hidden" name="secondValue"  value="不挂">
	            	<input type="hidden" name="required"  value="1">
	            	<input type="hidden" name="elementType"  value="0">
	            	<input type="hidden" name="sort"  value="11">
	            	<input type="hidden" name="type"  value="5">
	            	<input type="hidden" name="noteName"  value="建议">
	            	<input type="hidden" name="noteType"  value="5">
	            	<input type="hidden" name="position" value="">
                	<input type="hidden" name="length" value="">
                	<input type="hidden" name="width" value="">
                	<input type="hidden" name="high" value="">
                	<input type="hidden" name="updateDate" value="">	
                </div>
                <div class="clgj_tx">
                	<span style="text-align:right">建议</span>
                    <input name="note" type="text">
                </div>
            </li>
            
        </ul>
        <h3>客户需求：</h3>
        <textarea name="txtValue" cols="" rows="" placeholder="请在此输入内容"></textarea>
        <input type="hidden" name="note"  value="">
	    <input type="hidden" name="name"  value="客户需求 ">
	    <input type="hidden" name="firstValue"  value="">
	    <input type="hidden" name="secondValue"  value="">
	    <input type="hidden" name="required"  value="0">
	    <input type="hidden" name="elementType"  value="1">
	    <input type="hidden" name="sort"  value="12">
	    <input type="hidden" name="type"  value="5">
	    <input type="hidden" name="noteName"  value="">
	    <input type="hidden" name="noteType"  value="0">
	    <input type="hidden" name="position" value="">
        <input type="hidden" name="length" value="">
        <input type="hidden" name="width" value="">
        <input type="hidden" name="high" value="">
        <input type="hidden" name="updateDate" value="">
        <h3>设计师建议：</h3>
        <textarea name="txtValue" cols="" rows="" placeholder="请在此输入内容"></textarea>
        <input type="hidden" name="note"  value="">
	    <input type="hidden" name="name"  value="设计师建议 ">
	    <input type="hidden" name="firstValue"  value="">
	    <input type="hidden" name="secondValue"  value="">
	    <input type="hidden" name="required"  value="0">
	    <input type="hidden" name="elementType"  value="1">
	    <input type="hidden" name="sort"  value="13">
	    <input type="hidden" name="type"  value="5">
	    <input type="hidden" name="noteName"  value="">
	    <input type="hidden" name="noteType"  value="0">
	    <input type="hidden" name="position" value="">
        <input type="hidden" name="length" value="">
        <input type="hidden" name="width" value="">
        <input type="hidden" name="high" value="">
        <input type="hidden" name="updateDate" value="">
        <input class="clgj_nran" type="submit" value="保存">
       </form>
        </c:when>
        <c:otherwise>
        
        <form id="bedroom" action="/designerMeasureTools/three/updateBedroom/${orderNoStr}" method="post">
        	
        <ul>
        	<li>
            	<h2>个性化吊顶 <span>★</span></h2>
                <div class="clgj_xz">
                   <c:if test="${erpPaileiDetailsList[0].txtValue == erpPaileiDetailsList[0].firstValue}">
                    <input id="dd_yes" class="input_yes" name="1" type="radio" value="有" checked="checked">
                    <label for="dd_yes">有</label>
                    <input id="dd_no" class="input_no" name="1" type="radio" value="无">
                    <label for="dd_no">无</label>	
                 </c:if>
                  <c:if test="${erpPaileiDetailsList[0].txtValue == erpPaileiDetailsList[0].secondValue}">
                   <input id="dd_yes" class="input_yes" name="1" type="radio" value="有">
                    <label for="dd_yes">有</label>
                    <input id="dd_no" class="input_no" name="1" type="radio" value="无" checked="checked">
                    <label for="dd_no">无</label>	
                  </c:if>
                  <c:if test="${empty erpPaileiDetailsList[0].txtValue and erpPaileiDetailsList[0].elementType eq 0}">
                  	<input id="dd_yes" class="input_yes" name="1" type="radio" value="有">
                    <label for="dd_yes">有</label>
                    <input id="dd_no" class="input_no" name="1" type="radio" value="无">
                    <label for="dd_no">无</label>	
                  </c:if>
                    <input type="hidden" name="id"  value="${erpPaileiDetailsList[0].id}">
	             	<input type="hidden" name="txtValue"  value="${erpPaileiDetailsList[0].txtValue}">
	             	<input type="hidden" name="updateDate"  value="">
                </div>
                <div id="clgj_dd" class="clgj_tx">
                	<span>预算金额</span>
                    <input name="note" type="text" value="${erpPaileiDetailsList[0].note}">
                     <i>元</i>
                </div>
            </li>
            <li>
            	<h2>个性化弱电 <span>★</span></h2>
                <div class="clgj_xz">
                    <c:if test="${erpPaileiDetailsList[1].txtValue == erpPaileiDetailsList[1].firstValue}">
                    <input id="rd_yes" class="input_yes" name="2" type="radio" value="有" checked="checked">
                    <label for="rd_yes">有</label>
                    <input id="rd_no" class="input_no" name="2" type="radio" value="无">
                    <label for="rd_no">无</label>
                </c:if>	
                <c:if test="${erpPaileiDetailsList[1].txtValue == erpPaileiDetailsList[1].secondValue}">
                    <input id="rd_yes" class="input_yes" name="2" type="radio" value="有">
                    <label for="rd_yes">有</label>
                    <input id="rd_no" class="input_no" name="2" type="radio" value="无" checked="checked">
                    <label for="rd_no">无</label>
                </c:if>
                 <c:if test="${empty erpPaileiDetailsList[1].txtValue and erpPaileiDetailsList[1].elementType eq 0}">
                    <input id="rd_yes" class="input_yes" name="2" type="radio" value="有">
                    <label for="rd_yes">有</label>
                    <input id="rd_no" class="input_no" name="2" type="radio" value="无">
                    <label for="rd_no">无</label>
                 </c:if>
                    <input type="hidden" name="id"  value="${erpPaileiDetailsList[1].id}">
	             	<input type="hidden" name="txtValue"  value="${erpPaileiDetailsList[1].txtValue}">
	             	<input type="hidden" name="updateDate"  value="">
                </div>	
                <div id="clgj_rd" class="clgj_tx">
                	<span>预算金额</span>
                    <input name="note" type="text" value="${erpPaileiDetailsList[1].note}">
                    <i>元</i>
                </div>
            </li>
            <li>
            	<h2>家具 <span>★</span></h2>
                <div class="clgj_xz">
                <c:if test="${erpPaileiDetailsList[2].txtValue == erpPaileiDetailsList[2].firstValue}">
                    <input id="jj_yes" class="input_yes" name="3" type="radio" value="新购" checked="checked">
                    <label for="jj_yes">新购</label>
                    <input id="jj_no" class="input_yes" name="3" type="radio" value="原有">
                    <label for="jj_no">原有</label>
                </c:if>	
                <c:if test="${erpPaileiDetailsList[2].txtValue == erpPaileiDetailsList[2].secondValue}">
                    <input id="jj_yes" class="input_yes" name="3" type="radio" value="新购">
                    <label for="jj_yes">新购</label>
                    <input id="jj_no" class="input_yes" name="3" type="radio" value="原有" checked="checked">
                    <label for="jj_no">原有</label>
                </c:if>
                 <c:if test="${empty erpPaileiDetailsList[2].txtValue and erpPaileiDetailsList[2].elementType eq 0}">
                    <input id="jj_yes" class="input_yes" name="3" type="radio" value="新购">
                    <label for="jj_yes">新购</label>
                    <input id="jj_no" class="input_yes" name="3" type="radio" value="原有">
                    <label for="jj_no">原有</label>
                 </c:if>
                    <input type="hidden" name="id"  value="${erpPaileiDetailsList[2].id}">
	             	<input type="hidden" name="txtValue"  value="${erpPaileiDetailsList[2].txtValue}">
	             	<input type="hidden" name="updateDate"  value="">
                </div>
                <div  class="clgj_tx">
                	<span style="text-align:right">风格</span>
                    <input name="note" type="text" value="${erpPaileiDetailsList[2].note}">
                </div>
            </li>
            <li>
            	<h2>双控 </h2>
                <div class="clgj_xz">
                    <c:if test="${erpPaileiDetailsList[3].txtValue == erpPaileiDetailsList[3].firstValue}">
                    <input id="sk_yes" class="input_yes" name="4" type="radio" value="需要" checked="checked">
                    <label for="sk_yes">需要</label>
                    <input id="sk_no" class="input_no" name="4" type="radio" value="不需要">
                    <label for="sk_no">不需要</label>	
                  </c:if>	
                   <c:if test="${erpPaileiDetailsList[3].txtValue == erpPaileiDetailsList[3].secondValue}">	
                   <input id="sk_yes" class="input_yes" name="4" type="radio" value="需要">
                    <label for="sk_yes">需要</label>
                    <input id="sk_no" class="input_no" name="4" type="radio" value="不需要" checked="checked">
                    <label for="sk_no">不需要</label>
                   </c:if>
                   <c:if test="${empty erpPaileiDetailsList[3].txtValue and erpPaileiDetailsList[3].elementType eq 0}">
                    <input id="sk_yes" class="input_yes" name="4" type="radio" value="需要">
                    <label for="sk_yes">需要</label>
                    <input id="sk_no" class="input_no" name="4" type="radio" value="不需要">
                    <label for="sk_no">不需要</label>
                   </c:if>
                    <input type="hidden" name="id"  value="${erpPaileiDetailsList[3].id}">
	             	<input type="hidden" name="txtValue"  value="${erpPaileiDetailsList[3].txtValue}">
	             	<input type="hidden" name="updateDate" value="" >	
                </div>
                <div id="clgj_sk" class="clgj_tx">
                	<span>预算金额</span>
                    <input name="note" type="text"  value="${erpPaileiDetailsList[3].note}">
                    <i>元</i>
                </div>
            </li>
            <li>
            	<h2>地面材质  <span>★</span></h2>
                <div class="clgj_xz">
                    <c:if test="${erpPaileiDetailsList[4].txtValue == erpPaileiDetailsList[4].firstValue}">
                    <input id="db_yes" name="5" type="radio" value="地板" checked="checked">
                    <label for="db_yes">地板</label>
                    <input id="db_no" name="5" type="radio" value="地砖">
                    <label for="db_no">地砖</label>
                 </c:if>
                 <c:if test="${erpPaileiDetailsList[4].txtValue == erpPaileiDetailsList[4].secondValue}">
                     <input id="db_yes" name="5" type="radio" value="地板">
                    <label for="db_yes">地板</label>
                    <input id="db_no" name="5" type="radio" value="地砖" checked="checked">
                    <label for="db_no">地砖</label>
                 </c:if>
                  <c:if test="${empty erpPaileiDetailsList[4].txtValue and erpPaileiDetailsList[4].elementType eq 0}">
                    <input id="db_yes" name="5" type="radio" value="地板">
                    <label for="db_yes">地板</label>
                    <input id="db_no" name="5" type="radio" value="地砖">
                    <label for="db_no">地砖</label>
                  </c:if>
                    <input type="hidden" name="id"  value="${erpPaileiDetailsList[4].id}">
	             	<input type="hidden" name="txtValue"  value="${erpPaileiDetailsList[4].txtValue}">
	             	<input type="hidden" name="updateDate"  value="">
	             	<input type="hidden" name="note"  value="${erpPaileiDetailsList[4].note}">
                </div>
            </li>
            <li>
            	<h2>暖气更换 <span>★</span></h2>
                <div class="clgj_xz">
                    <c:if test="${erpPaileiDetailsList[5].txtValue == erpPaileiDetailsList[5].firstValue}">
                     <input id="nq_yes" class="input_yes" name="6" type="radio" value="是" checked="checked">
                    <label for="nq_yes">是</label>
                    <input id="nq_no" class="input_no" name="6" type="radio" value="否">
                    <label for="nq_no">否</label>
                 </c:if>
                  <c:if test="${erpPaileiDetailsList[5].txtValue == erpPaileiDetailsList[5].secondValue}">
                    <input id="nq_yes" class="input_yes" name="6" type="radio" value="是">
                    <label for="nq_yes">是</label>
                    <input id="nq_no" class="input_no" name="6" type="radio" value="否" checked="checked">
                    <label for="nq_no">否</label>
                  </c:if>
                   <c:if test="${empty erpPaileiDetailsList[5].txtValue and erpPaileiDetailsList[5].elementType eq 0}">
                     <input id="nq_yes" class="input_yes" name="6" type="radio" value="是">
                    <label for="nq_yes">是</label>
                    <input id="nq_no" class="input_no" name="6" type="radio" value="否">
                    <label for="nq_no">否</label>
                   </c:if>
                    <input type="hidden" name="id"  value="${erpPaileiDetailsList[5].id}">
	             	<input type="hidden" name="txtValue"  value="${erpPaileiDetailsList[5].txtValue}">
	             	<input type="hidden" name="note"  value="${erpPaileiDetailsList[5].note}">
                </div>
                <div id="clgj_nq" class="clgj_tx">
                	<span>改动时间</span>
                    <input name="updateDate" type="date" value="<fmt:formatDate value="${erpPaileiDetailsList[5].updateDate}" pattern="yyyy-MM-dd"/>">
                </div>
            </li>
            <li>
            	<h2>飘窗石英石 <span>★</span></h2>
                <div class="clgj_xz">
                    <c:if test="${erpPaileiDetailsList[6].txtValue == erpPaileiDetailsList[6].firstValue}">
                    <input id="sys_yes" class="input_yes" name="7" type="radio" value="是" checked="checked">
                    <label for="sys_yes">是</label>
                    <input id="sys_no" class="input_no" name="7" type="radio" value="否">
                    <label for="sys_no">否</label>
                  </c:if> 
                  <c:if test="${erpPaileiDetailsList[6].txtValue == erpPaileiDetailsList[6].secondValue}">
                     <input id="sys_yes" class="input_yes" name="7" type="radio" value="是">
                    <label for="sys_yes">是</label>
                    <input id="sys_no" class="input_no" name="7" type="radio" value="否" checked="checked">
                    <label for="sys_no">否</label>
                  </c:if>
                   <c:if test="${empty erpPaileiDetailsList[6].txtValue and erpPaileiDetailsList[6].elementType eq 0}">
                    <input id="sys_yes" class="input_yes" name="7" type="radio" value="是">
                    <label for="sys_yes">是</label>
                    <input id="sys_no" class="input_no" name="7" type="radio" value="否">
                    <label for="sys_no">否</label>
                  </c:if>
                   <input type="hidden" name="id"  value="${erpPaileiDetailsList[6].id}">
	             	<input type="hidden" name="txtValue"  value="${erpPaileiDetailsList[6].txtValue}">
	             	<input type="hidden" name="updateDate" value="">
                </div>
                <div id="clgj_sys" class="clgj_tx">
                	<span>预算金额</span>
                    <input name="note" type="text" value="${ erpPaileiDetailsList[6].note}">
                    <i>元</i>
                </div>
            </li>
            <li>
            	<h2>个性化窗帘盒 <span>★</span></h2>
                <div class="clgj_xz">
                   <c:if test="${erpPaileiDetailsList[7].txtValue == erpPaileiDetailsList[7].firstValue}">
                     <input id="clh_yes" class="input_yes" name="8" type="radio" value="有" checked="checked">
                    <label for="clh_yes">有</label>
                    <input id="clh_no" class="input_no" name="8" type="radio" value="无">
                    <label for="clh_no">无</label>		
                </c:if>	
                 <c:if test="${erpPaileiDetailsList[7].txtValue == erpPaileiDetailsList[7].secondValue}">
                    <input id="clh_yes" class="input_yes" name="8" type="radio" value="有">
                    <label for="clh_yes">有</label>
                    <input id="clh_no" class="input_no" name="8" type="radio" value="无" checked="checked">
                    <label for="clh_no">无</label>
                 </c:if>
                 <c:if test="${empty erpPaileiDetailsList[7].txtValue and erpPaileiDetailsList[7].elementType eq 0}">
                    <input id="clh_yes" class="input_yes" name="8" type="radio" value="有">
                    <label for="clh_yes">有</label>
                    <input id="clh_no" class="input_no" name="8" type="radio" value="无">
                    <label for="clh_no">无</label>	
                 </c:if>
                    <input type="hidden" name="id"  value="${erpPaileiDetailsList[7].id}">
	             	<input type="hidden" name="txtValue"  value="${erpPaileiDetailsList[7].txtValue}">
	             	<input type="hidden" name="updateDate"  value="">
                </div>
                <div id="clgj_clh" class="clgj_tx">
                	<span>预算金额</span>
                    <input name="note" type="text" value="${ erpPaileiDetailsList[7].note}">
                    <i>元</i>
                </div>
            </li>
            <li>
            	<h2>个性化强电 <span>★</span></h2>
                <div class="clgj_xz">
                    <c:if test="${erpPaileiDetailsList[8].txtValue == erpPaileiDetailsList[8].firstValue}">
                     <input id="qd_yes" class="input_yes" name="9" type="radio" value="有" checked="checked">
                    <label for="qd_yes">有</label> 
                    <input id="yes_no" class="input_no" name="9" type="radio" value="无">
                    <label for="yes_no">无</label>	
                  </c:if>
                  <c:if test="${erpPaileiDetailsList[8].txtValue == erpPaileiDetailsList[8].secondValue}">
                     <input id="qd_yes" class="input_yes" name="9" type="radio" value="有">
                    <label for="qd_yes">有</label> 
                    <input id="yes_no" class="input_no" name="9" type="radio" value="无" checked="checked">
                    <label for="yes_no">无</label>
                  </c:if>
                   <c:if test="${empty erpPaileiDetailsList[8].txtValue and erpPaileiDetailsList[8].elementType eq 0}">
                    <input id="qd_yes" class="input_yes" name="9" type="radio" value="有">
                    <label for="qd_yes">有</label> 
                    <input id="yes_no" class="input_no" name="9" type="radio" value="无">
                    <label for="yes_no">无</label>
                   </c:if>
                    <input type="hidden" name="id"  value="${erpPaileiDetailsList[8].id}">
	             	<input type="hidden" name="txtValue"  value="${erpPaileiDetailsList[8].txtValue}">
	             	<input type="hidden" name="updateDate"  value="">
                </div>
                <div id="clgj_qd" class="clgj_tx">
                	<span>预算金额</span>
                    <input name="note" type="text" value="${ erpPaileiDetailsList[8].note}">
                    <i>元</i>
                </div>
            </li>
            <li>
            	<h2>灯位 <span>★</span></h2>
                <div class="clgj_xz">
                    <c:if test="${erpPaileiDetailsList[9].txtValue == erpPaileiDetailsList[9].firstValue}">
                     <input id="dw_yes" class="input_yes" name="10" type="radio" value="有" checked="checked">
                    <label for="dw_yes">有</label>
                    <input id="dw_no" class="input_no" name="10" type="radio" value="无">
                    <label for="dw_no">无</label>	
                  </c:if>
                  <c:if test="${erpPaileiDetailsList[9].txtValue == erpPaileiDetailsList[9].secondValue}">
                    <input id="dw_yes" class="input_yes" name="10" type="radio" value="有">
                    <label for="dw_yes">有</label>
                    <input id="dw_no" class="input_no" name="10" type="radio" value="无" checked="checked">
                    <label for="dw_no">无</label>
                  </c:if>
                   <c:if test="${empty erpPaileiDetailsList[9].txtValue and erpPaileiDetailsList[9].elementType eq 0}">
                   <input id="dw_yes" class="input_yes" name="10" type="radio" value="有">
                    <label for="dw_yes">有</label>
                    <input id="dw_no" class="input_no" name="10" type="radio" value="无">
                    <label for="dw_no">无</label>
                   </c:if>
                    <input type="hidden" name="id"  value="${erpPaileiDetailsList[9].id}">
	             	<input type="hidden" name="txtValue"  value="${erpPaileiDetailsList[9].txtValue}">
	             	<input type="hidden" name="updateDate"  value="">	
                </div>
                <div id="clgj_dw" class="clgj_tx">
                	<span>预算金额</span>
                    <input name="note" type="text"  value="${ erpPaileiDetailsList[9].note}">
                     <i>元</i>
                </div>
            </li>
            <li>
            	<h2>阳台铺砖及吊顶  <span>★</span></h2>
                <div class="clgj_xz">
                   <c:if test="${erpPaileiDetailsList[10].txtValue == erpPaileiDetailsList[10].firstValue}">
                   <input id="pwdd_yes" class="input_yes" name="11" type="radio" value="需要" checked="checked">
                    <label for="pwdd_yes">需要</label>
                    <input id="pwdd_no"  class="input_no" name="11" type="radio" value="不需要">
                    <label for="pwdd_no">不需要</label>	
                  </c:if>
                  <c:if test="${erpPaileiDetailsList[10].txtValue == erpPaileiDetailsList[10].secondValue}">
                     <input id="pwdd_yes" class="input_yes" name="11" type="radio" value="需要" >
                    <label for="pwdd_yes">需要</label>
                    <input id="pwdd_no"  class="input_no" name="11" type="radio" value="不需要" checked="checked">
                    <label for="pwdd_no">不需要</label>	
                  </c:if>
                   <c:if test="${empty erpPaileiDetailsList[10].txtValue and erpPaileiDetailsList[10].elementType eq 0}">
                    <input id="pwdd_yes" class="input_yes" name="11" type="radio" value="需要" >
                    <label for="pwdd_yes">需要</label>
                    <input id="pwdd_no"  class="input_no" name="11" type="radio" value="不需要">
                    <label for="pwdd_no">不需要</label>	
                   </c:if>
                    <input type="hidden" name="id"  value="${erpPaileiDetailsList[10].id}">
	             	<input type="hidden" name="txtValue"  value="${erpPaileiDetailsList[10].txtValue}">
	             	<input type="hidden" name="updateDate"  value="">
                </div>
                <div id="clgj_pwdd" class="clgj_tx">
                	<span>预算金额</span>
                    <input name="note" type="text" value="${ erpPaileiDetailsList[10].note}">
                     <i>元</i>
                </div>
            </li>
            <li>
            	<h2>个性化墙面  </h2>
                <div class="clgj_xz">
                     <c:if test="${erpPaileiDetailsList[11].txtValue == erpPaileiDetailsList[11].firstValue}">
                   <input id="qm_yes" class="input_yes" name="12" type="radio" value="有" checked="checked">
                    <label for="qm_yes">有</label>
                    <input id="qm_no" class="input_no" name="12" type="radio" value="无">
                    <label for="qm_no">无</label>	
                  </c:if>
                  <c:if test="${erpPaileiDetailsList[11].txtValue == erpPaileiDetailsList[11].secondValue}">
                      <input id="qm_yes" class="input_yes" name="12" type="radio" value="有" >
                    <label for="qm_yes">有</label>
                    <input id="qm_no" class="input_no" name="12" type="radio" value="无" checked="checked">
                    <label for="qm_no">无</label>	
                  </c:if>
                   <c:if test="${empty erpPaileiDetailsList[11].txtValue and erpPaileiDetailsList[11].elementType eq 0}">
                    <input id="qm_yes" class="input_yes" name="12" type="radio" value="有" >
                    <label for="qm_yes">有</label>
                    <input id="qm_no" class="input_no" name="12" type="radio" value="无">
                    <label for="qm_no">无</label>	
                   </c:if>
                   <input type="hidden" name="id"  value="${erpPaileiDetailsList[11].id}">
	             	<input type="hidden" name="txtValue"  value="${erpPaileiDetailsList[11].txtValue}">
	             	<input type="hidden" name="updateDate"  value="">
                </div>
                <div id="clgj_qm" class="clgj_tx">
                	<span>预算金额</span>
                    <input name="note" type="text" value="${ erpPaileiDetailsList[11].note}">
                    <i>元</i>
                </div>
            </li>
            <li>
            	<h2>卧室电视是否壁挂 </h2>
                <div class="clgj_xz">
                    <c:if test="${erpPaileiDetailsList[12].txtValue == erpPaileiDetailsList[12].firstValue}">
                    <input id="dsbg_yes" class="input_yes" name="13" type="radio" value="挂" checked="checked">
                    <label for="dsbg_yes">挂</label>
                    <input id="dsbg_no" class="input_no" name="13" type="radio" value="不挂">
                    <label for="dsbg_no">不挂</label>	
                  </c:if>
                  <c:if test="${erpPaileiDetailsList[12].txtValue == erpPaileiDetailsList[12].secondValue}">
                    <input id="dsbg_yes" class="input_yes" name="13" type="radio" value="挂">
                    <label for="dsbg_yes">挂</label>
                    <input id="dsbg_no" class="input_no" name="13" type="radio" value="不挂" checked="checked">
                    <label for="dsbg_no">不挂</label>	
                  </c:if>
                   <c:if test="${empty erpPaileiDetailsList[12].txtValue and erpPaileiDetailsList[12].elementType eq 0}">
                    <input id="dsbg_yes" class="input_yes" name="13" type="radio" value="挂">
                    <label for="dsbg_yes">挂</label>
                    <input id="dsbg_no" class="input_no" name="13" type="radio" value="不挂">
                    <label for="dsbg_no">不挂</label>	
                   </c:if>
                   <input type="hidden" name="id"  value="${erpPaileiDetailsList[12].id}">
	             	<input type="hidden" name="txtValue"  value="${erpPaileiDetailsList[12].txtValue}">
	             	<input type="hidden" name="updateDate"  value="">
                </div>
                <div id="clgj_dsbg" class="clgj_tx">
                	<span>建议</span>
                    <input name="note" type="text"  value="${erpPaileiDetailsList[12].note}">
                </div>
            </li>
            
        </ul>
        <h3>客户需求：</h3>
        <textarea name="txtValue" cols="" rows="" placeholder="请在此输入内容">${erpPaileiDetailsList[13].txtValue}</textarea>
         <input type="hidden" name="id"  value="${erpPaileiDetailsList[13].id}">
	     <input type="hidden" name="note"  value="${erpPaileiDetailsList[13].note}">
	     <input type="hidden" name="updateDate"  <fmt:formatDate value="${erpPaileiDetailsList[13].updateDate}" pattern="yyyy-MM-dd"/>>
        <h3>设计师建议：</h3>
        <textarea name="txtValue" cols="" rows="" placeholder="请在此输入内容">${erpPaileiDetailsList[14].txtValue}</textarea>
         <input type="hidden" name="id"  value="${erpPaileiDetailsList[14].id}">
	     <input type="hidden" name="note"  value="${erpPaileiDetailsList[14].note}">
	     <input type="hidden" name="updateDate"  <fmt:formatDate value="${erpPaileiDetailsList[14].updateDate}" pattern="yyyy-MM-dd"/>>
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