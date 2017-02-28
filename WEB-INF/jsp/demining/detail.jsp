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

<!DOCTYPE >
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" name="viewport">
<meta content="no-cache" http-equiv="pragma">
<meta content="no-cache" http-equiv="cache-control">
<meta content="0" http-equiv="expires">
<title>排雷详情</title>
<link rel="stylesheet" type="text/css" href="<%=basePath %>assets-new/css/css.css">
<script src="<%=basePath %>assets-new/js/jquery-1.8.3.min.js"></script>
<script src="<%=basePath %>assets-new/js/jiajian.js"></script>
</head>

<body>
<div class="right frame">
    	<!--头部-->
    	<header>
        	<h6>排雷详情</h6>
        	<a href="javascript:void(0);" onclick="winBack()"><img src="<%=basePath %>assets-new/img/esc.png"></a>
        	<input type="hidden" name="navClass" id="navClass" value="nav_a1"/>
        </header>
        <div class="content">
        	<!--排雷详情-->
            <div class="order">
            	<h2 class="title_h2">客户信息</h2>
                <ul class="order_ul_li100_span">
                	<li>
                    	<span>订单编号：</span>
                        <b>${customInfo.orderNo}</b>
                    </li>
                    <li>
                    	<span>客户姓名：</span>
                        <b>${customInfo.userName }</b>
                    </li>
                    <li>
                    	<span>客户性别：</span>
                        <c:choose>
                        <c:when test="${customInfo.gender == 0 }">
                         <b>女</b>
                        </c:when>
                        <c:otherwise>
                         <b>男</b>
                        </c:otherwise>
                        </c:choose>
                    </li>
                    <li>
                    	<span>客户电话：</span>
                        <b>${customInfo.mobile }</b>
                    </li>
                    <li>
                    	<span>设 计 师：</span>
                        <b>${customInfo.designer }</b>
                    </li>
                    <li>
                    	<span>开工时间：</span>
                        <b><fmt:formatDate value="${customInfo.workDate }"
                           pattern="yyyy-MM-dd"/></b>
                    </li>
                    <li>
                    	<span>房本面积：</span>
                        <b>${paileiInfo.fangbenArea}㎡</b>
                    </li>
                    <li>
                    	<span>套内面积：</span>
                        <b>${paileiInfo.taoneiArea}㎡</b>
                    </li>
                    <li>
                    	<span>风 格：</span>
                        <b>${paileiInfo.style}</b>
                    </li>
                    <li>
                    	<span>工程地址：</span>
                        <b>${paileiInfo.projectAddress}</b>
                    </li>
                </ul>
               <c:forEach var="paileiMap" items="${paileiMapper}">
                 <h2 class="title_h2">${paileiMap.key}</h2>
                  <ul class="order_ul_li100 order_ul_li100_span">
                    <c:forEach var="item" items="${paileiMap.value}">
                     <li>
                        <c:choose>
                         <c:when test="${item.type == 6 }">
                            <c:if test="${item.txtValue == item.firstValue}">
                             <b>${item.name}
                             <c:if test="${not empty item.note }">
                             :${item.note}
                            </c:if>
                             </b>
                           </c:if>
                         </c:when>
                         <c:otherwise>
                           <span>${item.name}：</span>
                           <b>${item.txtValue }
                         <c:if test="${item.txtValue == item.firstValue or item.name == '洗衣机' or item.name == '家具'}">
                         <c:choose>
                         <c:when test="${item.noteType == 1 && item.length != null}">
                           ,${item.noteName}${item.length }*${item.width }*${item.high}
                         </c:when>
                         <c:when test="${item.noteType == 2 && item.length != null}">
                           ,${item.noteName}${item.length }*${item.width }
                         </c:when>
                         <c:when test="${item.noteType == 3 && item.position != null}">
                           ,${item.noteName}${item.position}
                         </c:when>
                         <c:when test="${item.noteType == 4 && item.updateDate != null}">
                           ,${item.noteName}<fmt:formatDate value="${item.updateDate}"
                           pattern="yyyy-MM-dd"/>
                         </c:when>
                         <c:when test="${item.note != null && (item.noteType == 5 || item.noteType == 7)}">
                          ,${item.noteName}${item.note}
                         </c:when>
                         <c:when test="${item.noteType == 6 && item.note != null}">
                          ,${item.noteName}${item.note}元
                         </c:when>
                         <c:when test="${item.noteType == 8 && item.position != null && item.length != null}">
                           ,建议位置${item.position}, 建议尺寸，${item.length }*${item.width }*${item.high}
                         </c:when>
                         <c:otherwise>
                         </c:otherwise>
                         </c:choose>
                         </c:if>  
                        </b>                   
                         </c:otherwise>
                        </c:choose>
                     </li>
                    </c:forEach>
                 </ul>
               </c:forEach>
               <c:forEach var="item" items="${mainInfo}">
                 <h2 class="title_h2">${item.name}</h2>
                  <ul class="order_ul_li100 order_ul_li100_span">
                    <li>
                        <b>${item.txtValue}</b> 
                    </li>
                  </ul>
              </c:forEach>
        </div>
    </div>
    </div>
</body>
</html>

