<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="/WEB-INF/jsp/layout/cssjs.jsp"%>
<style type="text/css">
	.veiw_table tr.numChange td {background:#fff7ec;}
    input[type=button] {
        margin-top: 1rem;
        width: 100%;
        height: 4.16rem;
        font-size: 2rem;
        background: #ed6c00;
        border-radius: 0.5rem;
        color: #fff;
    }
</style>
<div class="content">
    <div class="title">
		<h2>收货明细</h2>
		<a href="/complete/check/threePath/inspect?orderNo=${orderNo}">
			<img src="/assets-new/img/esc.png">
		</a>
	</div>
    <hr class="content_hr">
	<div class="orderBaseInfo">
        <ul>
            <li><span>安装单号：</span>
                ${installNo}
            </li>
            <li><span>采购内容：</span>
                直配特单-地板
            </li>
            <li><span>安装状态：</span>
                <c:if test="${installState==10}">创建</c:if>
                <c:if test="${installState==20}">下达</c:if>
                <c:if test="${installState==30}">验收完成</c:if>
                <c:if test="${installState==40}">部分验收</c:if>
            </li>
            <li><span>安装日期：</span>
                <fmt:formatDate value="${installDate}" pattern="yyyy-MM-dd"/>
            </li>
        </ul>
    </div>
    <form action="" method="post" enctype="multipart/form-data" id="detailForm">
        <input type="hidden" name="submitToken" value="${submitToken}"/>
        <input type="hidden" name="submitNum">
        <input type="hidden" id="flag" value="${flag}">
        <input type="hidden" id="cityCode" value="${cityCode}">
        <input type="hidden" name="bsart" value="floor">
        <input type="hidden" name="installNo" value="${installNo}">
        <input type="hidden" name="orderNo" value="${orderNo}">
        <!--收货明细-->
        <table class="table_list veiw_table" border="0" cellspacing="0" cellpadding="0">
            <tr class="table_listTr">
                <th scope="col" width="20%">商品编号</th>
                <th scope="col" width="20%">安装项目</th>
                <th scope="col" width="10%">预估数量</th>
                <th scope="col" width="10%">单位</th>
                <th scope="col" width="20%">花色</th>
                <th scope="col" width="20%">规格型号</th>
            </tr>
            <c:forEach items="${details}" var="detail">
                <tr>
                    <td>${detail.productNo}</td>
                    <td>${detail.maktx}</td>
                    <td><fmt:formatNumber type="number" value="${detail.num}"/></td>
                    <td>${detail.unit}</td>
                    <td>${detail.color}</td>
                    <td>${erpEkpo.zmarque}</td>
                </tr>
            </c:forEach>
        </table>
        <div class="projectForm">
            <div class="formGroupBox">
                <div class="formGroup">
                    <label>验收人</label>
                    <p class="iconForward">
                        <input type="text" name="checkUserName" value="${realName}"/>
                    </p>
                </div>
                <div class="formGroup">
                    <label>验收时间</label>
                    <p class="iconForward">
                        <input class="input_date" type="date" name="checkDate" value="<fmt:formatDate value='${currentDate}' pattern='yyyy-MM-dd'/>"/>
                    </p>
                </div>
                <div class="pmBuildDet formGroup">
                    <label>上传验收单</label>
                    <div class="upBuildPic">
                        <label for="upPic" class="textarea_p">
                            <c:choose>
                                <c:when test="${cityCode=='101'&&flag=='1'}">
                                    <img class="preImg" src="/assets-new/img/shouhuo.jpg" width="65%" height="300px">
                                </c:when>
                                <c:otherwise>
                                    <img class="preImg" src="/assets-new/img/shouhuo1.jpg" width="65%" height="300px">
                                </c:otherwise>
                            </c:choose>
                            <input id="upPic" class="photo_input none" type="file" accept="image/*" name="imageFile">
                        </label>
                    </div>
                </div>
            </div>
            <div class="submitWrap">
                <input class="input_ok" type="button" value="确定"/>
            </div>
        </div>
    </form>
</div>
<script type="text/javascript">
	$(function() {
        $(".nav").css("left","-16%");
        $(".nav").removeClass("animate");
        $(".content,.title").css("width","100%");
		$(".textarea_p").click(function() {
			var fileInput=$(this).children(".photo_input")[0];
			var img=$(this).children(".preImg")[0];
			cameraAndShow(fileInput,img);
		});
		function cameraAndShow(fileInput,img) {
			if(fileInput&&img) {
				fileInput.onchange=function(event) {
					var files=event.target.files,file;
					if(files&&files.length>0) {
						file=files[0];
						try {
							var fileReader=new FileReader();
							fileReader.readAsDataURL(file);
							fileReader.onload=function(event) {
								img.src=event.target.result;
							};
						} catch(e) {
							layer.alert("您的浏览器不支持图片预览！",{icon:5});
						}
					}
				};
			}
		}
		$(".input_ok").click(function() {
			var checkUserName=$("input[name='checkUserName']").val();
			var checkDate=$("input[name='checkDate']").val();
			var imgUrl=$(".preImg").attr("src");
			var flag=$("#flag").val();
			var cityCode=$("#cityCode").val();
			if(checkUserName==null||checkUserName=="") {
				layer.alert("请输入验收人姓名！",{icon:2});
				return false;
			} else if(checkDate==null||checkDate=="") {
				layer.alert("请选择验收时间！",{icon:2});
				return false;
			} else if(cityCode=="101"&&flag=="1"&&(imgUrl==null||imgUrl=="/assets-new/img/shouhuo.jpg")) {
				layer.alert("请上传验收单！",{icon:2});
				return false;
			} else {
				var retVal="";
				$(".dataTR").each(function() {
					var id=$(this).data("id");
					var inputVal=parseFloat($(this).find(".jiajianshu").val());
					retVal+=id+"_"+inputVal+",";
				});
				if(retVal.length>0) {
					$("input[name='submitNum']").val(retVal.substring(0,retVal.length-1));
				}
				$(".input_ok").attr("disabled",true);
                layer.msg('提交中，请稍候',{icon:16,time:5000,shade:0.1});
				$("#detailForm").attr("action","/complete/check/threePath/confirm").submit();
			}
		});
	});
</script>