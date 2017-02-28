<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="/pageTag" prefix="page"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0"> 

        <title>pager</title>
        <meta name="description" content="description about your site" />
        <meta name="keywords" content="" />
        <meta name="author" content="ZTApps" />
        <link rel="shortcut icon" href="img/favicon.png">
	<script type="text/javascript">
		function toPage(){
			var pageNum=document.getElementById("pageNum").value;
			alert(pageNum);
			location.href="/send/list?pageNumber="+pageNum;
		}
	</script>

    </head>
    <body>
		<div style="width: 100%;text-align: right;">
			共${pager.total}条纪录，当前第${pager.pageNumber}页，每页${pager.limit}条纪录 
			<a href="/send/list?pageNumber=1">首页</a> 
			<a href="/send/list?pageNumber=${pager.pageNumber-1}">上一页</a> 
			<a href="/send/list?pageNumber=${pager.pageNumber+1}">下一页 </a>
			<a href="/send/list?pageNumber=${pager.pages}">末页 </a>
			转到第<input type="text" id="pageNum"  style="width: 40px"/> 页<a style="cursor: pointer;" onclick="toPage();"> 跳转</a>
		</div>		

    </body>
</html>