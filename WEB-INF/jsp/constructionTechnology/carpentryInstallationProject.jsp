<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="en" uri="/enumTag"%>

    <title>木作安装</title>
    <%@ include file="/WEB-INF/jsp/layout/cssjs.jsp"%>
    <!--侧面导航-->
    <%@ include file="/WEB-INF/jsp/layout/menu.jsp"%>
    <!--侧面导航结束-->
    
    <!--右侧内容框架-->
    <div class="content">
        <!--木作安装-->
        <div class="title">
            <h2  class="color_fff">施工工艺-木作安装</h2>
            <i><img class="width_100" src="/assets-new/img/nav_0.png"></i>
            <%--<a href="#"><img class="width_100" src="/assets-new/img/esc.png"></a>--%>
        </div>
        <hr class="content_hr">
        <div class="content_nav content_nav_bulid">
            <ul>
                <li class="content_navover">木地板安装</li>
                <li>橱柜安装</li>
                <li>内门安装</li>
                <li>浴室柜安装</li>
            </ul>
        </div>
        <table class="table_list table_list_bulid" border="0" cellspacing="0" cellpadding="0">
            <thead>
                <tr class="table_listTr">
                    <th scope="col" width="15%">分类</th>
                    <th scope="col" width="66%">施工工艺规范与验收规范</th>
                    <th scope="col" width="19%">考核</th>
                </tr>
            </thead>
            <!-- 木地板安装 -->
            <tbody>
                <tr>
                    <td class="borderRdddee3 textC" rowspan="5">木地板安装</td>
                    <td class="borderRdddee3">1. 施工上游：完成基础全部施工，包含基础类安装项目，包含墙漆施工完毕，无任何作业；</td>
                    <td class="textR"><i class="icon_violate">违</i>返工重做</td>
                </tr>
                <tr>
                    <td class="borderRdddee3">2. 安装木地板之前，必须先检查基层地面平整度，内门下方高度，基层含水比例，低于14%方可铺贴；基层含水率检查办法：用500mm见方塑料布四周密封12小时，检查是否有水珠，无水珠可铺地板。（拍照）</td>
                    <td class="textR"><i class="icon_violate">违</i>返工重做</td>
                </tr>
                <tr>
                    <td class="borderRdddee3">3. 安装前对地面的平整度进行检查，平整度≦3mm，否则必须处理，达到合格要求，地面平整度超过误差不得铺装地板；</td>
                    <td class="textR"><i class="icon_violate">违</i>返工重做</td>
                </tr>
                <tr>
                    <td class="borderRdddee3">4. 铺贴防潮膜，沿墙上返与踢脚线齐平，防潮膜的接口必须用透明胶链接，铺贴中，严禁将防潮膜弄破；（站在每间房间门口拍照）</td>
                    <td class="textR"><i class="icon_violate">违</i>罚<strong>100元／次</strong></td>
                </tr>
                <tr>
                    <td class="borderRdddee3">5. 铺贴木地板须根据设计要求，靠墙周边必须留伸缩缝；</td>
                    <td class="textR"><i class="icon_violate">违</i>罚<strong>100元／次</strong></td>
                </tr>
                <tr>
                    <td class="borderRdddee3 textC" rowspan="3">木质踢脚线安装</td>
                    <td class="borderRdddee3">1. 施工上游：完成木地板安装</td>
                    <td class="textR"><i class="icon_violate">违</i>返工重做</td>
                </tr>
                <tr>
                    <td class="borderRdddee3">2. 安装实木踢脚线必须先电锤打眼，订木楔，木楔距离≤500mm；阴阳角接口采用45°拼角，，直接采用斜口搭接，严禁直接；</td>
                    <td class="textR"><i class="icon_violate">违</i>返工重做</td>
                </tr>
                <tr>
                    <td class="borderRdddee3">3. 安装完毕，踢脚线与墙面必须进行打胶收口处理；</td>
                    <td class="textR"><i class="icon_violate">违</i>返工重做</td>
                </tr>
            </tbody>
            <!-- 橱柜安装 -->
            <tbody style="display: none;">
                <tr>
                    <td class="borderRdddee3 textC" rowspan="3">地柜安装收口条安装</td>
                    <td class="borderRdddee3">1. 橱柜安装高度根据设计要求；</td>
                    <td class="textR"><i class="icon_violate">违</i>返工重做</td>
                </tr>
                <tr>
                    <td class="borderRdddee3">2. 地柜柜体必须连接牢固，不松动。平整度≤1mm；</td>
                    <td class="textR"><i class="icon_violate">违</i>返工重做</td>
                </tr>
                <tr>
                    <td class="borderRdddee3">3. 柜体门页安装缝隙2mm-3mm，开启无异响，使用灵活，无擦碰；收口条安装必须牢固，严实，不松动；</td>
                    <td class="textR"><i class="icon_violate">违</i>返工重做</td>
                </tr>
                <tr>
                    <td class="borderRdddee3 textC" rowspan="5">台面安装</td>
                    <td class="borderRdddee3">1. 施工上游：地柜安装完毕，吊柜安装完毕</td>
                    <td class="textR"><i class="icon_violate">违</i>返工重做</td>
                </tr>
                <tr>
                    <td class="borderRdddee3">2. 台面平整度≤1mm。接缝打磨处理，1m远目测无明显缝隙痕迹；</td>
                    <td class="textR"><i class="icon_violate">违</i>返工重做</td>
                </tr>
                <tr>
                    <td class="borderRdddee3">3. 台面与地柜结合处用专用胶连接，安装后牢固，不松动，无异响；</td>
                    <td class="textR"><i class="icon_violate">违</i>返工重做</td>
                </tr>
                <tr>
                    <td class="borderRdddee3">4. 台面周边与墙体接缝处顺直，缝隙均匀。周边采用专用防霉胶收口处理，要求顺直，均匀；</td>
                    <td class="textR"><i class="icon_violate">违</i>返工重做</td>
                </tr>
                <tr>
                    <td class="borderRdddee3">5. 台面与水槽结合处缝隙均匀，用防霉胶处理，要求顺直，流畅，均匀；</td>
                    <td class="textR"><i class="icon_violate">违</i>返工重做</td>
                </tr>
                <tr>
                    <td class="borderRdddee3 textC" rowspan="4">吊柜安装</td>
                    <td class="borderRdddee3">1. 施工上游：厨房铝扣板吊顶完毕，灯具，开关、插座安装完毕；</td>
                    <td class="textR"><i class="icon_violate">违</i>返工重做</td>
                </tr>
                <tr>
                    <td class="borderRdddee3">2. 安装吊柜的位置必须为承重墙，或砖混实墙，空心预制件墙体，轻质砖墙体必须灌浆加固处理，否则，不得安装吊柜；</td>
                    <td class="textR"><i class="icon_violate">违</i>返工重做</td>
                </tr>
                <tr>
                    <td class="borderRdddee3">3. 挂片安装必须牢固，不得松动；</td>
                    <td class="textR" rowspan="2"><i class="icon_violate">违</i>返工重做<br>并罚项<strong>200元/次</strong></td>
                </tr>
                <tr>
                    <td class="borderRdddee3">4. 吊柜安装完毕，必须做承重试验，一般以一个人的体重为标准，不松动，不变形；</td>
                </tr>
                <tr>
                    <td class="borderRdddee3 textC" rowspan="3">门页与五金件安装</td>
                    <td class="borderRdddee3">1. 柜体与门页安装的缝隙为2mm-3mm，周边缝隙一致，开启灵活，无异响，无擦碰；</td>
                    <td class="textR"><i class="icon_violate">违</i>赔偿损失</td>
                </tr>
                <tr>
                    <td class="borderRdddee3" rowspan="2">2. 五金件根据设计要求进行安装，不得错装，五金件安装后必须牢固，无松动，使用流程，无异响，无擦碰，五金件表面无刮花，无污染；</td>
                    <td class="textR"><i class="icon_violate">违</i>罚<strong>100元/次</strong></td>
                </tr>
                <tr>
                    <td class="textR"><i class="icon_violate">违</i>重新安装</td>
                </tr>
                <tr>
                    <td class="borderRdddee3 textC" rowspan="6">油烟机、灶台、消毒柜、水槽</td>
                    <td class="borderRdddee3">1. 安装抽烟机的同时，必须安装烟管，烟管安装牢固，顺直。</td>
                    <td class="textR"><i class="icon_violate">违</i>罚<strong>100元/次</strong></td>
                </tr>
                <tr>
                    <td class="borderRdddee3">2. 做使用试验，插上电源，烟管不得有异响，回风，漏风等现象；</td>
                    <td class="textR" rowspan="5"><i class="icon_violate">违</i>罚<strong>100元/次</strong></td>
                </tr>
                <tr>
                    <td class="borderRdddee3">3. 灶台安装要接通天然气，做使用试验；</td>
                </tr>
                <tr>
                    <td class="borderRdddee3">4. 灶台与烟机中心对齐，偏差≤20mm，灶台两侧预留≥200mm空间；</td>
                </tr>
                <tr>
                    <td class="borderRdddee3">5. 安装消毒柜要固定，插上电源，做使用试验，各指示灯使用正常，升温速度正常，开启正常；</td>
                </tr>
                <tr>
                    <td class="borderRdddee3">6. 安装台面的负责安装水槽，安装排水管道，安装完毕要进行打胶密封，做使用试验，是否畅通，观察接头是否漏水，堵塞；</td>
                </tr>
            </tbody>
            <!-- 内门安装 -->
            <tbody style="display: none;">
                <tr>
                    <td class="borderRdddee3 textC" rowspan="6">内门安装</td>
                    <td class="borderRdddee3">1. 施工上游：完成一遍底漆一遍面漆，否则，严禁安装；</td>
                    <td class="textR"><i class="icon_violate">违</i>罚<strong>200元</strong></td>
                </tr>
                <tr>
                    <td class="borderRdddee3">2. 安装内门前，检查洞口是否符合标准，如果过宽或过窄，必须校正，以达到安装条件为准；</td>
                    <td class="textR"><i class="icon_violate">违</i>返工重做</td>
                </tr>
                <tr>
                    <td class="borderRdddee3">3. 门框与墙体必须用发泡胶填充饱满，密实，均匀。门框与墙体必须牢固，无松动；</td>
                    <td class="textR"><i class="icon_violate">违</i>返工重做</td>
                </tr>
                <tr>
                    <td class="borderRdddee3">4. 内门合页安装牢固，开启灵活，无松动；</td>
                    <td class="textR"><i class="icon_violate">违</i>返工重做</td>
                </tr>
                <tr>
                    <td class="borderRdddee3">5. 门缝标准为：上口门缝为3mm，下口为5mm-8mm，靠锁门缝为4mm，靠合页边缝为3mm；</td>
                    <td class="textR"><i class="icon_violate">违</i>返工重做</td>
                </tr>
                <tr>
                    <td class="borderRdddee3">6. 锁具安装后做开启试验，开启无响动，可随意停，锁舌与锁孔关闭无阻力，流程。安装门吸牢固，无松动；</td>
                    <td class="textR"><i class="icon_violate">违</i>返工重做</td>
                </tr>
            </tbody>
            <!-- 浴室柜安装 -->
            <tbody style="display: none;">
                <tr>
                    <td class="borderRdddee3 textC" rowspan="2">浴室柜安装</td>
                    <td class="borderRdddee3">1. 施工上游：墙、地面砖铺贴完成</td>
                    <td class="textR"></td>
                </tr>
                <tr>
                    <td class="borderRdddee3">2. 安装牢固，五金件完整，表面无刮花，污染，门页开启灵活，无异响；</td>
                    <td class="textR"><i class="icon_violate">违</i>赔偿损失</td>
                </tr>
                <tr>
                    <td class="borderRdddee3 textC" rowspan="3">镜子安装</td>
                    <td class="borderRdddee3">1. 镜子安装高度符合设计要求，符合客户使用要求；</td>
                    <td class="textR"></td>
                </tr>
                <tr>
                    <td class="borderRdddee3">2. 镜子背面做封闭处理，应安装周正，无倾斜，安装牢固，无松动；</td>
                    <td class="textR"><i class="icon_violate">违</i>赔偿损失</td>
                </tr>
                <tr>
                    <td class="borderRdddee3">3. 安装后进行成品保护</td>
                    <td class="textR"><i class="icon_violate">违</i>赔偿损失</td>
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
            //切换工艺目录
            $(".content_nav li").click(function(){
                $(".content_nav li").eq($(this).index()).addClass("content_navover").siblings().removeClass('content_navover');
                $(".table_list_bulid tbody").fadeOut().eq($(this).index()).fadeIn();
            });
        })
    </script>