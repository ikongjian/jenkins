<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
		<title>Title</title>
	</head>
	<body>
        <a href="/scheduled/workergrab/delete">工人抢单--初始化今天的抢单池</a><br/>
        <a href="/scheduled/workergrab/auto">工人抢单--已被抢单的任务包选定工人组</a><br/>
        <a href="/scheduled/workergrab/unPoolstate">工人抢单--为未被抢单的任务包更新抢单池表的状态</a><br/>
        <a href="/scheduled/workergrab/unPkgstate">工人抢单--未被抢单的任务包更新任务包表状态</a><br/>
        --------------------------------------------------------------------------------------------
        <br>
        <a href="/scheduled/pmgrab/del">项目经理抢单--清除今天的抢单池</a><br/>
		<a href="/scheduled/pmgrab/initpm">项目经理抢单--初始化抢单池</a><br/>
		<a href="/scheduled/pmgrab/auto">项目经理抢单--已被抢单的订单选定项目经理</a><br/>
		<a href="/scheduled/pmgrab/unstate">项目经理抢单--为未被抢单的订单更新状态</a><br/>
		<a href="/scheduled/pmgrab/report">项目经理抢单--通知派单人员为未被抢单的订单手动分配项目经理</a><br/>
	</body>
</html>