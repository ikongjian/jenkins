<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="en" uri="/enumTag"%>
<title>木工工程</title>

<%@ include file="/WEB-INF/jsp/layout/cssjs.jsp"%>

<!--侧面导航-->
<%@ include file="/WEB-INF/jsp/layout/menu.jsp"%>
<!--侧面导航结束-->

<div class="content">
	<div class="title widht_84">
		<h2 class="color_fff">施工工艺-木工工程</h2>
		<i><img class="width_100" src="/assets-new/img/nav_0.png"></i>
        <%--<a href="#"><img class="width_100" src="/assets-new/img/esc.png"></a>--%>
	</div>
	<hr class="content_hr">
	<table class="table_list table_list_bulid" border="0" cellspacing="0" cellpadding="0">
            <tbody>
                <tr class="table_listTr">
                    <th scope="col" width="15%">分类</th>
                    <th scope="col" width="66%">施工工艺规范与验收规范</th>
                    <th scope="col" width="19%">考核</th>
                </tr>
                <tr>
                    <td class="borderRdddee3 textC" rowspan="4">轻钢龙骨石吊顶、隔墙</td>
                    <td class="borderRdddee3">1. 施工上游：水电隐蔽工程完工；</td>
                    <td rowspan="4" class="textR"><i class="icon_violate">违</i>返工重做<br>并罚<strong>200/次</strong></td>
                </tr>
                <tr>
                    <td class="borderRdddee3">2. 轻钢龙骨吊顶主龙骨间距≦1000mm，副龙骨间距≤400mm，吊筋间距≤1200mm，除特殊造型不得用木龙骨及钢木混合（拍照）</td>
                </tr>
                <tr>
                    <td class="borderRdddee3">3. 天地龙骨和边龙骨必须膨胀螺丝固定，安装踢脚线位置木工板加固，防火防腐处理；</td>
                </tr>
                <tr>
                    <td class="borderRdddee3">4. 平整度≤3mm，垂直度≤3mm，方正度≤3mm；</td>
                </tr>
                <tr>
                    <td class="borderRdddee3 textC" rowspan="4">石膏板安装</td>
                    <td class="borderRdddee3">1. 石膏板自攻钉固定间距≦25mm，距板边≦15mm,沉入板面0.5mm，不得划破纸面，涂防锈漆；（拍照）</td>
                    <td rowspan="4" class="textR"><i class="icon_violate">违</i>返工重做<br>并罚<strong>200/次</strong></td>
                </tr>
                <tr>
                    <td class="borderRdddee3">2. 拐角处石膏板采用L或T形套割；（拍照）</td>
                </tr>
                <tr>
                    <td class="borderRdddee3">3. 板与板之间留5-8mm缝隙，切成V字口，补嵌缝石膏，贴专用绷带（拍照）</td>
                </tr>
                <tr>
                    <td class="borderRdddee3">4. 平整度≤3mm，垂直度≤3mm，方正度≤3mm，板与板之间高低差≦1mm；</td>
                </tr>
                <tr>
                    <td class="borderRdddee3 textC" rowspan="4">石膏线安装</td>
                    <td class="borderRdddee3">1. 石膏线安装前必须找角找平，不得先装石膏线后找平；</td>
                    <td rowspan="4" class="textR"></td>
                </tr>
                <tr>
                    <td class="borderRdddee3">2. 快粘粉粘贴，直边满粘，中间点粘，间距≦20mm；（拍照）</td>
                </tr>
                <tr>
                    <td class="borderRdddee3">3. 石膏线接头处加钉固定在墙面，刷防锈漆，修补找平；（拍照）</td>
                </tr>
                <tr>
                    <td class="borderRdddee3">4. 安装后进行平整度修复，1米处理目测看不到明显接缝、瑕疵；</td>
                </tr>
                <tr>
                    <td class="borderRdddee3 textC" rowspan="3">门洞修正</td>
                    <td class="borderRdddee3">1. 门页尺寸为2000*800的，门洞校正尺寸为2070*890；</td>
                    <td class="textR"><i class="icon_violate">违</i>返工重做</td>
                </tr>
                <tr>
                    <td class="borderRdddee3">2. 校正≤50mm的，用多层石膏板加固校正，＞50mm的，轻钢龙骨结构，石膏板饰面，必须做防开裂处理，无松动。方正度≤5mm，垂直度≤5mm；</td>
                    <td class="textR"><i class="icon_violate">违</i>返工重做</td>
                </tr>
                <tr>
                    <td class="borderRdddee3">3. 泥瓦工校正的，必须搓毛原基层，充分湿润后抹灰，并挂钢丝网，搭接长度≥100mm；</td>
                    <td class="textR"><i class="icon_violate">违</i>返工重做</td>
                </tr>
                <tr>
                    <td class="borderRdddee3 textC" rowspan="2">窗帘盒制作</td>
                    <td class="borderRdddee3">1. U形轻钢龙骨，顶面和侧面膨胀螺丝固定，固定间距≦600MM，上下龙骨之间加固，加固间距≦1000mm，不得使用大芯板衬底；（封板前拍照）</td>
                    <td class="textR"><i class="icon_violate">违</i>返工重做<br>并罚<strong>300/次</strong></td>
                </tr>
                <tr>
                    <td class="borderRdddee3">2. 两面封石膏板，边角处防裂处理；</td>
                    <td class="textR"><i class="icon_violate">违</i>返工重做</td>
                </tr>
                <tr>
                    <td class="borderRdddee3 textC" rowspan="3">铝扣板吊顶</td>
                    <td class="borderRdddee3">1. 上游环节：墙面砖铺贴完毕，并验收；</td>
                    <td class="textR"><i class="icon_violate">违</i>返工重做</td>
                </tr>
                <tr>
                    <td class="borderRdddee3">2. 固定收口条必须牢固，顺直，无松动。收口条与墙面接缝处须玻璃胶收口；</td>
                    <td class="textR"><i class="icon_violate">违</i>返工重做</td>
                </tr>
                <tr>
                    <td class="borderRdddee3">3. 铝扣板吊顶平整度≤3mm；</td>
                    <td class="textR"><i class="icon_violate">违</i>返工重做</td>
                </tr>
            </tbody>
        </table>
</div>
<script type="text/javascript">
	$(function() {
		//隐藏返回按钮
		$(".title a").hide()
	})
</script>