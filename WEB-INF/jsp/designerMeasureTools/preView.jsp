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
<link href="<%=basePath%>assets/css/designerMeasureTools/css.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="<%=basePath%>assets-new/css/designerMeasureTools/css6.css" media="screen and (min-width: 375px)"> 
<link rel="stylesheet" type="text/css" href="<%=basePath%>assets-new/css/designerMeasureTools/css6plus.css" media="screen and (min-width: 414px)"> 
<script src="<%=basePath%>assets-new/js/designerMeasureTools/jquery.min.js" ></script>
<script src="<%=basePath%>assets-new/js/designerMeasureTools/clgj.js"></script>
<link rel="stylesheet" type="text/css" href="<%=basePath %>assets-new/css/css.css">
<link href="<%=basePath%>assets-new/css/designerMeasureTools/css.css" rel="stylesheet" type="text/css">
</head>
<body>
	<body>
        <div class="content">
        	<!--排雷详情-->
            <div class="order">
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
                           <b>${item.txtValue}
                         <c:if test="${item.txtValue == item.firstValue or item.name == '洗衣机' or item.name == '家具'}">
                         <c:choose>
                         <c:when test="${item.noteType == 1 && item.length != null}">
                           ,${item.noteName}${item.length }cm*${item.width }cm*${item.high}cm
                         </c:when>
                         <c:when test="${item.noteType == 2 && item.length != null}">
                           ,${item.noteName}${item.length }cm*${item.width }cm
                         </c:when>
                         <c:when test="${item.noteType == 3 && item.position != null}">
                           ,${item.noteName}${item.position}
                         </c:when>
                         <c:when test="${item.noteType == 4 && item.updateDate != null}">
                           ${item.noteName}<fmt:formatDate value="${item.updateDate}"
                           pattern="yyyy-MM-dd"/>
                         </c:when>
                         <c:when test="${item.note != null && (item.noteType == 5 || item.noteType == 7)}">
                          ${item.noteName}${item.note}
                         </c:when>
                         <c:when test="${item.noteType == 6 && item.note != null}">
                          ${item.noteName}${item.note}元
                         </c:when>
                         <c:when test="${item.noteType == 8 && item.position != null && item.length != null}">
                                                                              建议位置${item.position}, 建议尺寸，${item.length }cm*${item.width }cm*${item.high}cm
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
              <%--  <c:forEach var="item" items="${mainInfo}">
                 <h2 class="title_h2">${item.name}</h2>
                  <ul class="order_ul_li100 order_ul_li100_span">
                    <li>
                        <b>${item.txtValue}</b>
                    </li>
                  </ul>
              </c:forEach> --%>
        </div>
    </div>
</body>
    <!--  <input class="clgj_nran" type="submit" value="保存">  -->
    <%--  <a  class="clgj_nran" href="/designerMeasureTools/showIndex/${orderNoStr}">保存</a>
     <input class="clgj_nran" type="submit" value="保存" > --%>
     <%-- <input class="clgj_nran" type="submit" value="保存" onclick="window.location.href='/designerMeasureTools/showIndex/${orderNoStr}'">
     <a href="/designerMeasureTools/showIndex/${orderNoStr}">返回修改</a> --%>
     <c:if test="${not empty errMsg }">
     	<p style="text-align:center; padding:0;color:red;">${errMsg}</p>
     </c:if>
     <c:forEach  items="${stateMap}"  var="map"  > 
        <c:if test="${map.value eq 0 or map.value eq 1 or errState eq 1}">
        	<div class="clgj_dx">
        	   <p style="text-align:center; padding:0;color:red;">请填写测量首页的数据!</p>
               <a class="home_no">保存</a>
         	   <a class="home_ok" href="/designerMeasureTools/showIndex/${orderNoStr}">返回修改</a>
          </div>
          
        </c:if>
        <c:if test="${empty errMsg and map.value eq 2 and empty errState}">
        	<div class="clgj_dx">
                 <a class="home_ok" href="/designerMeasureTools/save/${orderNoStr}">保存</a> 
                 <a class="home_ok" href="/designerMeasureTools/showIndex/${orderNoStr}">返回修改</a>
            </div> 
        </c:if>
    </c:forEach> 
    
    <%--  <table>
     	<tr>
     	<th> <input class="home_ok" type="submit" value="保存" onclick="window.location.href='/designerMeasureTools/save/${orderNoStr}'"></th>
     	<th> <input class="home_ok" type="submit" value="返回修改" onclick="window.location.href='/designerMeasureTools/showIndex/${orderNoStr}"></th>
     	</tr>
     </table> --%>
</body>
</html>