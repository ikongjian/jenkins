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
<title>门厅</title>
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
            	    	</c:if>-门厅-
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
     <form id="kitchen" action="/designerMeasureTools/three/saveDoorHall/${orderNoStr}" method="post">
        <ul>
        	<li>
            	<h2>鞋柜 </h2>
                <div class="clgj_xz">
                    <input id="xg_yes" class="input_yes" name="1" type="radio" value="有">
                    <label for="xg_yes">有</label>
                    <input id="xg_no" class="input_no" name="1" type="radio" value="无">
                    <label for="xg_no">无</label>
                    <input type="hidden" name="txtValue"  value="">
	            	<input type="hidden" name="name"  value="鞋柜">
	            	<input type="hidden" name="firstValue"  value="有">
	            	<input type="hidden" name="secondValue"  value="无">
	            	<input type="hidden" name="required"  value="0">
	            	<input type="hidden" name="elementType"  value="0">
	            	<input type="hidden" name="sort"  value="0">
	            	<input type="hidden" name="type"  value="4">
	            	<input type="hidden" name="noteName"  value="建议尺寸">
            		<input type="hidden" name="noteType"  value="1">
	            	<input type="hidden" name="position" value="">
	            	<input type="hidden" name="updateDate" value="">
                	<input type="hidden" name="note" value="">	
                </div>
                <div class="clgj_tx">
                	<span>建议尺寸</span>
                    <input class="input1" name="length" type="text" ><i>长</i>
                    <input class="input1" name="width" type="text" ><i>宽</i>
                    <input class="input1" name="high" type="text" ><i>高</i>
                </div>
            </li>
            <li>
            	<h2>个性化吊顶 </h2>
                <div class="clgj_xz">
                    <input id="dd_yes" class="input_yes" name="2" type="radio" value="有">
                    <label for="dd_yes">有</label>
                    <input id="dd_no" class="input_no" name="2" type="radio" value="无">
                    <label for="dd_no">无</label>
                    <input type="hidden" name="txtValue"  value="">
	            	<input type="hidden" name="name"  value="个性化吊顶">
	            	<input type="hidden" name="firstValue"  value="有">
	            	<input type="hidden" name="secondValue"  value="无">
	            	<input type="hidden" name="required"  value="0">
	            	<input type="hidden" name="elementType"  value="0">
	           	 	<input type="hidden" name="sort"  value="1">
	            	<input type="hidden" name="type"  value="4">
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
            	<h2>双控 </h2>
                <div class="clgj_xz">
                    <input id="sk_yes" class="input_yes" name="3" type="radio" value="需要">
                    <label for="sk_yes">需要</label>
                    <input id="sk_no" class="input_no" name="3" type="radio" value="不需要">
                    <label for="sk_no">不需要</label>
                    <input type="hidden" name="txtValue"  value="">
	            	<input type="hidden" name="name"  value="双控 ">
	            	<input type="hidden" name="firstValue"  value="需要">
	            	<input type="hidden" name="secondValue"  value="不需要">
	            	<input type="hidden" name="required"  value="0">
	            	<input type="hidden" name="elementType"  value="0">
	            	<input type="hidden" name="sort"  value="2">
	            	<input type="hidden" name="type"  value="4">
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
            	<h2>灯位 <span>★</span></h2>
                <div class="clgj_xz">
                    <input id="dw_yes" class="input_yes" name="4" type="radio" value="有">
                    <label for="dw_yes">有</label>
                    <input id="dw_no" class="input_no" name="4" type="radio" value="无">
                    <label for="dw_no">无</label>
                    <input type="hidden" name="txtValue"  value="">
	            	<input type="hidden" name="name"  value="灯位 ">
	            	<input type="hidden" name="firstValue"  value="有">
	            	<input type="hidden" name="secondValue"  value="无">
	            	<input type="hidden" name="required"  value="1">
	            	<input type="hidden" name="elementType"  value="0">
	            	<input type="hidden" name="sort"  value="3">
	            	<input type="hidden" name="type"  value="4">
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
        </ul>
        <h3>客户需求：</h3>
        <textarea name="txtValue" cols="" rows="" placeholder="请在此输入内容"></textarea>
	    <input type="hidden" name="name"  value="客户需求 ">
	    <input type="hidden" name="firstValue"  value="">
	    <input type="hidden" name="secondValue"  value="">
	    <input type="hidden" name="required"  value="0">
	    <input type="hidden" name="elementType"  value="1">
	    <input type="hidden" name="sort"  value="4">
	    <input type="hidden" name="type"  value="4">
	    <input type="hidden" name="noteName"  value="">
	    <input type="hidden" name="noteType"  value="0">
	    <input type="hidden" name="position" value="">
	    <input type="hidden" name="updateDate" value="">
        <input type="hidden" name="length" value="">
        <input type="hidden" name="width" value="">
        <input type="hidden" name="high" value="">
        <input type="hidden" name="note" value="">
        <h3>设计师建议：</h3>
        <textarea name="txtValue" cols="" rows="" placeholder="请在此输入内容"></textarea>
        <input type="hidden" name="name"  value="设计师建议 ">
	    <input type="hidden" name="firstValue"  value="">
	    <input type="hidden" name="secondValue"  value="">
	    <input type="hidden" name="required"  value="0">
	    <input type="hidden" name="elementType"  value="1">
	    <input type="hidden" name="sort"  value="5">
	    <input type="hidden" name="type"  value="4">
	    <input type="hidden" name="noteName"  value="">
	    <input type="hidden" name="noteType"  value="0">
	    <input type="hidden" name="position" value="">
	    <input type="hidden" name="updateDate" value="">
        <input type="hidden" name="length" value="">
        <input type="hidden" name="width" value="">
        <input type="hidden" name="high" value="">
        <input type="hidden" name="note" value="">
        <input class="clgj_nran" type="submit" value="保存">
        </form>
       </c:when>
       <c:otherwise>
        <form id="kitchen" action="/designerMeasureTools/three/updateDoorHall/${orderNoStr}" method="post">
         <ul>
        	<li>
            	<h2>鞋柜 </h2>
                <div class="clgj_xz">
                 <c:if test="${erpPaileiDetailsList[0].txtValue == erpPaileiDetailsList[0].firstValue}">
                    <input id="xg_yes" class="input_yes" name="1" type="radio" value="有" checked="checked">
                    <label for="xg_yes">有</label>
                    <input id="xg_no" class="input_no" name="1" type="radio" value="无">
                    <label for="xg_no">无</label>
                 </c:if>
                  <c:if test="${erpPaileiDetailsList[0].txtValue == erpPaileiDetailsList[0].secondValue}">
                    <input id="xg_yes" class="input_yes" name="1" type="radio" value="有">
                    <label for="xg_yes">有</label>
                    <input id="xg_no" class="input_no" name="1" type="radio" value="无" checked="checked">
                    <label for="xg_no">无</label>
                 </c:if>
                 <c:if test="${empty erpPaileiDetailsList[0].txtValue and erpPaileiDetailsList[0].elementType eq 0}">
                    <input id="xg_yes" class="input_yes" name="1" type="radio" value="有">
                    <label for="xg_yes">有</label>
                    <input id="xg_no" class="input_no" name="1" type="radio" value="无">
                    <label for="xg_no">无</label>
                 </c:if>
                    <input type="hidden" name="id"  value="${erpPaileiDetailsList[0].id}">
                    <input type="hidden" name="txtValue"  value="${erpPaileiDetailsList[0].txtValue}">
	            	<input type="hidden" name="position" value="">
                	<input type="hidden" name="note" value="">	
                </div>
                <div class="clgj_tx">
                	<span>建议尺寸</span>
                    <input class="input1" name="length" type="text" value="${erpPaileiDetailsList[0].length}"><i>长</i>
                    <input class="input1" name="width" type="text" value="${erpPaileiDetailsList[0].width}"><i>宽</i>
                    <input class="input1" name="high" type="text" value="${erpPaileiDetailsList[0].high}"><i>高</i>
                </div>
            </li>
            <li>
            	<h2>个性化吊顶 </h2>
                <div class="clgj_xz">
                    <c:if test="${erpPaileiDetailsList[1].txtValue == erpPaileiDetailsList[1].firstValue}">
                    <input id="dd_yes" class="input_yes" name="2" type="radio" value="有" checked="checked">
                    <label for="dd_yes">有</label>
                    <input id="dd_no" class="input_no" name="2" type="radio" value="无">
                    <label for="dd_no">无</label>
                    </c:if>
                    <c:if test="${erpPaileiDetailsList[1].txtValue == erpPaileiDetailsList[1].secondValue}">
                    <input id="dd_yes" class="input_yes" name="2" type="radio" value="有">
                    <label for="dd_yes">有</label>
                    <input id="dd_no" class="input_no" name="2" type="radio" value="无" checked="checked">
                    <label for="dd_no">无</label>
                    </c:if>
                    <c:if test="${empty erpPaileiDetailsList[1].txtValue and erpPaileiDetailsList[1].elementType eq 0}">
                    <input id="dd_yes" class="input_yes" name="2" type="radio" value="有">
                    <label for="dd_yes">有</label>
                    <input id="dd_no" class="input_no" name="2" type="radio" value="无">
                    <label for="dd_no">无</label>
                    </c:if>
                    <input type="hidden" name="id"  value="${erpPaileiDetailsList[1].id}">
                    <input type="hidden" name="txtValue"  value="${erpPaileiDetailsList[1].txtValue}">
	            	<input type="hidden" name="position" value="">
                	<input type="hidden" name="length" value="">
                	<input type="hidden" name="width" value="">
                	<input type="hidden" name="high" value="">	
                </div>
                <div class="clgj_tx">
                	<span>预算金额</span>
                    <input name="note" type="text" value="${erpPaileiDetailsList[1].note}">
                    <i>元</i>
                </div>
            </li>
            <li>
            	<h2>双控 </h2>
                <div class="clgj_xz">
                    <c:if test="${erpPaileiDetailsList[2].txtValue == erpPaileiDetailsList[2].firstValue}">
                      <input id="sk_yes" class="input_yes" name="3" type="radio" value="需要" checked="checked">
                      <label for="sk_yes">需要</label>
                      <input id="sk_no" class="input_no" name="3" type="radio" value="不需要">
                      <label for="sk_no">不需要</label>
                    </c:if>
                    <c:if test="${erpPaileiDetailsList[2].txtValue == erpPaileiDetailsList[2].secondValue}">
                      <input id="sk_yes" class="input_yes" name="3" type="radio" value="需要">
                      <label for="sk_yes">需要</label>
                      <input id="sk_no" class="input_no" name="3" type="radio" value="不需要" checked="checked">
                      <label for="sk_no">不需要</label>
                    </c:if>
                    <c:if test="${empty erpPaileiDetailsList[2].txtValue and erpPaileiDetailsList[2].elementType eq 0}">
                      <input id="sk_yes" class="input_yes" name="3" type="radio" value="需要">
                      <label for="sk_yes">需要</label>
                      <input id="sk_no" class="input_no" name="3" type="radio" value="不需要">
                      <label for="sk_no">不需要</label>
                    </c:if>
                    <input type="hidden" name="id"  value="${erpPaileiDetailsList[2].id}">
                    <input type="hidden" name="txtValue"  value="${erpPaileiDetailsList[2].txtValue}">
	            	<input type="hidden" name="position" value="">
                	<input type="hidden" name="length" value="">
                	<input type="hidden" name="width" value="">
                	<input type="hidden" name="high" value="">	
                </div>
                <div class="clgj_tx">
                	<span>预算金额</span>
                    <input name="note" type="text" value="${erpPaileiDetailsList[2].note}">
                    <i>元</i>
                </div>
            </li>
            <li>
            	<h2>灯位 <span>★</span></h2>
                <div class="clgj_xz">
                    <c:if test="${erpPaileiDetailsList[3].txtValue == erpPaileiDetailsList[3].firstValue}">
                      <input id="dw_yes" class="input_yes" name="4" type="radio" value="有" checked="checked">
                      <label for="dw_yes">有</label>
                      <input id="dw_no" class="input_no" name="4" type="radio" value="无">
                      <label for="dw_no">无</label>
                    </c:if>
                    <c:if test="${erpPaileiDetailsList[3].txtValue == erpPaileiDetailsList[3].secondValue}">
                      <input id="dw_yes" class="input_yes" name="4" type="radio" value="有">
                      <label for="dw_yes">有</label>
                      <input id="dw_no" class="input_no" name="4" type="radio" value="无" checked="checked">
                      <label for="dw_no">无</label>
                    </c:if>
                    <c:if test="${empty erpPaileiDetailsList[3].txtValue and erpPaileiDetailsList[3].elementType eq 0}">
                      <input id="dw_yes" class="input_yes" name="4" type="radio" value="有">
                      <label for="dw_yes">有</label>
                      <input id="dw_no" class="input_no" name="4" type="radio" value="无">
                      <label for="dw_no">无</label>
                    </c:if>
                    <input type="hidden" name="id"  value="${erpPaileiDetailsList[3].id}">
                    <input type="hidden" name="txtValue"  value="${erpPaileiDetailsList[3].txtValue}">
	            	<input type="hidden" name="position" value="">
                	<input type="hidden" name="length" value="">
                	<input type="hidden" name="width" value="">
                	<input type="hidden" name="high" value="">	
                </div>
                <div class="clgj_tx">
                	<span>预算金额</span>
                    <input name="note" type="text" value="${erpPaileiDetailsList[3].note}">
                    <i>元</i>
                </div>
            </li>
        </ul>
        <h3>客户需求：</h3>
        <textarea name="txtValue" cols="" rows="">${erpPaileiDetailsList[4].txtValue}</textarea>
        <input type="hidden" name="id"  value="${erpPaileiDetailsList[4].id}">
	    <input type="hidden" name="position" value="">
	    <input type="hidden" name="updateDate" value="">
        <input type="hidden" name="length" value="">
        <input type="hidden" name="width" value="">
        <input type="hidden" name="high" value="">
        <input type="hidden" name="note" value="">
        <h3>设计师建议：</h3>
        <textarea name="txtValue" cols="" rows="">${erpPaileiDetailsList[5].txtValue}</textarea>
        <input type="hidden" name="id"  value="${erpPaileiDetailsList[5].id}">
	    <input type="hidden" name="position" value="">
	    <input type="hidden" name="updateDate" value="">
        <input type="hidden" name="length" value="">
        <input type="hidden" name="width" value="">
        <input type="hidden" name="high" value="">
        <input type="hidden" name="note" value="">
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
