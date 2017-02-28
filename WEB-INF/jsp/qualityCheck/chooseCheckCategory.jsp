
<!-- kenan 2015 12 28 -->

<!DOCTYPE html>
<html lang="en">

<head>
	<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	<meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,minimum-scale=1.0,user-scalable=no">
	<meta name="format-detection" content="telephone=no">
	<meta name="apple-mobile-web-app-capable" content="yes">

	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
	<%
		String path = request.getContextPath();
		String basePath = request.getScheme() + "://"
				+ request.getServerName() + ":" + request.getServerPort()
				+ path + "/";
	%>
	<title>选择质检项</title>
	<link href="/assets-new/css/qualityCheck/css.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="/assets-new/js/jquery-1.8.3.min.js"></script>
	<script type="text/javascript" src="/assets-new/js/qualityCheck/zhijian.js"></script>
</head>

<body>
<!--头部-->
<header class="head_unified">
	<a
			<c:if test="${checktype==10}">href="/qualityCheck/xjlist"</c:if>
			<c:if test="${checktype==20}">href="/qualityCheck/inviteList"</c:if>
			<c:if test="${checktype==30 || checktype == 40}">href="/qualityCheck/rechecklist"</c:if>>
		<img src="/assets-new/img/qualityCheck/esc.png"></a>
	选择质检项
	<!-- <a class="head_right" href="#" onclick="submit()">进入</a> -->

	<a class="head_right"><img class="login" src="<%=basePath %>assets-new/img/qualityCheck/login.png"></a>
	<div class="login_show">
		<a class="login_gai" href="/qualityCheck/showReset">修改密码</a>
		<a class="longin_esc" href="/qualityCheck/logout">退出登录</a>
		<img src="<%=basePath %>assets-new/img/qualityCheck/login3.png">
	</div>
</header>

<!--选择质检项-->
<div class="j_Choice">
	<!--项目列表-->
	<div class="j_Choice_term">

		<c:forEach var="doclist" items="${checkParentList}" varStatus="i">
		<ul>
			<li>
				<div class="item">
					<c:choose>
						<c:when test="${doclist.mustCheck == 1}">
							<input type="checkbox" name="parentCategoryId" id="${i.index}" value="${doclist.id}" checked disabled/>
							<label for="${i.index}" class="checked">${doclist.parentCategoryName}</label>
							<span class="fold"></span>
						</c:when>
						<c:otherwise>
							<input type="checkbox" name="parentCategoryId" id="${i.index}" value="${doclist.id}" <c:if test="${doclist.checked}">checked</c:if>/>
							<label for="${i.index}" <c:if test="${doclist.checked}">class="checked"</c:if>>${doclist.parentCategoryName}</label>
							<span class="fold"></span>
						</c:otherwise>
					</c:choose>
				</div>
				<dl>

						<%--<div class="j_check">--%>
						<%--<input type="checkbox" name="option_${i.count}" id="option_check_${i.count}" style="display: none;"--%>
						<%--onClick="selectAll('option_check_${i.count}','option_${i.count}')" />--%>
						<%--<label for="option_check_${i.count}">全选</label>--%>
						<%--</div>--%>

					<!-- kenan 质检明细 -->
					<c:forEach var="dtllist" items="${checkList[doclist]}" varStatus="j">
						<%--<input type="checkbox" name="option_${i.count}" id="option_${i.count}_${j.count}"  value="${dtllist.id}" style="display: none;"--%>
						<%--<c:if test="${dtllist.checked == true || dtllist.mustCheck == 0}" >checked="checked"</c:if>--%>
						<%--<c:if test="${dtllist.mustCheck == 0}" >disabled="disabled"</c:if>/>--%>
						<%--<label for="option_${i.count}_${j.count}">${dtllist.categoryName}</label>--%>
						<dd>${dtllist.categoryName}</dd>
					</c:forEach>
				</dl>
			</li>
		</ul>
		</c:forEach>

	</div>
</div>

<%--<div style="display:block; text-align:center;">--%>
<%--<a style="display:inline-block; width:35%; text-align:center; margin:1rem auto; border:1px solid #ff9f78; color:#ff4a00; line-height:1.9rem;"--%>
<%--href="#" onclick="submit()">进入</a>--%>
<%--</div>--%>
<div class="j_bottom j_bottom_sim">
	<a class="orangeBtn" href="javascript:void(0);" onclick="submit()">开始检查</a>
</div>


<script type="text/javascript">

    function submit(){

        var form = $("<form action='/qualityCheck/selectCategory' method='post'></form>");
        var checkid = $("<input name='checkId' type='hidden' value='${checkId}'/> ");
        var checktype = $("<input name='checktype' type='hidden' value='${checktype}'/> ");
        form.append(checkid).append(checktype);

        //火狐兼容
        $("body").append(form);

        $("input[name=parentCategoryId]:checked").each(function(){
            var value = $(this).val();
            form.append("<input type='checkbox' name = 'parentCategoryId' style='display:none;' checked='checked' value='" + value + "'/>");
        });

        if($("input[name=parentCategoryId]:checked").size() == 0){
            alert("请至少选择一个质检大类");
            return ;
        }


        form.submit();
    }



    function onChange(){

    }
</script>

</body>
</html>







