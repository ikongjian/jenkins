<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%
  String path = request.getContextPath();
  String basePath = request.getScheme() + "://"
          + request.getServerName() + ":" + request.getServerPort()
          + path + "/";
%>
<html>
<head>
  <meta charset="UTF-8">
  <script type="text/javascript" src="<%=basePath %>assets-new/js/jquery-1.8.3.min.js"></script>
</head>
<body>
  <header>
    <label>测试json中文输出 </label><br/>
  </header>


  <button onclick="login()">登录测试</button>
  <input id="hrCode" type="text" placeholder="hrCode">
  <input id="telephone" type="text" placeholder="telephone">
  <span id="testspan"></span>

  <br/>
  <button onclick="appFunction()">App功能列表测试</button>
  <span id="testspan1"></span>

<script>
  function login(){
    var hrCode = $("#hrCode").val();
    var telephone = $("#telephone").val();
    $.post("/app/worker/appLogin",{hrCode:hrCode, telephone:telephone},function(rs){
      $("#testspan").html("{");
      $.each(rs,function(commentIndex,comment)
      {
        $("#testspan").html($("#testspan").html() + "<span style='color: red;'><b>" + commentIndex + "</b></span>:<span style='color: blue;'><b>" + comment + "</b></span>, ");
      });

      $("#testspan").html($("#testspan").html() + "}");
    },"json");
  }


  function appFunction(){
    $.post("/app/worker/actionList",function(rs){
      $("#testspan1").html("");

      $.each(rs,function(commentIndex,comment){
        $("#testspan1").html($("#testspan1").html() + "<br/>" + commentIndex + "条:  {");

        $.each(comment,function(commentIndex,comment){
          $("#testspan1").html($("#testspan1").html() + "<span style='color: red;'><b>" + commentIndex + "</b></span>:<span style='color: blue;'><b>" + comment + "</b></span>,");
        });
        $("#testspan1").html($("#testspan1").html() + "}");
      });
    },"json");
  }
</script>
</body>
</html>
