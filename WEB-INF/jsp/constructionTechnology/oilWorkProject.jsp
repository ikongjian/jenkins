<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="en" uri="/enumTag"%>

    <title>油工工程</title>
    <%@ include file="/WEB-INF/jsp/layout/cssjs.jsp"%>

    <!--侧面导航-->
       <%@ include file="/WEB-INF/jsp/layout/menu.jsp"%>
    <!--侧面导航结束-->
    
    <!--右侧内容框架-->
    <div class="content">
        <!--油工工程-->
        <div class="title">
            <h2 class="color_fff">施工工艺-油工工程</h2>
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
                    <td class="borderRdddee3 textC" rowspan="3">铲墙皮</td>
                    <td class="borderRdddee3">1. 要求铲到水泥基层，或砖层基层，铲完后装袋运到物业指定位置；</td>
                    <td class="textR" rowspan="3"><i class="icon_violate">违</i>返工重做</td>
                </tr>
                <tr>
                    <td class="borderRdddee3">2. 检查墙体裂缝，所有裂缝剔深度>10mm,宽度>15mm的V形槽，用嵌缝石膏嵌缝，贴网格布；（拍照）</td>
                </tr>
                <tr>
                    <td class="borderRdddee3">3. 施工洞铺布，搭接长度≥200mm; (拍照）</td>
                </tr>
                <tr>
                    <td class="borderRdddee3 textC" rowspan="2">石膏找平与墙固</td>
                    <td class="borderRdddee3">1. 找平前涂刷墙固，待干后采用粉刷石膏腻子找平，每次找平厚度≤5mm，超过25mm加挂一层网格布；（拍照）</td>
                    <td class="textR" rowspan="2"><i class="icon_violate">违</i>返工重做</td>
                </tr>
                <tr>
                    <td class="borderRdddee3">2. 找平后的墙面平整度≤3mm，阴阳角方正度≤3mm；</td>
                </tr>
                <tr>
                    <td class="borderRdddee3 textC" rowspan="4">批刮腻子、打磨</td>
                    <td class="borderRdddee3">1. 批腻不得少于两遍，打磨平整</td>
                    <td class="textR" rowspan="2"><i class="icon_violate">违</i>罚<strong>200元／次</strong></td>
                </tr>
                <tr>
                    <td class="borderRdddee3">2. 轻质砖墙必须全墙铺布（拍照）</td>
                </tr>
                <tr>
                    <td class="borderRdddee3">3. 批腻干燥后打磨，打磨用的砂纸为240—360目。打磨后1M处观察表面无砂痕，无毛孔，无气泡；</td>
                    <td class="textR"><i class="icon_violate">违</i>罚<strong>200元／次</strong></td>
                </tr>
                <tr>
                    <td class="borderRdddee3">4. 打磨后的平整度≤3mm，阴阳角方正度≤2mm；否则，严禁涂刷墙漆；</td>
                    <td class="textR"><i class="icon_violate">违</i>返工重做</td>
                </tr>                
                <tr>
                    <td class="borderRdddee3 textC" rowspan="3">涂刷墙漆一底两面</td>
                    <td class="borderRdddee3">1. 涂刷墙漆为一底两面，墙漆兑水参照产品说明标准，兑水不得超过说明标准。</td>
                    <td class="textR" rowspan="2"><i class="icon_violate">违</i>罚<strong>200元／次</strong></td>
                </tr>
                <tr>
                    <td class="borderRdddee3">2. 涂刷完一底一面后，进入到安装环节，待内门、橱柜安装完后，涂刷第二遍面漆，涂刷前，必须对安装弄脏，碰坏部位进行修补；</td>
                </tr>
                <tr>
                    <td class="borderRdddee3">3. 两种不同颜色的涂刷分色均匀，顺直，细致，严禁混色；</td>
                    <td class="textR"><i class="icon_violate">违</i>返工重做</td>
                </tr>
                <tr>
                    <td class="borderRdddee3 textC" rowspan="3">壁纸铺贴</td>
                    <td class="borderRdddee3">1. 壁纸铺贴前，必须检查墙体的平整度，阴阳角顺直度，打磨标准，方可涂刷基膜；</td>
                    <td class="textR"><i class="icon_violate">违</i>返工重做</td>
                </tr>
                <tr>
                    <td class="borderRdddee3">2. 涂刷基膜必须均匀，无凹凸感，待干后方可铺贴壁纸；</td>
                    <td class="textR"><i class="icon_violate">违</i>返工重做</td>
                </tr>
                <tr>
                    <td class="borderRdddee3">3. 壁纸铺贴到阴阳角，严禁在墙柱转角阳角接口，须将阳角的壁纸进行整张铺贴转弯；</td>
                    <td class="textR"><i class="icon_violate">违</i>返工重做<br>并罚项<strong>500元/次</strong></td>
                </tr>
            </tbody>
        </table>
    </div>
    <!--右侧内容框架结束-->
    <!--本页JS-->
    <script>
        $(function () {
            //隐藏返回按钮
            $(".title a").hide();
        });
    </script>