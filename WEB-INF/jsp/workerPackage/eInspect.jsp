<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>

<head>
    <%@ include file="/WEB-INF/jsp/layout/cssjs.jsp" %>
    <link rel="stylesheet" type="text/css" href="/assets-new/jquery-raty/jquery.raty.css">
    <script type="text/javascript" src="/assets-new/jquery-raty/jquery.raty.js"></script>
    <link rel="stylesheet" type="text/css" href="/assets-new/jquery-weui/css/weui.css">
    <link rel="stylesheet" type="text/css" href="/assets-new/jquery-weui/css/jquery-weui.css">
    <script type="text/javascript" src="/assets-new/jquery-weui/js/jquery-weui.js"></script>

    <link rel="stylesheet" type="text/css" href="<%=basePath %>assets-new/css/qualityCheck/mb.zoomify.css" media="screen" />
    <script type="text/javascript" src="<%=basePath %>assets-new/js/qualityCheck/mb.zoomify.js"></script>

    <style type="text/css">
        header {
            background:none;
        }

        .demos-second-title {
            text-align:center;
            font-size:24px;
            color:#3cc51f;
            font-weight:400;
            margin:0 15%;
        }
        .radio {
            background:rgba(0, 0, 0, 0) no-repeat scroll left center / 1.5rem auto;
            padding-left:0.5rem;
        }
        .taskCheck input, .taskMaterial input {
            margin-right:0rem;
            padding:0 0em;
        }
        .taskCount input, .taskJunction input {
            height:1.8rem;
            margin-right:0.4rem;
            margin-top:1.3rem;
            padding:0 0.5rem;
        }
        .taskStaffA {
            width:100%;
        }
        .use_sp_worker {
            background:rgba(0, 0, 0, 0) none repeat scroll 0 0;
            border:1px solid #ed6c00;
            border-radius:0.3rem;
            color:#ed6c00;
            width:6rem;
        }
        .taskCheck .taskCheck_deta p span {
            width:6.5rem;
        }

        .taskCheck .taskJunction div {
            line-height:2rem;
        }

        .taskStaffAso {
            border-bottom:0.1rem solid #dddee3;
            height:4.8rem;
            line-height:4.8rem;
            padding:0 1.7rem;
            width:100%;
        }

        .taskStaffA input.taskinputText {
            margin-right:3.5rem;
            width:14rem;
        }

        .taskStaffA input.taskinputButton {
            background:rgba(0, 0, 0, 0) none repeat scroll 0 0;
            border:1px solid #ed6c00;
            border-radius:0.3rem;
            color:#ed6c00;
            width:6rem;
        }
        .taskCheck .taskMatch .input_note {
            width:100%
        }
        .taskCheck .taskProject p label {
            width:auto;
        }
        .taskCheck .taskProject p .rating span {
            width:20rem;
        }
        .taskCheck .taskProject p .rating .inspect_score {
            width:5rem;
        }

        .photo_list{ width:100%; overflow:hidden; padding:1.2rem 0 0;}
        .photo_list li{ width:30%; height:15.5rem; text-align:center; overflow:hidden; float:left; margin:0 1.6% 1.2rem;}
        .photo_list li img{ width:100%; height:10rem; border:1px solid #ddd;}
        .photo_list li label.photo_listdelete{ display:block; width:5.2rem; height:2.4rem; line-height:2rem; border:1px solid #767676; font-size:2rem; text-align:center; color:#767676; margin:0.5rem auto;}

    </style>
</head>
<body>
<div class="content" style="width:100%;">
    <form action="/package/eInspect" method="post" id="inspectForm" enctype="multipart/form-data">
        <input type="hidden" name="excipientParam" value="${excipientParam}">
        <input type="hidden" name="procedureMoney" value="${orderPkgInspectVo.procedureMoney}">
        <input type="hidden" name="delayUnitPrice" value="${orderPkgInspectVo.delayUnitPrice}">
        <input type="hidden" name="orderNo" value="${orderPkgInspectVo.orderNo}">
        <input type="hidden" name="pkgId" value="${orderPkgInspectVo.pkgId}">
        <input type="hidden" name="pkgNo" value="${orderPkgInspectVo.pkgNo}">
        <input type="hidden" name="id" value="${orderPkgInspectVo.id}">
        <input type="hidden" name="inspectNo" value="${orderPkgInspectVo.inspectNo}">
        <input type="hidden" name="pkgStatus" value="${orderPkgInspectVo.pkgStatus}">
        <input type="hidden" name="dispatType" value="${orderPkgInspectVo.dispatType}">
        <input type="hidden" name="moneyChangeNos">
        <input type="hidden" name="gradeParam">

        <div class="title widht_84">
            <h2 class="color_fff">爱空间任务包验收单</h2>
            <a href="javascript:void(0);" onclick="window.history.go(-1);"><img class="width_100" src="/assets-new/img/esc.png"></a>
        </div>
        <hr class="content_hr">
        <div class="taskCheck">
            <h3 class="className color_333">基本信息</h3>

            <div class="mix taskCheck_deta">
                <c:if test="${!empty orderPkgInspectVo.inspectNo}">
                    <p><span>验收单号</span><i>${orderPkgInspectVo.inspectNo}</i></p>
                </c:if>
                <p><span>项目名称</span><i>${orderPkgInspectVo.userName}</i></p>

                <p><span>合同编号</span><i>${orderPkgInspectVo.orderNo}</i></p>

                <p><span>任务包名</span><i>${orderPkgInspectVo.pkgName}<c:if test="${orderPkgInspectVo.consType==2}"><font color="red">（返补）</font></c:if></i></p>

                <p><span>任务包号</span><i>${orderPkgInspectVo.pkgNo}</i></p>

                <p><span>工人组长</span><i>${orderPkgInspectVo.workerLeaderName}/${orderPkgInspectVo.workerTelephone}<c:if test="${orderPkgInspectVo.dispatType==2}"><font color="red">（外协工人组）</font></c:if></i></p>

                <p><span>项目经理</span><i>${orderPkgInspectVo.projectManager}</i></p>

                <p><span>户型/面积</span><i>${orderPkgInspectVo.houseType}/<fmt:formatNumber value="${orderPkgInspectVo.measureArea}" type="number"/>㎡</i></p>

                <p><span>设 计 师</span><i>${orderPkgInspectVo.designer}</i></p>
            </div>

            <h3 class="className color_333">项目评定
	        	<input type="button" value=" 上传单据 " style="float: right; margin-right: 5%; border-color: red; color: red; background: white;"
                       onclick="showImg('${orderPkgInspectVo.id}')"/>
        	</h3>

            <div class="mix taskProject">
                <p>
                    <span>验收日期</span>
                    <input class="taskInputdate" type="date" name="inspectDate"
                           value="<fmt:formatDate value='${orderPkgInspectVo.inspectDate}'  pattern='yyyy-MM-dd'/>">
                </p>

                <p>
                    <span>质量</span>
                    <input id="taskQualityOK" type="radio" name="isQuality" value="1" <c:if test="${orderPkgInspectVo.isQuality==1}">checked</c:if>>
                    <label class="radio" for="taskQualityOK">合格</label>
                    <input id="taskQualityNO" type="radio" name="isQuality" value="2" <c:if test="${orderPkgInspectVo.isQuality==2}">checked</c:if>>
                    <label class="radio" for="taskQualityNO">不合格</label>
                    <span class="rating">
                        <span class="inspect_score">请打分</span>
                        <span id="qualityGrade"></span>
                    </span>
                </p>

                <p>
                    <span>工期</span>
                    <input id="taskStageOK" type="radio" name="isDelay" value="1" <c:if test="${orderPkgInspectVo.isDelay==1}">checked</c:if>>
                    <label class="radio" for="taskStageOK">按时完成</label>
                    <input id="taskStageNO" type="radio" name="isDelay" value="2" <c:if test="${orderPkgInspectVo.isDelay==2}">checked</c:if>>
                    <label class="radio" for="taskStageNO">延期</label>
                    <i>
                        <input class="taskStageinput" type="text" name="delayDay" onKeyUp="clearNoNum(this,true,false);" onchange="formatFloat(this);"
                               value="${orderPkgInspectVo.delayDay}">
                        <em class="fl fow">天</em>
                    </i>
                    <span class="rating">
                        <span class="inspect_score">请打分</span>
                        <span id="delayGrade"></span>
                    </span>
                </p>
                <p>
                    <span>服务</span>
                    <input id="taskServerOK" type="radio" name="isComplain" value="1" <c:if test="${orderPkgInspectVo.isComplain==1}">checked</c:if>>
                    <label class="radio" for="taskServerOK">无投诉</label>
                    <input id="taskServerNO" type="radio" name="isComplain" value="2" <c:if test="${orderPkgInspectVo.isComplain==2}">checked</c:if>>
                    <label class="radio" for="taskServerNO">有投诉</label>
                    <i>
                        <input class="taskStageinput" type="text" name="delayDay" onKeyUp="clearNoNum(this,true,false);" onchange="formatFloat(this);" value="0">
                        <em class="fl fow">天</em>
                    </i>
                    <span class="rating">
                        <span class="inspect_score">请打分</span>
                        <span id="complainGrade"></span>
                    </span>
                </p>
                <p>
                    <span>管理处罚</span>
                    <input id="taskPenaltyOK" type="radio" name="isPunish" value="1" <c:if test="${orderPkgInspectVo.isPunish==1}">checked</c:if>>
                    <label class="radio" for="taskPenaltyOK">无</label>
                    <input id="taskPenaltyNO" type="radio" name="isPunish" value="2" <c:if test="${orderPkgInspectVo.isPunish==2}">checked</c:if>>
                    <label class="radio" for="taskPenaltyNO">有</label>
                    <i>
                        <input class="taskPenaltyinput" type="text" name="punishMoney" onKeyUp="clearNoNum(this,true,false);" onchange="formatFloat(this);"
                               value="${orderPkgInspectVo.punishMoney}">
                        <em class="fl fow">元，</em>
                        <em class="fl fow">理由：</em>
                        <input class="taskPenaltyinputNote" type="text" name="punishNote" value="${orderPkgInspectVo.punishNote}">
                    </i>
                </p>
                
                <p>
	                <span>任务包补助</span>
	                <input id="taskSupplyOK" type="radio" name="isSupplyNeeds" value="1" <c:if test="${orderPkgInspectVo.isSupplyNeeds==1}">checked</c:if>>
	                <label class="radio" for="taskSupplyOK">无</label>
	                <input id="taskSupplyNO" type="radio" name="isSupplyNeeds" value="2" <c:if test="${orderPkgInspectVo.isSupplyNeeds==2}">checked</c:if>>
	                <label class="radio" for="taskSupplyNO">有</label>
	                <i>
	                    <input class="taskPenaltyinput" type="text" name="supplyNeedsMoney" onKeyUp="clearNoNum(this,true,false);" onchange="formatFloat(this);" 
	                    	value="${orderPkgInspectVo.supplyNeedsMoney}">
	                    <em class="fl fow">元，</em>
	                    <em class="fl fow">理由：</em>
	                    <input class="taskPenaltyinputNote" type="text" name="supplyNeedsNote" value="${orderPkgInspectVo.supplyNeedsNote}">
	                </i>
	            </p>
                
            </div>
            <h3 class="className color_333">工程清单</h3>

            <div class="mix taskSingle">
                <table class="table_list" border="0" cellspacing="0" cellpadding="0">
                    <thead>
                    <tr class="table_listTr">
                        <th scope="col" width="30%">施工项目</th>
                        <th scope="col" width="10%">单位</th>
                        <th scope="col" width="10%">任务包工程量</th>
                        <th scope="col" width="10%">实际工程量</th>
                        <th scope="col" width="10%">综合单价（元）</th>
                        <th scope="col" width="10%">金额（元）</th>
                        <th scope="col" width="20%">备注</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${procedures}" var="procedure">
                        <tr class="procedureTR">
                            <td>
                                ${procedure.skuName}
                                <input type="hidden" name="skuNos" value="${procedure.skuNo}">
                                <input type="hidden" name="skuNames" value="${procedure.skuName}">
                            </td>
                            <td>
                                ${procedure.unit}
                                <input type="hidden" name="units" value="${procedure.unit}">
                            </td>
                            <td>
                                ${procedure.pkgNum}
                                <input type="hidden" name="pkgNums" value="${procedure.pkgNum}">
                            </td>
                            <td>
                                <input type="text" name="actualNums" onKeyUp="clearNoNum(this,true,false)" onchange="formatFloat(this);countTotalPrice(this);"
                                       value="${procedure.actualNum}">
                            </td>
                            <td>
                                <input type="text" name="prices" value="${procedure.price}" readonly="readonly">
                            </td>
                            <td>
                                <input type="text" name="totalPrices" value="${procedure.totalPrice}" readonly="readonly">
                            </td>
                            <td>
                                <input type="text" name="notes" value="${procedure.note}">
                            </td>
                        </tr>
                    </c:forEach>
                    <tr>
                        <td>合计</td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td class="total_procedure_money">${orderPkgInspectVo.procedureMoney}</td>
                        <td></td>
                    </tr>
                    </tbody>
                </table>
            </div>
            <h3 class="className color_333">辅料核算</h3>

            <div class="mix taskCount">
                <span class="fl color_999 show fow">库房提货金额</span>
                <input type="text" readonly="readonly" name="excipientMoney" value="${orderPkgInspectVo.excipientMoney}">
                <em class="fl show fow color_666">元</em>
                <a class="fr show color_yellow to_excipient_confirm" href="javascript:">从辅料单确认</a>
            </div>
            <h3 class="className color_333">结算汇总</h3>

            <div class="mix taskJunction">
                <span class="fl color_999 show fow">结算金额</span>
                <input type="text" readonly="readonly" name="settleMoney" value="${orderPkgInspectVo.settleMoney}">
                <em class="fl show fow color_666">元</em>

                <div class="taskJunction_text color_999">备注：结算金额=（结算总金额-辅材-工期扣款-管理扣款），首款按${downPayments}%付，尾款按${100-downPayments}%。</div>
            </div>
            <c:if test="${orderPkgInspectVo.dispatType==1}">
                <h3 class="className color_333 taskH3">
                    薪酬分配
                    <p class="fr">
                        <a href="javascript:" class="view_worker_leader_deposit">查看组长质保金</a>
                        <a href="javascript:" class="sp_other_worker">分配给组外人员</a>
                    </p>
                </h3>
                <div class="mix taskMatch">
                    <table class="table_list" border="0" cellspacing="0" cellpadding="0" id="workerTable">
                        <thead>
                        <tr class="table_listTr">
                            <th scope="col" width="20%">工人姓名</th>
                            <th scope="col" width="13%">角色</th>
                            <th scope="col" width="20%">分配金额（元）</th>
                            <th scope="col" width="12%">其中：扣质保金</th>
                            <th scope="col" width="35%">备注</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr data-wtype="innerw">
                            <td>
                                    ${workerLeader.workerName}
                                <input type="hidden" name="workerLeanderNo" value="${workerLeader.memberNo}">
                                <input type="hidden" name="memberNos" value="${workerLeader.memberNo}">
                            </td>
                            <td>
                                组长
                                <input type="hidden" name="isLeaders" value="1">
                                <input type="hidden" name="isConfirms" value="${workerLeader.isConfirm}">
                            </td>
                            <td>
                                <input type="text" name="moneys" onKeyUp="clearNoNum(this,true,false);" onchange="formatFloat(this);" value="${workerLeader.money}"
                                       data-omoney="${workerLeader.money}">
                            </td>
                            <td>
                                <input type="text" placeholder="0" name="depositMoneys" onKeyUp="clearNoNum(this,true,false);" onchange="formatFloat(this);"
                                       value="${workerLeader.depositMoney}">
                            </td>
                            <td>
                                <input class="taskMatch_input input_note" type="text" placeholder="分配金额小于10%,或使用组外人员，必须填写备注" name="rNotes"
                                       value="${workerLeader.note}">
                            </td>
                        </tr>
                        <c:forEach items="${workerMemebers}" var="workerMemeber">
                            <tr data-wtype="innerw">
                                <td>
                                    ${workerMemeber.workerName}
                                    <input type="hidden" name="memberNos" value="${workerMemeber.memberNo}">
                                </td>
                                <td>
                                    组员
                                    <input type="hidden" name="isLeaders" value="2">
                                    <input type="hidden" name="isConfirms" value="${workerMemeber.isConfirm}">
                                </td>
                                <td>
                                    <input type="text" name="moneys" onKeyUp="clearNoNum(this,true,false);" onchange="formatFloat(this);"
                                           value="${workerMemeber.money}" data-omoney="${workerMemeber.money}">
                                </td>
                                <td>
                                    <input type="hidden" name="depositMoneys" value="0">
                                </td>
                                <td>
                                    <input class="taskMatch_input input_note" type="text" placeholder="分配金额小于10%,或使用组外人员，必须填写备注" name="rNotes"
                                           value="${workerMemeber.note}">
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </c:if>
        </div>
        <div class="submitDiv">
            <input class="buttom_1" type="button" value="确认验收">
        </div>
        
        <h3 class="className color_333 taskH3">审核历史</h3>
	        <div class="mix taskMatch">
	            <table class="table_list" border="0" cellspacing="0" cellpadding="0">
	                <thead>
	                    <tr class="table_listTr">
	                        <th scope="col" width="22%">审核人</th>
	                        <th scope="col" width="20%">审核时间</th>
	                        <th scope="col" width="18%">审核状态</th>
	                        <th scope="col" width="30%">说明</th>
	                    </tr>
	                 </thead>
	                 <tbody>
	                    <c:forEach items="${inspectLog}" var="log">
	                    	<c:if test="${log.checkState != 0}">
	                    	<tr data-wtype="innerw">
	                    		<td>${log.checkUserName}</td>
	                    		<td><fmt:formatDate value="${log.checkDate}"  type="both"/></td>
	                    		<td>
	                    			<c:if test="${log.checkState == 1}">通过</c:if>
	                    			<c:if test="${log.checkState == 2}">驳回</c:if>
	                    		</td>
	                    		<td>${log.reason}</td>
		                    </tr>
		                    </c:if>
	                    </c:forEach>
	                </tbody>
	            </table>
	        </div>
	    </form>
    </div>

<div id="excipient_pop" class="weui-popup-container">
    <div class="weui-popup-modal">
        <header class='demos-header'>
            <h2 class="demos-second-title">
                请填写该辅料的实际使用数量
            </h2>
        </header>
        <article class="weui_article">
            <section>
                <table class="table_list" border="0" cellspacing="0" cellpadding="0">
                    <thead>
                    <tr class="table_listTr">
                        <th scope="col" width="12%">SKU</th>
                        <th scope="col" width="17%">辅料名称</th>
                        <th scope="col" width="10%">单位</th>
                        <th scope="col" width="16%">发货日期</th>
                        <th scope="col" width="15%">发货数量</th>
                        <th scope="col" width="15%">结算单价</th>
                        <th scope="col" width="15%">实际使用数量</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${excipients}" var="excipient">
                        <tr data-param="${excipient.skuNo}_${excipient.skuName}_<fmt:formatDate value='${excipient.sendDate}' pattern='yyyy-MM-dd'/>_<fmt:formatNumber value='${excipient.sendNum}' type='number' pattern='0.00'/>"
                            data-price="<fmt:formatNumber value='${excipient.settlePrice}' type='number' pattern='0.00'/>">
                            <td>${excipient.skuNo}</td>
                            <td>${excipient.skuName}</td>
                            <td>${excipient.unit}</td>
                            <td>
                                <fmt:formatDate value="${excipient.sendDate}" pattern="yyyy-MM-dd"/>
                            </td>
                            <td>
                                <fmt:formatNumber value="${excipient.sendNum}" type="number" pattern="0.00"/>
                            </td>
                            <td>
                                <fmt:formatNumber value="${excipient.settlePrice}" type="number" pattern="0.00"/>
                            </td>
                            <td>
                                <input type="hidden" name="settlePrice" value="${excipient.settlePrice}">
                                <input class="taskMatch_input excipient_actual_num" type="text" name="actualNum" onKeyUp="clearNoNum(this,true,false);"
                                       onchange="formatFloat(this);" value="${excipient.actualNum}" data-oval="${excipient.sendNum}" data-ival="${excipient.actualNum}">
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </section>
            <section>
                <a href="javascript:" class="weui_btn weui_btn_plain_primary excipient_confirm">确认</a>
            </section>
        </article>
    </div>
</div>
<div id="worker_pop" class="weui-popup-container">
        <div class="weui-popup-modal">
            <header class='demos-header'>
                <h2 class="demos-second-title">
                    请根据姓名查询工人信息
                    <a class="fr weui_btn weui_btn_plain_primary close-popup" style="margin-left:40px;margin-top:4px" href="javascript:void(0);">
                        <img src="/assets-new/img/esc_2.png"></a>
                </h2>
            </header>
            <article class="weui_article">
                <div class="taskStaffA ba_fff color_333">
                    <div class="taskStaffAso">
                        <span class="fl">工人姓名：</span>
                        <input type="text" class="fl taskinputText text_auto search_worker_name">
                        <input type="button" value="查询" class="fl taskinputButton search_worker">
                    </div>
                </div>
                <section>
                    <table class="table_list" border="0" cellspacing="0" cellpadding="0">
                        <thead>
                        <tr class="table_listTr">
                            <th scope="col" width="25%">姓名</th>
                            <th scope="col" width="25%">工种</th>
                            <th scope="col" width="25%">电话</th>
                            <th scope="col" width="25%">操作</th>
                        </tr>
                        </thead>
                        <tbody class="search_worker_info">
                        </tbody>
                    </table>
                </section>
            </article>
        </div>
    </div>

<!-- Modal 弹出显示照片的框 -->
<div id="showphoto" style="position: fixed; top: 0; left: 0; width: 100%; height: 100%; background: rgba(0, 0, 0, .5); display: none; z-index: 9999;">
    <div id="photodiv" style="background: #fff; font-size: 1rem; width: 94%; margin: 0 auto; position: relative; padding: 2.8rem 1rem 0; overflow: auto; height: 80%">
        <a class="pop_close" href="javascript:void(0);"><img src="<%=basePath %>assets-new/img/qualityCheck/esc1.png"></a>
        <!--头部-->
        <header style="text-align:center; font-size:1.3rem; height:3.4rem; line-height:3.4rem; color:#3b3b3b; border-bottom:1px solid #ededed; position:relative; background:#fff;">
            <%-- <a href="${proUrl}"><img src="<%=basePath %>assets-new/img/qualityCheck/esc.png"></a> --%>
            照片列表
        </header>
        <!--照片列表-->
        <ul id="thumbs" class="photo_list">
        </ul>

        <ul>
            <div style="width:30%; height:13.5rem; text-align:center; overflow:hidden; float:left; margin:0 1.6% 1.2rem;">
                <img class="photo" src="<%=basePath %>assets-new/img/qualityCheck/ipad.png" style="width:100%; height:10rem; border:1px solid #ddd;">
                <input name="imgfile" type="file" accept="image/*" multiple="multiple" style="display:none;">
                <span id="errorMsg" style="color:red;"></span>
            </div>
        </ul>

    </div>
</div>

<script type="text/javascript">

    $(".pop_close").click(function(e) {
        $(".pop_project").hide();
        $("#showphoto").hide();
        $("body").css("overflow","auto")
    });

    $(".photo").click(function(e) {
        $(this).parent().find("input").click()
    });

    /**
     * 查看图片
     */
    function showImg(inspectId){
        $("#showphoto").show();
        $("#thumbs").empty();
        $("#thumbs").html("读取中...........................");

        var imgIds = $(".photo_listdelete").attr("data-id");

        var data = new FormData();
        data.append('inspectId',inspectId);

        if(imgIds != undefined){
            for(var i = 0; i < imgIds.length; i++){
                data.append('imgIds', imgIds[i]);
            }
        }

        $.ajax({
            type:"post",
            url:"/package/viewpic",
            data: data,
            contentType: false, //必须
            processData: false, //必须
            dataType: "json",
            success:function(rs){
                var div = $("#thumbs");
                $("#thumbs").empty();

                for(var i = 0; i < rs.length; i++){

                    var imginfo = rs[i];
                    var str = "<li><img src='" + imginfo.imgUrl + "' data-highres='" + imginfo.imgUrl + "' onclick='$(this).mbZoomify_overlay({startLevel:-1});'>";

                    str += "<label class='photo_listdelete' data-id='" + imginfo.id + "' style='width: 60%;'>删除</label>";
                    str += "</li>";

                    div.append(str);

                }
                var height = $(window).height();
                var popheight = $("#photodiv").height();
                var poptop = (height-popheight)/2;
                $("#photodiv").css("margin-top",poptop);
                $("body").css("overflow","hidden");
            }
        });
    }

    /**
     * 删除图片
     */
    $(".photo_listdelete").live("click",function(){
        var id = $(this).attr("data-id");
        var labeltext = $(this).html();
        if(labeltext == "删除"){
            $(this).html("处理中");
        }else{
            return;
        }

        var clickeddiv = $(this);
        $.post("/package/deleteInspectImg",{inspectImgId:id},
            function(rs){

                var div = $("#thumbs");
                var flag = rs.flag;
                var msg = rs.msg;
                if(flag == 0){
                    clickeddiv.parent().hide();
                }else if(flag == 1){
                    clickeddiv.html(msg);
                }

                var num = $("#span_imgNum").html();
                $("#span_imgNum").html(num-1);

                var height=$(window).height();
                var popheight=$("#photodiv").height();
                var poptop=(height-popheight)/2;
                $("#photodiv").css("margin-top",poptop);
                $("body").css("overflow","hidden")
            },"json");
    });

    //上传图片
    $("input[name=imgfile]").on("change", function() {
        var img=$(this).val();
        var inspectNo = $("input[name=inspectNo]").val();
        var inspectId = $("input[name=id]").val();

        var file=this.files[0];
        var data=new FormData();
        data.append('inspectNo', inspectNo);
        data.append('inspectId', inspectId);

        for (var i = 0; i < this.files.length; i++) {
            data.append('imgfile', this.files[i], this.files[i].name)
        }

        $("#errorMsg").html("");

        //上传突变改为异步处理  并且接收反馈修改照片数量
        $.ajax({
            type: "post",
            url: "/package/uploadImage",
            data: data,
            contentType: false, //必须
            processData: false, //必须
            dataType: "json",
            success: function (rs) {
                if (rs.flag == 1) {
                    $("#errorMsg").html(rs.msg);
                } else {
                    $("input[name=imgfile]").val("");
                    var inspectId = $("input[name=id]").val();
                    showImg(inspectId);
                }
            }
        });
    });

    /*
     * 文本框只能输入整数和小数的js方法
     * obj		dom对象
     * point	是否有小数点，如果为true，可以有小数点；如果为false，不能有小数点（默认为true）
     * none		是否可以为空，如果为true，可以为空；如果为false，不能为空（默认为true）
     *
     */
    function clearNoNum(obj,point,none) {
        obj.value=obj.value.replace(/[^\d.]/g,"");
        obj.value=obj.value.replace(/^\./g,"");
        obj.value=obj.value.replace(/\.{2,}/g,".");
        obj.value=obj.value.replace(".","$#$").replace(/\./g,"").replace("$#$",".");
        if(!none) {
            if(!obj.value||obj.value=="") {
                obj.value="0";
            }
        }
        if(!point) {
            obj.value=obj.value.replace(".","");
        }
    }
    //修整为2位小数
    function formatFloat(obj) {
        if(obj.value!="") {
            var value=parseFloat(obj.value);
            obj.value=value.toFixed(2);
        }
    }
    function formatNum(obj) {
        return obj.toFixed(2);
    }
    function countTotalPrice(obj) {
        var $obj=$(obj);
        var num=parseFloat($obj.val());
        var price=parseFloat($obj.parents("tr").find("input[name='prices']").eq(0).val());
        $obj.parents("tr").find("input[name='totalPrices']").eq(0).val(num*price);
    }
    $(function() {
        $(".nav").css("left","-16%");
        $(".nav").removeClass("animate");
        $(".content,.title").css("width","100%");
        //质量评分
        $("#qualityGrade").raty({
            path:"/assets-new/jquery-raty/images",
            number:10
        });
        $("#qualityGrade").raty("score","${qualityGrade.score}");

        //工期评分
        if("${orderPkgInspectVo.isDelay}"=="1") {
            $("#delayGrade").raty({
                path:"/assets-new/jquery-raty/images",
                number:10
            });
        }
        if("${orderPkgInspectVo.isDelay}"=="2") {
            $("#delayGrade").raty({
                path:"/assets-new/jquery-raty/images",
                number:6
            });
        }
        $("#delayGrade").raty("score","${delayGrade.score}");
        //服务评分
        if("${orderPkgInspectVo.isComplain}"=="1") {
            $("#complainGrade").raty({
                path:"/assets-new/jquery-raty/images",
                number:10
            });
        }
        if("${orderPkgInspectVo.isComplain}"=="2") {
            $("#complainGrade").raty({
                path:"/assets-new/jquery-raty/images",
                number:6
            })
        }
        $("#complainGrade").raty("score","${complainGrade.score}");

        $("#taskQualityOK").click(function() {
            $("#qualityGrade").raty("destroy");
            $("#delayGrade").raty("destroy");
            $("#complainGrade").raty("destroy");
            $("#qualityGrade").raty({
                path:"/assets-new/jquery-raty/images",
                number:10
            });
            $("#qualityGrade").raty("score","${qualityGrade.score}");

            if("${orderPkgInspectVo.isDelay}"=="1") {
                $("#delayGrade").raty({
                    path:"/assets-new/jquery-raty/images",
                    number:10
                });
            }
            if("${orderPkgInspectVo.isDelay}"=="2") {
                $("#delayGrade").raty({
                    path:"/assets-new/jquery-raty/images",
                    number:6
                });
            }
            $("#delayGrade").raty("score","${delayGrade.score}");

            if("${orderPkgInspectVo.isComplain}"=="1") {
                $("#complainGrade").raty({
                    path:"/assets-new/jquery-raty/images",
                    number:10
                });
            }
            if("${orderPkgInspectVo.isComplain}"=="2") {
                $("#complainGrade").raty({
                    path:"/assets-new/jquery-raty/images",
                    number:6
                })
            }
            $("#complainGrade").raty("score","${complainGrade.score}");
            $(".submitDiv").show();
        });
        $("#taskQualityNO").click(function() {
            $(".submitDiv").hide();
            $("#qualityGrade").raty("score",0).raty("readOnly",true);
            $("#delayGrade").raty("score",0).raty("readOnly",true);
            $("#complainGrade").raty("score",0).raty("readOnly",true);
            $.alert("质量不合格的任务包不允许验收！","消息");
        });
        var isDelay="${orderPkgInspectVo.isDelay}";
        if(isDelay=="2") {
            $("#taskStageNO").parent("p").find("i").eq(0).show();
        }
        
      	//按时完成
        $("#taskStageOK").click(function() {
            $("#delayGrade").raty("set",{number:10});
            if("${orderPkgInspectVo.isDelay}"=="1") {
                $("#delayGrade").raty("score","${delayGrade.score}");
            }
            $(this).parent("p").find("i").eq(0).hide();
            $(this).parent("p").find("input[name='delayDay']").eq(0).val("");
            
			reSale();
		});
      	//延期
        $("#taskStageNO").click(function() {
            $("#delayGrade").raty("set",{number:6});
            if("${orderPkgInspectVo.isDelay}"=="2") {
                $("#delayGrade").raty("score","${delayGrade.score}");
            }
            $(this).parent("p").find("i").eq(0).show();
        });
      //无投诉
        $("#taskServerOK").click(function() {
            $("#complainGrade").raty("set",{number:10});
            if("${orderPkgInspectVo.isComplain}"=="1") {
                $("#complainGrade").raty("score","${complainGrade.score}");
            }
        });
      //有投诉
        $("#taskServerNO").click(function() {
            $("#complainGrade").raty("set",{number:6});
            if("${orderPkgInspectVo.isComplain}"=="2") {
                $("#complainGrade").raty("score","0{complainGrade.score}");
            }
        });
      
        var isPunish="${orderPkgInspectVo.isPunish}";
        if(isPunish=="2") {
            $("#taskPenaltyNO").parent("p").find("i").eq(0).show();
        }
      //无处罚
        $("#taskPenaltyOK").click(function() {
            $(this).parent("p").find("i").eq(0).hide();
            $(this).parent("p").find("input[name='punishMoney']").eq(0).val("");
            $(this).parent("p").find("input[name='punishNote']").eq(0).val("");
            reSale();
        });
        //有处罚
		$("#taskPenaltyNO").click(function() {
            $(this).parent("p").find("i").eq(0).show();
        });
        
        var isSupplyNeeds="${orderPkgInspectVo.isSupplyNeeds}";
        if(isSupplyNeeds=="2") {
            $("#taskSupplyNO").parent("p").find("i").eq(0).show();
        }
        //无补助
		$("#taskSupplyOK").click(function() {
			$(this).parent("p").find("i").eq(0).hide();
            $(this).parent("p").find("input[name='supplyNeedsMoney']").eq(0).val("");
            $(this).parent("p").find("input[name='supplyNeedsNote']").eq(0).val("");
			reSale();
		});
        //有补助
		$("#taskSupplyNO").click(function() {
			$(this).parent("p").find("i").eq(0).show();
		});
        //实际工程量
        $("input[name='actualNums']").blur(function() {
            var procedureMoney = 0;
            $(this).parents("tbody").find("input[name='totalPrices']").each(function() {
                procedureMoney+=parseFloat($(this).val());
                $("input[name='procedureMoney']").val(procedureMoney);
            });
            $(".total_procedure_money").html(procedureMoney);
            reSale();
        });
        //延迟天数重算金额
		$("input[name='delayDay']").blur(function() {
			reSale()
		});
        //罚款重算金额
		$("input[name='punishMoney']").blur(function() {
			reSale()
		});
        //补助重算金额
		$("input[name=supplyNeedsMoney]").blur(function(){
			reSale()
		});
        //重算结算金额
		function reSale(){
			var pIsDelay=$(":radio[name='isDelay']:checked").val();
			if(pIsDelay==null) {
				pIsDelay="1";
			}
			var DIsPunish=$(":radio[name='isPunish']:checked").val();
			if(DIsPunish==null) {
				DIsPunish="1";
			}
			var isSupplyNeeds=$(":radio[name='isSupplyNeeds']:checked").val();
			if(isSupplyNeeds==null) {
				isSupplyNeeds="1";
			}
			
			var supMoney = 0;
			var cutMoney = 0;
			var pProcedureMoney=0;//结算总金额
			var pExcipientMoney=parseFloat($("input[name='excipientMoney']").val());
			
			if(isSupplyNeeds == "2"){
				supMoney += parseFloat($("input[name='supplyNeedsMoney']").val());
			}
			if(DIsPunish=="2") {
				cutMoney=cutMoney+parseFloat($("input[name='punishMoney']").val());
			}
			if(pIsDelay=="2") {
				cutMoney=cutMoney+parseFloat($("input[name='delayUnitPrice']").val()*parseFloat($("input[name='delayDay']").val()));
			}
			
			$(".taskSingle table tbody input[name='totalPrices']").each(function() {
				pProcedureMoney+=parseFloat($(this).val());
			});
			
			//结算总金额-延期-罚款-辅材 + 补助
			$("input[name='settleMoney']").val(formatNum(pProcedureMoney-cutMoney-pExcipientMoney+supMoney));
        }
        
        
        $(".to_excipient_confirm").click(function() {
            $("#excipient_pop").css("z-index","95");
            $("#excipient_pop").popup();
        });
        $(".excipient_actual_num").blur(function() {
            var oVal=$(this).data("oval");
            var inputValue=$(this).val();
            /*if(parseFloat(inputValue)>parseFloat(oVal)) {
                $.alert("辅料的实际使用数量不能超过其发货数量！","消息");
                $(this).val($(this).data("ival"));
            }*/
            if(parseFloat(inputValue)>parseFloat(oVal)) {
                $(this).css("color","red");
            } else {
                $(this).css("color","#666");
            }
        });
        $(".excipient_confirm").click(function() {
            var excipientFlag=true;
            var excipientParam="";
            var excipientMoney=0;
            var settleMoney=$("input[name='settleMoney']").val();
            $(".weui_article table tbody tr").each(function() {
                var actualNum=$(this).find("input[name='actualNum']").eq(0).val().trim();
                var oVal=$(this).find("input[name='actualNum']").eq(0).data("oval");
                if(actualNum==null||actualNum=="") {
                    $.alert("请填写辅料的实际使用数量！","消息");
                    excipientFlag=false;
                    return false;
                }
                /*if(parseFloat(actualNum)>parseFloat(oVal)) {
                    $.alert("辅料的实际使用数量不能超过其发货数量！","消息");
                    $(this).val("");
                    excipientFlag=false;
                    return false;
                }*/
                var param=$(this).data("param");
                var num=$(this).find("input[name='actualNum']").eq(0).val().trim();
                var settlePrice=$(this).data("price");
                excipientParam+=param+"_"+num+"_"+settlePrice+"=";
                if(num!=null&&num!=""&&parseFloat(num)>=0) {
                    excipientMoney+=parseFloat(num)*parseFloat(settlePrice);
                }
            });
            excipientParam=excipientParam.substring(0,excipientParam.length-1);
            if(excipientFlag) {
                $("input[name='excipientParam']").val(excipientParam);
                $("input[name='excipientMoney']").val(formatNum(excipientMoney));
                reSale();
                $.closePopup();
            }
        });
        $(".view_worker_leader_deposit").click(function() {
            var workerLeanderNo=$("input[name='workerLeanderNo']").val().trim();
            $.ajax({
                url:"/package/leaderDeposit",
                type:"post",
                data:{code:workerLeanderNo},
                dataType:"json",
                async:false,
                cache:false,
                success:function(result) {
                    $.alert("该组长当前累计有效的质保金：<span class='color_yellow'>"+result.money+"元</span><br/><br/>备注：质保金只从组长中扣除","质保金");
                }
            });
        });
        $(".sp_other_worker").click(function() {
            $(".search_worker_name").val("");
            $("#worker_pop").css("z-index","95");
            $("#worker_pop").popup();
        });
        $(".search_worker").click(function() {
            $(".search_worker_info").empty();
            var name=$(".search_worker_name").val().trim();
            if(name==null||name=="") {
                $.alert("请输入工人姓名！","消息");
            } else {
                $.ajax({
                    url:"/package/worker",
                    type:"post",
                    data:{name:name},
                    dataType:"json",
                    async:false,
                    cache:false,
                    success:function(result) {
                        if(result!=null&&result.length>0) {
                            for(var i=0; i<result.length; i++) {
                                var opBtn="<input type='button' value='使用' class='fl taskinputButton use_sp_worker' data-name='"+result[i].name+"' data-no='_"+result[i].code+"'>";
                                $(".search_worker_info").append("<tr><td>"+result[i].name+"</td><td>"+result[i].category+"</td><td>"+result[i].telephone+"</td><td>"+opBtn+"</td></tr>");
                            }
                        } else {
                            $(".search_worker_info").append("<tr><td colspan='4'>暂无数据</td></tr>");
                        }
                    }
                });
            }
        });
        $("body").delegate(".use_sp_worker","click",function() {
            var name=$(this).data("name");
            var no=$(this).data("no");
            no=no.substring(1,no.length);
            var td1=name+"<input type='hidden' name='memberNos' value='"+no+"'>";
            var td2="组员<input type='hidden' name='isLeaders' value='2'><input type='hidden' name='isConfirms' value='0'>";
            var td3="<input type='text' name='moneys' onkeyup='clearNoNum(this,true,false);' onchange='formatFloat(this);'>";
            var td4="<input type='hidden' name='depositMoneys' value='0'>";
            var td5="<input type='text' name='rNotes' class='taskMatch_input input_note' placeholder='分配金额小于10%,或使用组外人员，必须填写备注'>";
            $.closePopup();
            $(".taskMatch table tbody").append("<tr data-wtype='outerw'><td>"+td1+"</td><td>"+td2+"</td><td>"+td3+"</td><td>"+td4+"</td><td>"+td5+"</td></tr>");
        });
        $(".buttom_1").click(function() {
            var flag=true;
            var moneyFlag=true;
            var gradeParam=[];//存放评分分数
            var settleMoney=$("input[name='settleMoney']").val();//结算金额
            var excipientMoney=$("input[name='excipientMoney']").val();//库房提货金额
            var spMoney=0;//填写的工人薪资之和
            var moneyChangeNos=[];//保存在修改验收单时，修改了薪资的工人的员工编号
            var delayUnitPrice=parseFloat($("input[name='delayUnitPrice']").val());
            var inspectDate=$("input[name='inspectDate']").val().trim();
            var isQuality=$(":radio[name='isQuality']:checked").val();
            var isDelay=$(":radio[name='isDelay']:checked").val();
            var isPunish=$(":radio[name='isPunish']:checked").val();
            var isComplain=$(":radio[name='isComplain']:checked").val();
            var isSupplyNeeds=$(":radio[name='isSupplyNeeds']:checked").val();
            
            if(inspectDate==null||inspectDate=="") {
                $.alert("请选择验收日期！","消息");
                flag=false;
                return false;
            }
            if(isQuality==null||isQuality=="") {
                $.alert("请选择验收质量！","消息");
                flag=false;
                return false;
            }
            var qualityScore=$("#qualityGrade").raty("score");
            if(qualityScore==null||parseFloat(qualityScore)<0) {
                $.alert("请为质量打分！", "消息");
                flag=false;
                return false;
            } else {
                gradeParam.push("1_"+qualityScore);
            }
            if(isDelay==null||isDelay=="") {
                $.alert("请选择工期类型！","消息");
                flag=false;
                return false;
            }
            if(isDelay!=null&&isDelay!=""&&isDelay=="2") {
                var delayDay=$("input[name='delayDay']").val();
                if(delayDay==null||delayDay==""||parseFloat(delayDay)<=0) {
                    $.alert("请填入合法延期天数！","消息");
                    flag=false;
                    return false;
                }
            }
            var delayScore=$("#delayGrade").raty("score");
            if(delayScore==null||parseFloat(delayScore)<0) {
                $.alert("请为工期打分！", "消息");
                flag=false;
                return false;
            } else {
                gradeParam.push("2_"+delayScore);
            }
            if(isComplain==null||isComplain=="") {
                $.alert("请选择服务类型！", "消息");
                flag=false;
                return false;
            }
            var complainScore=$("#complainGrade").raty("score");
            if(complainScore==null||parseFloat(complainScore)<0) {
                $.alert("请为服务打分！", "消息");
                flag=false;
                return false;
            } else {
                gradeParam.push("3_"+complainScore);
            }
            if(isPunish==null||isPunish=="") {
                $.alert("请选择处罚类型！","消息");
                flag=false;
                return false;
            }
            if(isPunish!=null&&isPunish!=""&&isPunish=="2") {
                var punishMoney=$("input[name='punishMoney']").val();
                if(punishMoney==null||punishMoney==""||parseFloat(punishMoney)<=0) {
                    $.alert("请填入合法处罚金额！","消息");
                    flag=false;
                    return false;
                }
                var punishNote=$("input[name='punishNote']").val();
                if(punishNote==null||punishNote=="") {
                    $.alert("请填入处罚理由！","消息");
                    flag=false;
                    return false;
                }
            }
            
			//补助校验
			if(isSupplyNeeds==null||isSupplyNeeds=="") {
				$.alert("请选择补助类型！", "消息");
				flag=false;
				return false;
			}
			if(isSupplyNeeds!=null&&isSupplyNeeds!=""&&isSupplyNeeds=="2") {
				var supplyNeedsMoney=$("input[name='supplyNeedsMoney']").val();
				if(supplyNeedsMoney==null||supplyNeedsMoney==""||parseFloat(supplyNeedsMoney)<=0) {
					$.alert("请填入合法处罚金额！", "消息");
					flag=false;
					return false;
				}
				var supplyNeedsNote=$("input[name='supplyNeedsNote']").val();
				if(supplyNeedsNote==null||supplyNeedsNote=="") {
					$.alert("请填入处罚理由！", "消息");
					flag=false;
					return false;
				}
			}
            
            $(".taskSingle table tbody tr .procedureTR").each(function() {
                var iActualNum=$(this).find("input[name='actualNums']").eq(0).val().trim();
                if(iActualNum==null||iActualNum=="") {
                    $.alert("请填写施工的实际工作量！","消息");
                    flag=false;
                    return false;
                }
            });
            if(parseFloat(excipientMoney)<=0) {
                $.confirm("库房提货金额为0，是否确认？",function() {
                    if(parseFloat(settleMoney)<=0) {
                        $.alert("结算金额不合法！", "消息");
                        flag=false;
                        return false;
                    }
                    var dispatType="${orderPkgInspectVo.dispatType}";
                    if(dispatType=="1") {
                        $(".taskMatch table[id=workerTable] tbody tr").each(function(i) {
                            var iMoney=$(this).find("input[name='moneys']").eq(0).val().trim();
                            var oMoney=$(this).find("input[name='moneys']").eq(0).data("omoney");
                            var lSettleMoney=formatNum(parseFloat($("input[name='settleMoney']").val().trim())*0.1);
                            var wType=$(this).data("wtype");
                            if(iMoney==null||iMoney=="") {
                                $.alert("请填写工人薪酬分配金额！","消息");
                                flag=false;
                                moneyFlag=false;
                                return false;
                            }
                            if(wType=="innerw"&&parseFloat(iMoney)<lSettleMoney) {
                                var note=$(this).find("input[name='rNotes']").eq(0).val().trim();
                                if(note==null||note=="") {
                                    $.alert("分配金额小于结算金额的10%，请填写备注！","消息");
                                    flag=false;
                                    moneyFlag=false;
                                    return false;
                                }
                            }
                            if(wType=="outerw") {
                                var note=$(this).find("input[name='rNotes']").eq(0).val().trim();
                                if(note==null||note=="") {
                                    $.alert("使用了组外人员，请为组外人员列填写备注！","消息");
                                    flag=false;
                                    moneyFlag=false;
                                    return false;
                                }
                            }
                            spMoney=formatNum(parseFloat(spMoney)+parseFloat(iMoney));
                            if(parseFloat(iMoney)!=parseFloat(oMoney)||wType=="outerw") {
                                var workerNo=$(this).find("input[name='memberNos']").eq(0).val().trim();
                                moneyChangeNos.push(workerNo);
                            }
                        });
                        if(moneyFlag) {
                            if(parseFloat(spMoney)!=parseFloat(settleMoney)) {
                                $.alert("工人薪酬总和必须等于结算金额！","消息");
                                flag=false;
                                return false;
                            }
                        }
                    }
                    if(flag) {
                        $.showLoading("数据提交中，请稍候");
                        $("input[name='gradeParam']").val(gradeParam);
                        $("input[name='moneyChangeNos']").val(moneyChangeNos);
                        $(".buttom_1").attr("disabled",true);
                        setTimeout(function() {
                            $.hideLoading();
                        },3000);
                        $("#inspectForm").submit();
                    }
                },function() {
                    flag=false;
                    return false;
                });
            } else {
                if(parseFloat(settleMoney)<=0) {
                    $.alert("结算金额不合法！", "消息");
                    flag=false;
                    return false;
                }
                var dispatType="${orderPkgInspectVo.dispatType}";
                if(dispatType=="1") {
                    $(".taskMatch table[id=workerTable] tbody tr").each(function(i) {
                        var iMoney=$(this).find("input[name='moneys']").eq(0).val().trim();
                        var oMoney=$(this).find("input[name='moneys']").eq(0).data("omoney");
                        var lSettleMoney=formatNum(parseFloat($("input[name='settleMoney']").val().trim())*0.1);
                        var wType=$(this).data("wtype");
                        if(iMoney==null||iMoney=="") {
                            $.alert("请填写工人薪酬分配金额！","消息");
                            flag=false;
                            moneyFlag=false;
                            return false;
                        }
                        if(wType=="innerw"&&parseFloat(iMoney)<lSettleMoney) {
                            var note=$(this).find("input[name='rNotes']").eq(0).val().trim();
                            if(note==null||note=="") {
                                $.alert("分配金额小于结算金额的10%，请填写备注！","消息");
                                flag=false;
                                moneyFlag=false;
                                return false;
                            }
                        }
                        if(wType=="innerw"&&parseFloat(iMoney)<lSettleMoney) {
                            var note=$(this).find("input[name='rNotes']").eq(0).val().trim();
                            if(note==null||note=="") {
                                $.alert("分配金额小于结算金额的10%，请填写备注！","消息");
                                flag=false;
                                moneyFlag=false;
                                return false;
                            }
                        }
                        if(wType=="outerw") {
                            var note=$(this).find("input[name='rNotes']").eq(0).val().trim();
                            if(note==null||note=="") {
                                $.alert("使用了组外人员，请为组外人员列填写备注！","消息");
                                flag=false;
                                moneyFlag=false;
                                return false;
                            }
                        }
                        spMoney=formatNum(parseFloat(spMoney)+parseFloat(iMoney));
                        if(parseFloat(iMoney)!=parseFloat(oMoney)||wType=="outerw") {
                            var workerNo=$(this).find("input[name='memberNos']").eq(0).val().trim();
                            moneyChangeNos.push(workerNo);
                        }
                    });
                    if(moneyFlag) {
                        if(parseFloat(spMoney)!=parseFloat(settleMoney)) {
                            $.alert("工人薪酬总和必须等于结算金额！","消息");
                            flag=false;
                            return false;
                        }
                    }
                }
                if(flag) {
                    $.showLoading("数据提交中，请稍候");
                    $("input[name='gradeParam']").val(gradeParam);
                    $("input[name='moneyChangeNos']").val(moneyChangeNos);
                    $(".buttom_1").attr("disabled",true);
                    setTimeout(function() {
                        $.hideLoading();
                    },3000);
                    $("#inspectForm").submit();
                }
            }
        });
    });
</script>
</body>