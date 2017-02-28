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
<title>个性化</title>
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
            	    	</c:if>-个性化
         <a href="/designerMeasureTools/showIndex/${orderNoStr}">测量其他空间</a></div>
        
        <c:choose>
        	<c:when test="${erpPaileiDetailsList.size() eq 0 }"> 
         <form id="diy" action="/designerMeasureTools/three/saveDiy/${orderNoStr}" method="post">
        <h3>
        	独立书房或阅读区域
        	<b style="float:right;">
            <label for="dd_yes">是</label>
            <input id="dd_yes" class="input_yes" name="1" type="radio" value="是">
            <label for="dd_no">否</label>
	    	<input id="dd_no" class="input_no" name="1" type="radio" value="否">
	    	<input type="hidden" name="name"  value="独立书房或阅读区域">
	    	<input type="hidden" name="txtValue"  value="">
	    	<input type="hidden" name="firstValue"  value="是">
	    	<input type="hidden" name="secondValue"  value="否">
	    	<input type="hidden" name="required"  value="0">
	    	<input type="hidden" name="elementType"  value="0">
	    	<input type="hidden" name="sort"  value="0">
	    	<input type="hidden" name="type"  value="6">
	    	<input type="hidden" name="noteType"  value="9">
	    	</b>
        </h3>
        <textarea name="note" cols="" rows="" placeholder="请输入备注说明"></textarea>
        <h3>
                                    艺术品或收藏展示
            <b style="float:right;">
             <label for="dd_yes">是</label>
            <input id="dd_yes" class="input_yes" name="2" type="radio" value="是">
            <label for="dd_no">否</label>
	    	<input id="dd_no" class="input_no" name="2" type="radio" value="否">
            <input type="hidden" name="name"  value="艺术品或收藏展示">
	    	<input type="hidden" name="txtValue"  value="">
	    	<input type="hidden" name="firstValue"  value="是">
	    	<input type="hidden" name="secondValue"  value="否">
	    	<input type="hidden" name="required"  value="0">
	    	<input type="hidden" name="elementType"  value="0">
	    	<input type="hidden" name="sort"  value="0">
	    	<input type="hidden" name="type"  value="6">
	    	<input type="hidden" name="noteType"  value="9">
	    	</b>
        </h3>
        <textarea name="note" cols="" rows="" placeholder="请输入备注说明"></textarea>
        
        <h3>
        	儿童游戏区域
            <b style="float:right;">
             <label for="dd_yes">是</label>
            <input id="dd_yes" class="input_yes" name="3" type="radio" value="是">
            <label for="dd_no">否</label>
	    	<input id="dd_no" class="input_no" name="3" type="radio" value="否">
            <input type="hidden" name="name"  value="儿童游戏区域">
	    	<input type="hidden" name="txtValue"  value="">
	    	<input type="hidden" name="firstValue"  value="是">
	    	<input type="hidden" name="secondValue"  value="否">
	    	<input type="hidden" name="required"  value="0">
	    	<input type="hidden" name="elementType"  value="0">
	    	<input type="hidden" name="sort"  value="0">
	    	<input type="hidden" name="type"  value="6">
	    	<input type="hidden" name="noteType"  value="9">
            </b>
        </h3>
        <textarea name="note" cols="" rows="" placeholder="请输入备注说明"></textarea>
        
        <h3>
        	钢琴或其他大件乐器
            <b style="float:right;">
             <label for="dd_yes">是</label>
            <input id="dd_yes" class="input_yes" name="4" type="radio" value="是">
            <label for="dd_no">否</label>
	    	<input id="dd_no" class="input_no" name="4" type="radio" value="否">
            <input type="hidden" name="name"  value="钢琴或其他大件乐器">
	    	<input type="hidden" name="txtValue"  value="">
	    	<input type="hidden" name="firstValue"  value="是">
	    	<input type="hidden" name="secondValue"  value="否">
	    	<input type="hidden" name="required"  value="0">
	    	<input type="hidden" name="elementType"  value="0">
	    	<input type="hidden" name="sort"  value="0">
	    	<input type="hidden" name="type"  value="6">
	    	<input type="hidden" name="noteType"  value="9">
            </b>
        </h3>
        <textarea name="note" cols="" rows="" placeholder="请输入备注说明"></textarea>
        
        <h3>
        	是否摆放专业茶具
            <b style="float:right;">
             <label for="dd_yes">是</label>
            <input id="dd_yes" class="input_yes" name="5" type="radio" value="是">
            <label for="dd_no">否</label>
	    	<input id="dd_no" class="input_no" name="5" type="radio" value="否">
            <input type="hidden" name="name"  value="是否摆放专业茶具">
	    	<input type="hidden" name="txtValue"  value="">
	    	<input type="hidden" name="firstValue"  value="是">
	    	<input type="hidden" name="secondValue"  value="否">
	    	<input type="hidden" name="required"  value="0">
	    	<input type="hidden" name="elementType"  value="0">
	    	<input type="hidden" name="sort"  value="0">
	    	<input type="hidden" name="type"  value="6">
	    	<input type="hidden" name="noteType"  value="9">
            </b>
        </h3>
        <textarea name="note" cols="" rows="" placeholder="请输入备注说明"></textarea>
        
        <h3>
        	有无宠物
            <b style="float:right;">
             <label for="dd_yes">是</label>
            <input id="dd_yes" class="input_yes" name="6" type="radio" value="是">
            <label for="dd_no">否</label>
	    	<input id="dd_no" class="input_no" name="6" type="radio" value="否">
           <input type="hidden" name="name"  value="有无宠物">
	    	<input type="hidden" name="txtValue"  value="">
	    	<input type="hidden" name="firstValue"  value="是">
	    	<input type="hidden" name="secondValue"  value="否">
	    	<input type="hidden" name="required"  value="0">
	    	<input type="hidden" name="elementType"  value="0">
	    	<input type="hidden" name="sort"  value="0">
	    	<input type="hidden" name="type"  value="6">
	    	<input type="hidden" name="noteType"  value="9">
            </b>
        </h3>
        <textarea name="note" cols="" rows="" placeholder="请输入备注说明"></textarea>
        
        <input class="clgj_nran" type="submit" value="保存">
        </form>
        </c:when>
        
        <c:otherwise>
          <form id="diy" action="/designerMeasureTools/three/updateDiy/${orderNoStr}" method="post">
        <h3>
        	独立书房或阅读区域
            <b style="float:right;">
            <c:if test="${erpPaileiDetailsList[0].txtValue == erpPaileiDetailsList[0].firstValue}">
	           <label for="dd_yes">是</label>
               <input id="dd_yes" class="input_yes" name="1" type="radio" value="是" checked="checked">
               <label for="dd_no">否</label>
	    	   <input id="dd_no" class="input_no" name="1" type="radio" value="否">
	        </c:if>
	        <c:if test="${erpPaileiDetailsList[0].txtValue == erpPaileiDetailsList[0].secondValue}">
	           <label for="dd_yes">是</label>
               <input id="dd_yes" class="input_yes" name="1" type="radio" value="是">
               <label for="dd_no">否</label>
	    	   <input id="dd_no" class="input_no" name="1" type="radio" value="否" checked="checked">
	        </c:if>
	        <c:if test="${empty erpPaileiDetailsList[0].txtValue and erpPaileiDetailsList[0].elementType eq 0}">
	           <label for="dd_yes">是</label>
               <input id="dd_yes" class="input_yes" name="1" type="radio" value="是">
               <label for="dd_no">否</label>
	    	   <input id="dd_no" class="input_no" name="1" type="radio" value="否">
	        </c:if>
	        <input type="hidden" name="txtValue" value="${erpPaileiDetailsList[0].txtValue}">
	        <input type="hidden" name="id"  value="${erpPaileiDetailsList[0].id}">
            </b>
        </h3>
        <textarea name="note" cols="" rows="" placeholder="请输入备注说明">${erpPaileiDetailsList[0].note}</textarea>
        <h3>
        	艺术品或收藏展示
            <b style="float:right;">
            <c:if test="${erpPaileiDetailsList[1].txtValue == erpPaileiDetailsList[1].firstValue}">
	           <label for="dd_yes">是</label>
               <input id="dd_yes" class="input_yes" name="2" type="radio" value="是" checked="checked">
               <label for="dd_no">否</label>
	    	   <input id="dd_no" class="input_no" name="2" type="radio" value="否">
	        </c:if>
	        <c:if test="${erpPaileiDetailsList[1].txtValue == erpPaileiDetailsList[1].secondValue}">
	           <label for="dd_yes">是</label>
               <input id="dd_yes" class="input_yes" name="2" type="radio" value="是">
               <label for="dd_no">否</label>
	    	   <input id="dd_no" class="input_no" name="2" type="radio" value="否" checked="checked">
	        </c:if>
	        <c:if test="${empty erpPaileiDetailsList[1].txtValue and erpPaileiDetailsList[1].elementType eq 0}">
	           <label for="dd_yes">是</label>
               <input id="dd_yes" class="input_yes" name="2" type="radio" value="是">
               <label for="dd_no">否</label>
	    	   <input id="dd_no" class="input_no" name="2" type="radio" value="否">
	        </c:if>
	        <input type="hidden" name="txtValue"  value="${erpPaileiDetailsList[1].txtValue}">
	        <input type="hidden" name="id"  value="${erpPaileiDetailsList[1].id}">
            </b>
        </h3>
        <textarea name="note" cols="" rows="" placeholder="请输入备注说明">${erpPaileiDetailsList[1].note}</textarea>
        
        <h3>
        	儿童游戏区域
            <b style="float:right;">
            <c:if test="${erpPaileiDetailsList[2].txtValue == erpPaileiDetailsList[2].firstValue}">
	           <label for="dd_yes">是</label>
               <input id="dd_yes" class="input_yes" name="3" type="radio" value="是" checked="checked">
               <label for="dd_no">否</label>
	    	   <input id="dd_no" class="input_no" name="3" type="radio" value="否">
	        </c:if>
	        <c:if test="${erpPaileiDetailsList[2].txtValue == erpPaileiDetailsList[2].secondValue}">
	           <label for="dd_yes">是</label>
               <input id="dd_yes" class="input_yes" name="3" type="radio" value="是">
               <label for="dd_no">否</label>
	    	   <input id="dd_no" class="input_no" name="3" type="radio" value="否" checked="checked">
	        </c:if>
	        <c:if test="${empty erpPaileiDetailsList[2].txtValue and erpPaileiDetailsList[2].elementType eq 0}">
	           <label for="dd_yes">是</label>
               <input id="dd_yes" class="input_yes" name="3" type="radio" value="是">
               <label for="dd_no">否</label>
	    	   <input id="dd_no" class="input_no" name="3" type="radio" value="否">
	        </c:if>
	        <input type="hidden" name="txtValue"  value="${erpPaileiDetailsList[2].txtValue}">
	        <input type="hidden" name="id"  value="${erpPaileiDetailsList[2].id}">
            </b>
        </h3>
        <textarea name="note" cols="" rows="" placeholder="请输入备注说明">${erpPaileiDetailsList[2].note}</textarea>
        
        <h3>
        	钢琴或其他大件乐器
            <b style="float:right;">
            <c:if test="${erpPaileiDetailsList[3].txtValue == erpPaileiDetailsList[3].firstValue}">
	           <label for="dd_yes">是</label>
               <input id="dd_yes" class="input_yes" name="4" type="radio" value="是" checked="checked">
               <label for="dd_no">否</label>
	    	   <input id="dd_no" class="input_no" name="4" type="radio" value="否">
	        </c:if>
	        <c:if test="${erpPaileiDetailsList[3].txtValue == erpPaileiDetailsList[3].secondValue}">
	           <label for="dd_yes">是</label>
               <input id="dd_yes" class="input_yes" name="4" type="radio" value="是">
               <label for="dd_no">否</label>
	    	   <input id="dd_no" class="input_no" name="4" type="radio" value="否" checked="checked">
	        </c:if>
	        <c:if test="${empty erpPaileiDetailsList[3].txtValue and erpPaileiDetailsList[3].elementType eq 0}">
	           <label for="dd_yes">是</label>
               <input id="dd_yes" class="input_yes" name="4" type="radio" value="是">
               <label for="dd_no">否</label>
	    	   <input id="dd_no" class="input_no" name="4" type="radio" value="否">
	        </c:if>
	        <input type="hidden" name="txtValue"  value="${erpPaileiDetailsList[3].txtValue}">
	        <input type="hidden" name="id"  value="${erpPaileiDetailsList[3].id}">
            </b>
        </h3>
        <textarea name="note" cols="" rows="" placeholder="请输入备注说明">${erpPaileiDetailsList[3].note}</textarea>
        
        <h3>
        	是否摆放专业茶具
            <b style="float:right;">
            <c:if test="${erpPaileiDetailsList[4].txtValue == erpPaileiDetailsList[4].firstValue}">
	           <label for="dd_yes">是</label>
               <input id="dd_yes" class="input_yes" name="5" type="radio" value="是" checked="checked">
               <label for="dd_no">否</label>
	    	   <input id="dd_no" class="input_no" name="5" type="radio" value="否">
	        </c:if>
	        <c:if test="${erpPaileiDetailsList[4].txtValue == erpPaileiDetailsList[4].secondValue}">
	           <label for="dd_yes">是</label>
               <input id="dd_yes" class="input_yes" name="5" type="radio" value="是">
               <label for="dd_no">否</label>
	    	   <input id="dd_no" class="input_no" name="5" type="radio" value="否" checked="checked">
	        </c:if>
	        <c:if test="${empty erpPaileiDetailsList[4].txtValue and erpPaileiDetailsList[4].elementType eq 0}">
	           <label for="dd_yes">是</label>
               <input id="dd_yes" class="input_yes" name="5" type="radio" value="是">
               <label for="dd_no">否</label>
	    	   <input id="dd_no" class="input_no" name="5" type="radio" value="否">
	        </c:if>
	        <input type="hidden" name="txtValue"  value="${erpPaileiDetailsList[4].txtValue}">
	        <input type="hidden" name="id"  value="${erpPaileiDetailsList[4].id}">
            </b>
        </h3>
        <textarea name="note" cols="" rows="" placeholder="请输入备注说明">${erpPaileiDetailsList[4].note}</textarea>
        
        <h3>
        	有无宠物
            <b style="float:right;">
            <c:if test="${erpPaileiDetailsList[5].txtValue == erpPaileiDetailsList[5].firstValue}">
	           <label for="dd_yes">是</label>
               <input id="dd_yes" class="input_yes" name="6" type="radio" value="是" checked="checked">
               <label for="dd_no">否</label>
	    	   <input id="dd_no" class="input_no" name="6" type="radio" value="否">
	        </c:if>
	        <c:if test="${erpPaileiDetailsList[5].txtValue == erpPaileiDetailsList[5].secondValue}">
	           <label for="dd_yes">是</label>
               <input id="dd_yes" class="input_yes" name="6" type="radio" value="是">
               <label for="dd_no">否</label>
	    	   <input id="dd_no" class="input_no" name="6" type="radio" value="否" checked="checked">
	        </c:if>
	        <c:if test="${empty erpPaileiDetailsList[5].txtValue and erpPaileiDetailsList[5].elementType eq 0}">
	           <label for="dd_yes">是</label>
               <input id="dd_yes" class="input_yes" name="6" type="radio" value="是">
               <label for="dd_no">否</label>
	    	   <input id="dd_no" class="input_no" name="6" type="radio" value="否">
	        </c:if>
	        <input type="hidden" name="txtValue"  value="${erpPaileiDetailsList[5].txtValue}">
	        <input type="hidden" name="id"  value="${erpPaileiDetailsList[5].id}">
            </b>
            </b>
        </h3>
        <textarea name="note" cols="" rows="" placeholder="请输入备注说明">${erpPaileiDetailsList[5].note}</textarea>
        
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