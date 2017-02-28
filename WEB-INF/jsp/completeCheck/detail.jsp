<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<head>
<%@ include file="/WEB-INF/jsp/layout/cssjs.jsp"%>
<title>验收明细</title>

<style type="text/css">
.formGroup input[type=button] {
  margin-top: 1rem;
  width: 100%;
  height: 5.0rem;
  font-size: 2.4rem;
  background: #ed6c00;
  border-radius: 0.5rem;
  color: #fff;
}
</style>

</head>
<body>
    <div class="content">
        <div class="title">
            <h2>验收明细</h2>
            <a href="/complete/check/threePath/inspect?orderNo=${orderNo}"><img src="/assets-new/img/esc.png"></a>
        </div>
        <hr class="content_hr">
        <div class="orderBaseInfo">
            <ul>
                <li>
	                <c:if test="${bsart!='floor'}">
						<span>采购编号：</span>${result.erpEkko.ebeln}
					</c:if>
					<c:if test="${bsart=='floor'}">
						<span>安装单号：</span>${installNo}
					</c:if>
                </li>
                <li>
                    <span>采购内容：</span>
                    <c:if test="${result.erpEkko.bsart=='40'}">直送特单</c:if>
                    <c:if test="${result.erpEkko.bsart=='41'}">直送特单-沙子水泥</c:if>
				    <c:if test="${result.erpEkko.bsart=='42'}">直送特单-壁纸</c:if>
				    <c:if test="${result.erpEkko.bsart=='43'}">直送特单-台面</c:if>
				    <c:if test="${result.erpEkko.bsart=='44'}">直送特单-自流平</c:if>
                    <c:if test="${result.erpEkko.bsart=='91'||result.erpEkko.bsart=='90'}">直配特单</c:if>
				    <c:if test="${bsart=='floor'}">直配特单-地板</c:if>
				</li>
                <li>
                    <c:if test="${bsart!='floor'}">
						<span>订单状态：</span>
						<c:if test="${result.erpEkko.statu=='0'}">初审</c:if>
						<c:if test="${result.erpEkko.statu=='1'}">下达</c:if>
						<c:if test="${result.erpEkko.statu=='2'}">已取消</c:if>
						<c:if test="${result.erpEkko.statu=='3'}">已收货</c:if>
						<c:if test="${result.erpEkko.statu=='8'}">复审</c:if>
						<c:if test="${result.erpEkko.statu=='10'}">差异</c:if>
					</c:if>
					<c:if test="${bsart=='floor'}">
						<span>安装状态：</span>
						<c:if test="${installState==10}">创建</c:if>
						<c:if test="${installState==20}">下达</c:if>
						<c:if test="${installState==30}">验收完成</c:if>
						<c:if test="${installState==40}">部分验收</c:if>
					</c:if>
                </li>
                <li>
                     <c:if test="${bsart!='floor'}">
						<span>交货日期：</span>
						<fmt:formatDate value="${result.erpEkko.webaz}" pattern="yyyy-MM-dd"/>
					</c:if>
					<c:if test="${bsart=='floor'}">
						<span>安装日期：</span>
						<fmt:formatDate value="${installDate}" pattern="yyyy-MM-dd"/>
					</c:if>
                </li>
            </ul>
        </div>
        <c:choose>
			<c:when test="${result.erpEkko.bsart=='41'}">
				<table class="table_list" border="0" cellspacing="0" cellpadding="0">
				<tbody>
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
						<tr>
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
							 	<fmt:formatNumber type="number" value="${erpEkpo.abmng}"/>
		                    </td>  
							<td>${erpEkpo.exlin}</td>
						</tr>
					</c:forEach>
					<tbody>
				</table>
			</c:when>
			<c:when test="${result.erpEkko.bsart=='44'}">
				<table class="table_list" border="0" cellspacing="0" cellpadding="0">
				<tbody>
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
						<tr>
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
							 	<fmt:formatNumber type="number" value="${erpEkpo.abmng}"/>
		                    </td>
							<td>${erpEkpo.exlin}</td>
						</tr>
					</c:forEach>
					<tbody>
				</table>
			</c:when>
			<c:when test="${result.erpEkko.bsart=='43'}">
				<table class="table_list" border="0" cellspacing="0" cellpadding="0">
					<tbody>
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
						<tr>
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
							 	<fmt:formatNumber type="number" value="${erpEkpo.abmng}"/>
		                    </td>  
							<td>${erpEkpo.exlin}</td>
						</tr>
					</c:forEach>
					<c:forEach items="${basins}" var="basin">
						<tr class="penTR" data-mantr="${basin.matnr}" data-meins="${basin.meins}">
							<td>${basin.matnr}</td>
							<td>${basin.maktg}</td>
							<td>${basin.meins}</td>
							<td>
							</td>
							<td>
								<fmt:formatNumber type="number" value="${basin.kmpmg}"/>
							</td>
							 <td>
		                         <%--<fmt:formatNumber type="number" value="${basin.kmpmg}"/>--%>
		                    </td>  
							<td></td>
						</tr>
					</c:forEach>
					</tbody>
				</table>
			</c:when>
			<c:when test="${bsart=='floor'}">
				<table class="table_list" border="0" cellspacing="0" cellpadding="0">
				<tbody>
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
							<td>
								<fmt:formatNumber type="number" value="${detail.num}"/>
							</td>
							<td>
								${detail.unit}
							</td>
							 <td>
		                         ${detail.color}
		                    </td>  
							<td>${erpEkpo.zmarque}</td>
						</tr>
					</c:forEach>
					</tbody>
				</table>
			</c:when>
			<c:otherwise>
				<!--收货明细-->
				<table class="table_list" border="0" cellspacing="0" cellpadding="0">
					<tbody>
					<tr class="table_listTr">
						<th scope="col" width="15%">商品编号</th>
						<th scope="col" width="20%">商品名称</th>
						<th scope="col" width="20">规格/型号/颜色</th>
						<th scope="col" width="10%">单位</th>
						<th scope="col" width="10%">采购数量</th>
						<th scope="col" width="25%">备注</th>
					</tr>
					<c:forEach items="${result.erpEkpos}" var="erpEkpo">
						<tr>
							<td>${erpEkpo.matnr}</td>
							<td>${erpEkpo.txz01}</td>
							<td>${erpEkpo.mfrpn}</td>
							<td>${erpEkpo.meins}</td>
							<td><fmt:formatNumber value="${erpEkpo.ktmng}" type="number"/></td>
							<td>${erpEkpo.exlin}</td>
						</tr>
					</c:forEach>
					</tbody>
				</table>
			</c:otherwise>
		</c:choose>
        <div class="projectForm">
            <div class="formGroupBox">
		        <c:choose>
					<c:when test="${bsart!='floor'}">
						   <div class="formGroup">
			                    <label>验收人</label>
			                    <p>${result.erpEkko.checkuser}</p>
			                </div>
			                <div class="formGroup">
			                    <label>验收时间</label>
			                    <p><fmt:formatDate value="${result.erpEkko.checkdate}" pattern="yyyy-MM-dd"/></p>
			                </div>
			                <div class="pmBuildDet formGroup">
			                    <label>验收单</label>
			                    <div class="upBuildPic">
			                        <img class="preImg" src="${result.erpEkko.url}" width="65%" height="300px">
			                    </div>
			                </div>
					</c:when>
					<c:otherwise>
						<div class="formGroup">
								<label>验收人：</label>
								<p>${checkUser}</p>
						</div>
						<div class="formGroup">
								<label>验收时间</label>
								<p><fmt:formatDate value="${checkDate}" pattern="yyyy-MM-dd"/></p>
						</div>
						<div class="formGroup">	
								<label>验收单</label>
								<div class="upBuildPic">
								<img class="preImg" src="${imgUrl}" width="65%" height="300px">
								</div>
						</div>
					</c:otherwise>
				</c:choose>
			</div>
			 <div class="submitWrap">
                    <!--<input type="submit" value="发送播报">-->
                    <button id="submitId" class="inputSubmit">返回</button>
             </div>
        </div>
    
        
    </div>
    <script type="text/javascript">
        $(function() {
            $(".nav").css("left","-16%");
            $(".nav").removeClass("animate");
            $(".content,.title").css("width","100%");
            
            //页面要求添加返回按钮
            $("#submitId").click(function() {
            	 window.location.href='/complete/check/threePath/inspect?orderNo=${orderNo}';
            });
            
        });            
    </script>
</body>