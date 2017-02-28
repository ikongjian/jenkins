<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>工序创建</title>
<link href="<%=basePath%>/assets/css/css.css" rel="stylesheet" type="text/css" />
<script src="<%=basePath%>/assets/js/jquery-1.8.3.min.js"></script>
<script type="text/javascript">
	function pmChange(){
		var pmCode = $("#pmCode").find("option:selected").val();
		$.post("/taskCreateTmpAction/getProjectListByPM",
				{
					pmCode:pmCode,
					token:token,
					loginUserName:loginUserName
			    },function(data){
			var opStr = "<option value=''>--请选择--</option>";
			for (var i = 0; i < data.length; i++) {
				var pro = data[i];
				opStr += "<option value='"+ pro.orderNo+"'>"+ pro.orderNo+"-"
				+ pro.userName +"-"+ pro.community +"</option>";
			}
			$("#projectId").html(opStr);
		});
	}
	function submitTask(){
		var pmCode = $("#pmCode").find("option:selected").val();
		var projectId = $("#projectId").find("option:selected").val();
		var taskName = $("#taskName").val();
		var category = $("#category").find("option:selected").val();
		/* if(pmCode == null || pmCode.length == 0){
			alert("请选择项目经理");
			return;
		} */
		if(projectId == null || projectId.length == 0){
			alert("请选择项目");
			return;	
		}
		if(taskName == null || taskName.length == 0){
			alert("请填写工序名称");
			return;
		}
		if(category == null || category.length == 0){
			alert("请选择工序类型");
			return;
		}
		$("#token").val(token);
		$("#loginUserName").val(loginUserName);
		$.ajax({
			cache: true,
			type: "POST",
			url:"/taskCreateTmpAction/createPersonalityTask",
			data:$('#taskForm').serialize(),
			async: false,
		    error: function(request) {
		        alert("Connection error");
		    },
		    success: function(data) {
			   alert(data.msg);
		    }
		});

	}
</script>
</head>
<body>
<div class="start details m_jbxx">
	<h1>后台添加个性化工序      <font color="red">【请谨慎操作】</font></h1>
	
	<form action="" name="taskForm" id="taskForm">
		<table class="m_pb">
			<tr>
				<th>项目经理：</th>
				<td>
					<select name="pmCode" id="pmCode" onchange="pmChange()">
						<option value="">--请选择--</option>
						<c:forEach var="item" items="${projectList }">
							<option value="${item.memberCode }">${item.realName }</option>
						</c:forEach>
					</select>
				</td>
			</tr>
			<tr>
				<th>订单：</th>
				<td>
					<select name="projectId" id="projectId">
						<option>--请选择--</option>
						<c:forEach var="item" items="${workingList }">
							<option value="${item.orderNo }">${item.orderNo }-${item.userName }-${item.community }</option>
						</c:forEach>
					</select>
				</td>
			</tr>
			<tr>
				<th>工序名称：</th>
				<td><input type="text" name="taskName" id="taskName"/></td>
				<th>工序类型：</th>
				<td>
					<select name="category" id="category">
						<option value="10">标准工序</option>
						<!-- <option>拍照工序</option>
						<option>台面测量工序</option>
						<option>台面安装工序</option> -->
					</select>
				</td>
			</tr>
			<tr>
				<td colspan="4"><input type="button" onclick="submitTask()" value="提交"></td>
			</tr>
		</table>
		<input type="hidden" name="token" id="token"/>
	    <input type="hidden" name="loginUserName" id="loginUserName"/>
	</form>
	</div>
</body>
</html>