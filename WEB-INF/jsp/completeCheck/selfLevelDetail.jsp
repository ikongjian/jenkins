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
        <a href="/complete/check/threePath/inspect?orderNo=${result.erpEkko.legalContract}">
            <img src="/assets-new/img/esc.png">
        </a>
    </div>
    <hr class="content_hr">
    <div class="orderBaseInfo">
        <ul>
            <li><span>采购编码：</span>
                ${result.erpEkko.ebeln}
            </li>
            <li><span>采购内容：</span>
                <c:if test="${result.erpEkko.bsart=='40'}">直送特单</c:if>
                <c:if test="${result.erpEkko.bsart=='41'}">直送特单-沙子水泥</c:if>
                <c:if test="${result.erpEkko.bsart=='42'}">直送特单-壁纸</c:if>
                <c:if test="${result.erpEkko.bsart=='43'}">直送特单-台面</c:if>
                <c:if test="${result.erpEkko.bsart=='44'}">直送特单-自流平</c:if>
                <c:if test="${result.erpEkko.bsart=='91'||result.erpEkko.bsart=='90'}">直配特单</c:if>
            </li>
            <li><span>订单状态：</span>
                <c:if test="${result.erpEkko.statu=='0'}">初审</c:if>
                <c:if test="${result.erpEkko.statu=='1'}">下达</c:if>
                <c:if test="${result.erpEkko.statu=='2'}">已取消</c:if>
                <c:if test="${result.erpEkko.statu=='3'}">已收货</c:if>
                <c:if test="${result.erpEkko.statu=='8'}">复审</c:if>
                <c:if test="${result.erpEkko.statu=='10'}">差异</c:if>
            </li>
            <li><span>交货日期：</span>
                <fmt:formatDate value="${result.erpEkko.webaz}" pattern="yyyy-MM-dd"/>
            </li>
        </ul>
    </div>
		<form action="" method="post" enctype="multipart/form-data" id="detailForm">
            <input type="hidden" name="submitToken" value="${submitToken}"/>
			<input type="hidden" name="ebeln" value="${result.erpEkko.ebeln}">
			<input type="hidden" name="orderNo" value="${result.erpEkko.legalContract}">
			<input type="hidden" name="bsart" value="${result.erpEkko.bsart}">
			<input type="hidden" name="submitNum">
			<input type="hidden" name="submitChange">
			<input type="hidden" id="flag" value="${flag}">
			<input type="hidden" id="cityCode" value="${cityCode}">
			<table class="table_list veiw_table" border="0" cellspacing="0" cellpadding="0">
				<tr class="table_listTr">
					<th scope="col" width="15%">商品编号</th>
	                <th scope="col" width="15%">商品名称</th>
	                <th scope="col" width="10%">单位</th>
	                <th scope="col" width="13%">采购价格</th>
	                <th scope="col" width="10%">采购数量</th>
	                <th scope="col" width="12%">实收数量</th>
	                <th scope="col" width="25%">备注</th>
				</tr>
				<c:forEach items="${result.erpEkpos}" var="erpEkpo">
					<tr class="dataTR" data-id="${erpEkpo.id}">
						<td>${erpEkpo.matnr}</td>
						<td>${erpEkpo.txz01}</td>
						<td>${erpEkpo.meins}</td>
						<td>
							<fmt:formatNumber type="number" value="${erpEkpo.netpr}"/>
						</td>
						<td>
							<fmt:formatNumber type="number" value="${erpEkpo.ktmng}"/>
						</td>
						 <td>
                             <span class="Jian">-</span>
	                         <input class="J_num" type="text" value="${erpEkpo.ktmng}" data-oval="${erpEkpo.ktmng}" data-mlev="${erpEkpo.ktmng}">
                             <span class="Jia">+</span>
	                    </td>  
						<td>${erpEkpo.exlin}</td>
					</tr>
				</c:forEach>
			</table>
			<c:if test="${!empty result.erpEkpos}">
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
			</c:if>
		</form>
</div>
<script type="text/javascript">
	$(function() {
        $(".nav").css("left","-16%");
        $(".nav").removeClass("animate");
        $(".content,.title").css("width","100%");
		$(".Jian").click(function() {
			var oVal=parseFloat($(this).next(".J_num").data("oval"));
			var inputVal=parseFloat($(this).next(".J_num").val());
			inputVal--;
			if(inputVal>=0) {
				$(this).next(".J_num").val(inputVal);
				if(oVal!=inputVal) {
					$(this).parents("tr").addClass("numChange");
				} else {
					$(this).parents("tr").removeClass("numChange");
				}
			}
		});
		$(".Jia").click(function() {
			var oVal=parseFloat($(this).prev(".J_num").data("oval"));
			var inputVal=parseFloat($(this).prev(".J_num").val());
			var mLev=parseFloat($(this).prev(".J_num").data("mlev"));
			inputVal++;
			if(inputVal<=mLev) {
				$(this).prev(".J_num").val(inputVal);
				if(oVal!=inputVal) {
					$(this).parents("tr").addClass("numChange");
				} else {
					$(this).parents("tr").removeClass("numChange");
				}
			}
		});
		$(".J_num").blur(function() {
            var numRegex=/^\d+(\.\d{0,2})?$/;
			var oVal=parseFloat($(this).data("oval"));
			var mLev=parseFloat($(this).data("mlev"));
			var inputVal=$(this).val();
			if(!numRegex.exec(inputVal)||inputVal>mLev) {
				$(this).val(oVal);
                $(this).parents("tr").removeClass("numChange");
			} else {
				if(inputVal<=mLev) {
					if(oVal!=inputVal) {
						$(this).parents("tr").addClass("numChange");
					} else {
						$(this).parents("tr").removeClass("numChange");
					}
				}
			}
		});
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
					var inputVal=parseFloat($(this).find(".J_num").val());
					retVal+=id+"_"+inputVal+",";
					var oVal=$(this).find(".J_num").eq(0).data("oval");
					if(inputVal!=parseFloat(oVal)) {
						$("input[name='submitChange']").val("change");
					}
				});
				if(retVal.length>0) {
					$("input[name='submitNum']").val(retVal.substring(0,retVal.length-1));
				}
                //$(".input_ok").attr("disabled",true);
                $(".input_ok").remove();
                layer.msg('提交中，请稍候',{icon:16,time:10000,shade:0.1});
				$("#detailForm").attr("action","/complete/check/threePath/confirm").submit();
			}
		});
	});
</script>