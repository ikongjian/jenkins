<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="en" uri="/enumTag"%>

    <title>泥瓦工程</title>
    <%@ include file="/WEB-INF/jsp/layout/cssjs.jsp"%>

    <!--侧面导航-->
      <%@ include file="/WEB-INF/jsp/layout/menu.jsp"%>
    <!--侧面导航结束-->
    
    <!--右侧内容框架-->
    <div class="content">
        <!--泥瓦工程-->
        <div class="title">
            <h2 class="color_fff">施工工艺-泥瓦工程</h2>
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
                    <td class="borderRdddee3 textC" rowspan="5">新老墙砌筑搭接与抹灰挂网</td>
                    <td class="borderRdddee3">1. 新墙结合部位，老墙、柱、梁的原抹灰层必须铲除见原底结构；</td>
                    <td class="textR"><i class="icon_violate">违</i>返工重做</td>
                </tr>
                <tr>
                    <td class="borderRdddee3">2. 新老墙砌筑必须采用直径6mm拉结筋，拉结筋长度不得小于500mm，加胀栓固定并回弯处理，间距不大于500mm；（拍照）</td>
                    <td class="textR"><i class="icon_violate">违</i>返工重做</td>
                </tr>
                <tr>
                    <td class="borderRdddee3">3. 抹灰前，新老墙结合处必须挂钢丝网，搭接处不得小于100mm；（拍照）</td>
                    <td class="textR"><i class="icon_violate">违</i>返工重做</td>
                </tr>
                <tr>
                    <td class="borderRdddee3">4. 新墙砌筑采用蜈蚣角砌筑法，顶部顶实；（拍照）</td>
                    <td class="textR"><i class="icon_violate">违</i>返工重做</td>
                </tr>
                <tr>
                    <td class="borderRdddee3">5. 垂直度、平整度≤3mm，方正度≤3mm；</td>
                    <td class="textR"><i class="icon_violate">违</i>罚<strong>100元／次</strong></td>
                </tr>
                <tr>
                    <td class="borderRdddee3 textC" rowspan="2">门洞过梁</td>
                    <td class="borderRdddee3">1. 洞口≥600mm，必须浇筑过梁或采购成品过梁安装，严禁使用木量；（拍照）</td>
                    <td class="textR"><i class="icon_violate">违</i>罚<strong>100元／次</strong></td>
                </tr>
                <tr>
                    <td class="borderRdddee3">2. 浇筑过梁的厚度必须≥60mm，放置φ6mm以上钢筋，两侧搭接≥100mm；</td>
                    <td class="textR"><i class="icon_violate">违</i>返工重做</td>
                </tr>
                <tr>
                    <td class="borderRdddee3 textC" rowspan="2">包排水管道</td>
                    <td class="borderRdddee3">1. 可采用轻质砖砌筑，做降噪处理，降噪处理采用吸音棉，砌筑采用一顺一丁，相互咬合。抹灰前，与墙体结合部位必须挂钢丝网。否则，出现开裂，泥瓦工承担售后；</td>
                    <td class="textR"><i class="icon_violate">违</i>罚<strong>100元／次</strong></td>
                </tr>
                <tr>
                    <td class="borderRdddee3">2. 完成后垂直度、正平度、方正度≤3mm；</td>
                    <td class="textR"><i class="icon_violate">违</i>返工重做</td>
                </tr>                
                <tr>
                    <td class="borderRdddee3 textC" rowspan="3">水泥砂浆地面找平</td>
                    <td class="borderRdddee3">1. 施工上游：水电隐蔽工程完工，地面清理干净，无灰尘杂物；</td>
                    <td class="textR"><i class="icon_violate">违</i>罚<strong>100元／次</strong></td>
                </tr>
                <tr>
                    <td class="borderRdddee3">2. 水泥砂浆配比为1:3.5；</td>
                    <td class="textR"><i class="icon_violate">违</i>返工重做</td>
                </tr>                
                <tr>
                    <td class="borderRdddee3">2. 2米检测尺验收平整度≤3mm，表面光滑，无起砂，烧坏；</td>
                    <td class="textR"><i class="icon_violate">违</i>清理干净</td>
                </tr>
                <tr>
                    <td class="borderRdddee3 textC" rowspan="4">石膏基地面找平</td>
                    <td class="borderRdddee3">1. 施工上游：水电隐蔽工程完工，地面清理干净，无灰尘杂物；</td>
                    <td class="textR"><i class="icon_violate">违</i>罚<strong>100元／次</strong></td>
                </tr>
                <tr>
                    <td class="borderRdddee3">2. 施工前地面均匀滚涂地固；（拍照）</td>
                    <td class="textR"><i class="icon_violate">违</i>超标自贴</td>
                </tr>                
                <tr>
                    <td class="borderRdddee3">2. 石膏基自流平地面找平，按产品说明书配比要求；</td>
                    <td class="textR"><i class="icon_violate">违</i>返工重做</td>
                </tr>
                <tr>
                    <td class="borderRdddee3">2. 完成后2米靠尺检测平整度≤2mm；</td>
                    <td class="textR"><i class="icon_violate">违</i>返工重做</td>
                </tr>
                <tr>
                    <td class="borderRdddee3 textC" rowspan="3">地面砖铺贴</td>
                    <td class="borderRdddee3">1. 铺贴前，必须先放样预排，优先考虑进门整砖排序，过道整砖排序，</td>
                    <td class="textR"><i class="icon_violate">违</i>返工重做</td>
                </tr>                
                <tr>
                    <td class="borderRdddee3">2. 过门石高出地面≥8mm；</td>
                    <td class="textR"><i class="icon_violate">违</i>返工重做</td>
                </tr>
                <tr>
                    <td class="borderRdddee3">3. 单个自然间2米靠尺检测平整度≤2mm，无空鼓率，瓷砖与瓷砖高低差≤0.5mm，填缝顺直均匀，饱满，无色差；</td>
                    <td class="textR"><i class="icon_violate">违</i>返工重做</td>
                </tr>
                <tr>
                    <td class="borderRdddee3 textC">地面砖铺贴</td>
                    <td class="borderRdddee3">1. 地漏安装必须在最低处，瓷砖整砖开八字，须做跑水试验，无积水为合格；</td>
                    <td class="textR"><i class="icon_violate">违</i>返工重做</td>
                </tr>
                <tr>
                    <td class="borderRdddee3 textC" rowspan="8">墙面砖铺贴</td>
                    <td class="borderRdddee3">1. 铺贴前，必须先放样预排，优先考虑窗口高度，整砖与非整砖排版顺序；</td>
                    <td class="textR"><i class="icon_violate">违</i>返工重做</td>
                </tr>
                <tr>
                    <td class="borderRdddee3">2. 墙面砖铺贴必须墙砖压地砖，侧面压正面；</td>
                    <td class="textR"><i class="icon_violate">违</i>返工重做</td>
                </tr>
                <tr>
                    <td class="borderRdddee3">3. 所有出水口必须与墙面平，不得低于墙面，标准为0mm—2mm；泥瓦工铺贴时如发现出水口陷于墙面，则将出水口往外调整，否则，视为瓦工责任；</td>
                    <td class="textR"><i class="icon_violate">违</i>返工重做</td>
                </tr>
                <tr>
                    <td class="borderRdddee3">4. 开孔必须用开孔器；</td>
                    <td class="textR"><i class="icon_violate">违</i>返工重做</td>
                </tr>
                <tr>
                    <td class="borderRdddee3">5. 垂直度≤2mm，平整度≤2mm，阴阳角方正度≤2mm，空鼓率≤5%；</td>
                    <td class="textR"><i class="icon_violate">违</i>罚<strong>200元／次</strong></td>
                </tr>
                <tr>
                    <td class="borderRdddee3">6. 阳台、外墙有腻子底层，必须先铲除，然后水泥搓毛，方可铺贴；</td>
                    <td class="textR"><i class="icon_violate">违</i>罚<strong>200元／次</strong></td>
                </tr>
                <tr>
                    <td class="borderRdddee3">7. 填缝顺直均匀，饱满，无色差；</td>
                    <td class="textR"><i class="icon_violate">违</i>返工重做</td>
                </tr>                
                <tr>
                    <td class="borderRdddee3">8. 地砖与墙砖边长一致情况下，至少有一面墙对缝；</td>
                    <td class="textR"><i class="icon_violate">违</i>罚<strong>200元／次</strong></td>
                </tr>
                <tr>
                    <td class="borderRdddee3 textC" rowspan="3">踢脚线铺贴</td>
                    <td class="borderRdddee3">1. 施工上游：地面砖铺贴完成；</td>
                    <td class="textR"><i class="icon_violate">违</i>返工重做</td>
                </tr>
                <tr>
                    <td class="borderRdddee3">2. 原墙面有抹灰或腻子，必须铲除腻子层，拉毛处理，方可贴砖；（拍照）</td>
                    <td class="textR"><i class="icon_violate">违</i>返工重做</td>
                </tr>
                <tr>
                    <td class="borderRdddee3">3. 踢脚线上口顺直，高低差≤2mm，瓷砖与瓷砖≤0.5mm，拼角无崩边，无空鼓，转角处45度对角处理；</td>
                    <td class="textR"><i class="icon_violate">违</i>返工重做</td>
                </tr>
                <tr>
                    <td class="borderRdddee3 textC" rowspan="7">防水工程</td>
                    <td class="borderRdddee3">1. 施工上游：水电完工验收，线管预埋，排水管砌筑抹灰完成，地面找平完成；</td>
                    <td class="textR"><i class="icon_violate">违</i>返工重做</td>
                </tr>
                <tr>
                    <td class="borderRdddee3">2. 刷防水前必须检查墙面是否空鼓，有空鼓处先处理，保证基层与墙体结合牢固；</td>
                    <td class="textR"><i class="icon_violate">违</i>返工重做</td>
                </tr>
                <tr>
                    <td class="borderRdddee3">3. 淋浴区防水高度为1800mm，其他部位为300mm，地面满涂。</td>
                    <td class="textR"><i class="icon_violate">违</i>返工重做</td>
                </tr>
                <tr>
                    <td class="borderRdddee3">4. 卫生间门口内侧50-100mm做挡水砍台，高度≥20mm（拍照）</td>
                    <td class="textR"><i class="icon_violate">违</i>返工重做</td>
                </tr>
                <tr>
                    <td class="borderRdddee3">5. 下水管根处和阴角做缓坡再做防水；</td>
                    <td class="textR"><i class="icon_violate">违</i>返工重做</td>
                </tr>
                <tr>
                    <td class="borderRdddee3">6. 防水纵横交叉刷3遍最后一遍顺水方向；</td>
                    <td class="textR"><i class="icon_violate">违</i>返工重做</td>
                </tr>
                <tr>
                    <td class="borderRdddee3">7. 防水必做蓄水试验，24小时无渗漏为合格。渗漏测试须邀请客户验收，项目经理拍照留底；</td>
                    <td class="textR"><i class="icon_violate">违</i>返工重做</td>
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
        })
    </script>