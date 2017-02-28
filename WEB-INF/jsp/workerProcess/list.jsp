<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<%@ include file="/WEB-INF/jsp/layout/cssjs.jsp"%>
    <title>进度通报</title>
    <script type="text/javascript">
		$(function(){
			var unaccept = '${unaccept}';
			if(unaccept!=null&&unaccept.length>0){
				layer.alert("当前项目进度还未验收，请联系质检员！",{icon:2},function(){
					window.location.href="/process/list";
				});
				return;
			}
			var unworking = '${unworking}';
			if(unworking!=null&&unworking.length>0){
				layer.alert("请先在【确认开工】中开工！",{icon:2},function(){
					window.location.href="/process/list";
				});
			}
            var unSubmitMoreOne="${unSubmitMoreOne}";
            if(unSubmitMoreOne!=null&&unSubmitMoreOne!="") {
                layer.alert("一天内只能提交完成一个节点！",{icon:2},function() {
                    window.location.href="/process/list";
                });
            }
		})
	</script>
</head>
<body>
	<%@ include file="/WEB-INF/jsp/layout/menu.jsp"%>
    <!--右侧内容框架-->
    <div class="content">
        <!--进度通报-->
        <div class="title">
            <h2 class="color_fff">进度通报</h2>
            <i><img src="/assets-new/4th/img/nav_0.png"></i>
            <%--<a href="#"><img src="/assets-new/4th/img/esc.png"></a>--%>
        </div>
        <hr class="content_hr">
        <table class="table_list" border="0" cellspacing="0" cellpadding="0">
            <tbody>
                <tr class="table_listTr">
                    <th scope="col" width="30%">顾客</th>
                    <th scope="col" width="20%">实际开工日期</th>
                    <th scope="col" width="20%">当前完成进度</th>
                    <th scope="col" width="15%">合同工期</th>
                    <th scope="col" width="15%">操作</th>
                </tr>
            </tbody>
        </table>
        <ul class="paper">
        <c:forEach var="item" items="${list }">
            <li>
                <table class="table_list" border="0" cellspacing="0" cellpadding="0">
                    <tbody>
                        <tr>
                            <td class="text_left" width="30%">
                            	<a class="td_none" href="/order/threePath/toOrderInfoPage?orderNo=${item.orderNo}">
                            	${item.community }-${item.building }-${item.unit }-${item.room }-${item.userName }
                            	</a>
                            </td>
                            <td width="20%"><fmt:formatDate value="${item.workingDate }" pattern="yyyy-MM-dd"/></td>
                            <td width="20%">
	                            <c:if test="${not empty currentMap[item.orderNo] }">
	                         		${currentMap[item.orderNo].name }
	                         	</c:if>
                         	</td>
                            <td width="15%">${item.workDays }天</td>
                            <td width="15%">
                                <a class="td_an" href="/process/threePath/toSetProcess?orderNo=${item.orderNo }">进度管理</a>
                                <a class="td_an" href="/process/threePath/toStopProcess?orderNo=${item.orderNo }">项目停工</a>
                            </td>
                        </tr>
                    </tbody>
                </table>
                <div class="paper_ico">
                	 <c:forEach var="tem" items="${temMap[item.orderNo] }" varStatus="status">
                         <h6>
                    	    <c:set var="key" value="${item.orderNo}.${tem.id }"></c:set>
                 			<c:if test="${empty map[key] }">
		                     	 <i>&nbsp;</i>
		                         <span>${tem.name }</span>
		                         <c:if test="${!status.last }">
		                         	<hr>
		                         </c:if>
	                         </c:if>
                 			<c:if test="${not empty map[key] }">
		                     	<i class="paperover">&nbsp;</i>
		                        <span>${tem.name }</span>
		                        <c:if test="${!status.last }">
		                         	<hr>
		                         </c:if>
	                         </c:if>
                        </h6>
                    </c:forEach>
                </div>
            </li>
            </c:forEach>
        </ul>
    </div>
    <!--右侧内容框架结束-->
    <!--本页JS-->
    <script>
        $(function () {
            //隐藏返回按钮
            $(".title a").hide();
            //删除边线
            /* $(".paper_ico h6 hr:eq(5)").hide();
            $(".paper_ico h6 hr:eq(11)").hide(); */
            //进度显示
          $(".paper td").click(function(){
        	  var index = $(this).parent().find("td").index($(this));
        	  if(index>=1&&index<=3){
        		  if($(this).parents("li").find("div").is(":hidden")){
                      $(".paper_ico").hide();
                      $(this).parents("li").find("div").slideToggle(400)
                  }else{
                      $(this).parents("li").find("div").slideToggle(400)
                  }
        	  }
            })
        })
    </script>
</body>

</html>