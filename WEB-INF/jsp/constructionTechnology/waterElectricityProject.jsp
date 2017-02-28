<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="en" uri="/enumTag"%>

    <title>水电工程</title>
    <%@ include file="/WEB-INF/jsp/layout/cssjs.jsp"%>

    <!--侧面导航-->
       <%@ include file="/WEB-INF/jsp/layout/menu.jsp"%>
    <!--侧面导航结束-->
    
    <!--右侧内容框架-->
    <div class="content">
        <!--水电工程-->
        <div class="title">
            <h2 class="color_fff">施工工艺-水电工程</h2>
            <i><img class="width_100" src="/assets-new/img/nav_0.png"></i>
            <%--<a href="#"><img class="width_100" src="/assets-new/img/esc.png"></a>--%>
        </div>
        <hr class="content_hr">
        <div class="content_nav content_nav_bulid">
            <ul>
                <li class="content_navover">强电工程</li>
                <li>弱电工程</li>
                <li>给水工程</li>
                <li>排水工程</li>
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

            <!-- 强电工程 -->
            <tbody>
                <tr>
                    <td class="borderRdddee3 textC" rowspan="3">交底定位放线</td>
                    <td class="borderRdddee3">1. 普通开关和插座高度图纸有标注的按图施工，图纸无标的按开关距完成地面1200mm—1400mm，插座跟完成地面300mm—350mm，新房以原线盒高度为准；</td>
                    <td class="textR"><i class="icon_violate">违</i>返工重做</td>
                </tr>
                <tr>
                    <td class="borderRdddee3">2. 特殊开关、插座高度须符合设计要求，符合设施、设备使用要求；</td>
                    <td class="textR"><i class="icon_violate">违</i>返工重做</td>
                </tr>
                <tr>
                    <td class="borderRdddee3">3. 安装顶灯位置按设计要求，无设计要求为房间正中心；注：房间顶面拉对角线；</td>
                    <td class="textR"><i class="icon_violate">违</i>返工重做</td>
                </tr>
                <tr>
                    <td class="borderRdddee3 textC" rowspan="5">剔槽</td>
                    <td class="borderRdddee3">1. 剔槽要求横平竖直，严禁斜管槽，严禁剔≥300mm横槽，严禁切断钢筋，按照物业要求施工；</td>
                    <td class="textR"><i class="icon_violate">违</i>罚<strong>100元／次</strong></td>
                </tr>
                <tr>
                    <td class="borderRdddee3">2. 剔槽顺序：槽两侧弹线——沿线切割——剔槽，严禁直接剔槽（拍照）</td>
                    <td class="textR"><i class="icon_violate">违</i>罚<strong>100元／次</strong></td>
                </tr>
                <tr>
                    <td class="borderRdddee3">3. 剔槽深度为：线管φ+12mm，保证敷设厚度，避免开裂；</td>
                    <td class="textR"><i class="icon_violate">违</i>返工重做</td>
                </tr>
                <tr>
                    <td class="borderRdddee3">4. 混凝土墙有钢筋剔槽深度不够的，改穿黄蜡管或护套管；</td>
                    <td class="textR"><i class="icon_violate">违</i>返工重做</td>
                </tr>
                <tr>
                    <td class="borderRdddee3">5. 顶面弧形或S形剔槽，跨度不得超过1500mm。</td>
                    <td class="textR"><i class="icon_violate">违</i>罚<strong>100元／次</strong></td>
                </tr>
                <tr>
                    <td class="borderRdddee3 textC" rowspan="2">底盒预埋</td>
                    <td class="borderRdddee3">1. 开关、插座底盒同一房间内高度一致，水平度误差±3mm；</td>
                    <td class="textR"><i class="icon_violate">违</i>返工重做</td>
                </tr>
                <tr>
                    <td class="borderRdddee3">2. 两个或以上并排底盒，水平度≤0.5mm；</td>
                    <td class="textR"><i class="icon_violate">违</i>罚<strong>100元／次</strong></td>
                </tr>
                <tr>
                    <td class="borderRdddee3 textC" rowspan="4">线管安装与固定</td>
                    <td class="borderRdddee3">1. 线管转弯处≥90度，不得出现死角，线管接头处牢固；</td>
                    <td class="textR"><i class="icon_violate">违</i>返工重做</td>
                </tr>
                <tr>
                    <td class="borderRdddee3">2. 线管采用管卡固定，间距≤1000mm，牢固，无松动；</td>
                    <td class="textR"><i class="icon_violate">违</i>罚<strong>200元／次</strong></td>
                </tr>
                <tr>
                    <td class="borderRdddee3">3. 有防水要求区域（厨房、卫生间、阳台）地面严禁布管布线；</td>
                    <td class="textR"><i class="icon_violate">违</i>返工重做</td>
                </tr>
                <tr>
                    <td class="borderRdddee3">4. 走顶线管必须在水管上方，确保电上水下，严禁水电同槽；</td>
                    <td class="textR"><i class="icon_violate">违</i>返工重做</td>
                </tr>
                <tr>
                    <td class="borderRdddee3 textC" rowspan="2">断点移位</td>
                    <td class="borderRdddee3">1. 断电移位必须采用连接器；</td>
                    <td class="textR" rowspan="2"><i class="icon_violate">违</i>罚<strong>100元／处</strong></td>
                </tr>
                <tr>
                    <td class="borderRdddee3">2. 断电改造原线盒需要封闭的，需加封闭盖，严禁直接水泥砂浆、快干石膏封闭；</td>
                </tr>
                <tr>
                    <td class="borderRdddee3 textC" rowspan="4">线头包扎</td>
                    <td class="borderRdddee3">1. 电线必须分色，相线为红色，零线为蓝色，地线为双色，严禁混装混色；</td>
                    <td class="textR"><i class="icon_violate">违</i>返工重做</td>
                </tr>
                <tr>
                    <td class="borderRdddee3">2. 无论是否通电，所有线头必须包扎，接线端子或绝缘胶带</td>
                    <td class="textR"><i class="icon_violate">违</i>返工重做</td>
                </tr>
                <tr>
                    <td class="borderRdddee3">3. 将底盒内的预留线头卷成弹簧状，藏于底盒，加盖保护板，严禁裸铜线外漏；</td>
                    <td class="textR"><i class="icon_violate">违</i>罚<strong>100元／次</strong></td>
                </tr>
                <tr>
                    <td class="borderRdddee3">4. 就近移位线头链接，必须使用防水接线端子，或绝缘胶+防水胶包扎；</td>
                    <td class="textR"><i class="icon_violate">违</i>罚<strong>200元／次</strong></td>
                </tr>
                <tr>
                    <td class="borderRdddee3 textC" rowspan="3">安全保护</td>
                    <td class="borderRdddee3">1. 工地临时用电必须使用配电箱，严禁直接连接电动工具；</td>
                    <td class="textR"><i class="icon_violate">违</i>罚<strong>100元／次</strong></td>
                </tr>
                <tr>
                    <td class="borderRdddee3">2. 临时照明必须加开关严禁使用长明灯；</td>
                    <td class="textR"><i class="icon_violate">违</i>罚<strong>100元／次</strong></td>
                </tr>
                <tr>
                    <td class="borderRdddee3">3. 每天施工下班，必须关掉电源；</td>
                    <td class="textR"><i class="icon_violate">违</i>罚<strong>100元／次</strong></td>
                </tr>                
                <tr>
                    <td class="borderRdddee3 textC" rowspan="2">线管预埋</td>
                    <td class="borderRdddee3">1. 水泥砂浆的配比1:3。快干石膏按标准，敷设面低于原墙面2mm，便于批腻子；</td>
                    <td class="textR" rowspan="2"><i class="icon_violate">违</i>返工重做</td>
                </tr>
                <tr>
                    <td class="borderRdddee3">2. 湿区严禁石膏固定；</td>
                </tr>                                
                <tr>
                    <td class="borderRdddee3 textC" rowspan="2">开关、插座安装</td>
                    <td class="borderRdddee3">1. 底盒内接线牢固，无松动，相线，零线，地线分色，无混装。安装后开启灵活；</td>
                    <td class="textR"><i class="icon_violate">违</i>返工重做</td>
                </tr>
                <tr>
                    <td class="borderRdddee3">2. 同一位置并排两个或以上面板，缝隙均匀，水平度≤0.5mm；</td>
                    <td class="textR"><i class="icon_violate">违</i>返工重做</td>
                </tr>
                <tr>
                    <td class="borderRdddee3 textC">灯具安装</td>
                    <td class="borderRdddee3">1. 所有灯线链接必须牢固，严实，无松动；</td>
                    <td class="textR"><i class="icon_violate">违</i>罚<strong>100元／次</strong></td>
                </tr>
            </tbody>

            <!-- 弱点工程 -->
            <tbody style="display: none;">
                <tr>
                    <td class="borderRdddee3 textC">交底定位放线</td>
                    <td class="borderRdddee3">1. 根据设计要求，客户要求，确定弱点位置，功能如：TV，电话，网络，音频线；</td>
                    <td class="textR">同强电标准</td>
                </tr>
                <tr>
                    <td class="borderRdddee3 textC">底盒预埋</td>
                    <td class="borderRdddee3">1. 同强电工艺标准</td>
                    <td class="textR"><i class="icon_violate">违</i>返工重做</td>
                </tr>
                <tr>
                    <td class="borderRdddee3 textC" rowspan="5">线管安装与固定</td>
                    <td class="borderRdddee3">1. 强弱电布管布线必须分开，间距≥300mm；</td>
                    <td class="textR"><i class="icon_violate">违</i>返工重做</td>
                </tr>
                <tr>
                    <td class="borderRdddee3">2. 弱点线路必须从弱电箱到最终端，中途不得剪断；</td>
                    <td class="textR"><i class="icon_violate">违</i>返工重做</td>
                </tr>
                <tr>
                    <td class="borderRdddee3">3. 新房退位改造，老房重新布线；</td>
                    <td class="textR"><i class="icon_violate">违</i>罚<strong>100元／次</strong></td>
                </tr>
                <tr>
                    <td class="borderRdddee3">4. 弱电总箱必须预留强电电源</td>
                    <td class="textR"><i class="icon_violate">违</i>返工重做</td>
                </tr>
                <tr>
                    <td class="borderRdddee3">5. 强弱电交叉点十字交叉；</td>
                    <td class="textR"><i class="icon_violate">违</i>罚<strong>100元／次</strong></td>
                </tr>

                <tr>
                    <td class="borderRdddee3 textC">安全保护</td>
                    <td class="borderRdddee3">1. 同强电工艺标准</td>
                    <td class="textR">同强电标准</td>
                </tr>

                <tr>
                    <td class="borderRdddee3 textC">线管预埋</td>
                    <td class="borderRdddee3">1. 同强电工艺标准</td>
                    <td class="textR"><i class="icon_violate">违</i>返工重做</td>
                </tr>
            </tbody>

            <!-- 给水工程 -->
            <tbody style="display: none;">
                <tr>
                    <td class="borderRdddee3 textC">交底定位放线</td>
                    <td class="borderRdddee3">1.
                    根据设计要求，确定龙头，淋雨，马桶，洗漱，洗衣，拖把等功能位置，高度，以及周边是否有障碍物，达到施工要求；</td>
                    <td></td>
                </tr>
                <tr>
                    <td class="borderRdddee3 textC">剔槽</td>
                    <td class="borderRdddee3">1. 剔槽要求横平竖直，严禁斜管槽，严禁剔≥300mm横槽，严禁切断钢筋，按照物业要求施工；</td>
                    <td class="textR"><i class="icon_violate">违</i>罚<strong>100元／次</strong></td>
                </tr>
                <tr>
                    <td class="borderRdddee3 textC" rowspan="7">管道安装</td>
                    <td class="borderRdddee3">1. 冷热水管间距为150mm，有防水要求区域地面严禁布管；</td>
                    <td class="textR"><i class="icon_violate">违</i>返工重做</td>
                </tr>
                <tr>
                    <td class="borderRdddee3">2. 热熔时，必须达到温度要求，时间要求，不得扭曲；</td>
                    <td class="textR"><i class="icon_violate">违</i>返工重做</td>
                </tr>
                <tr>
                    <td class="borderRdddee3">3. 不同材质水管不得混熔；</td>
                    <td class="textR"><i class="icon_violate">违</i>罚<strong>200元／次</strong></td>
                </tr>
                <tr>
                    <td class="borderRdddee3">4. 冷热水管的出水口要求完成墙面铺贴后，必须与墙面平，标准为0mm—2mm，水平误差±0.5mm；</td>
                    <td class="textR"><i class="icon_violate">违</i>返工重做</td>
                </tr>
                <tr>
                    <td class="borderRdddee3">5. 水管固定在顶面时，用固定卡固定，间距≤600mm，弯头和三通150mm内两侧加固定卡；</td>
                    <td class="textR"><i class="icon_violate">违</i>返工重做</td>
                </tr>
                <tr>
                    <td class="borderRdddee3">6. 固定卡安装顺序：放线——打孔——固定，严禁不放线直接安装（拍照）</td>
                    <td class="textR"><i class="icon_violate">违</i>罚<strong>100元／次</strong></td>
                </tr>
                <tr>
                    <td class="borderRdddee3">7. 埋墙水管不允许有接头，整管入墙；</td>
                    <td class="textR"><i class="icon_violate">违</i>返工重做</td>
                </tr>
                <tr>
                    <td class="borderRdddee3 textC" rowspan="2">压力试验</td>
                    <td class="borderRdddee3">1. 压力为0.8mpa，打压1小时无渗漏，压力下降≤0.05mpa为合格；</td>
                    <td class="textR"><i class="icon_violate">违</i>罚<strong>200元／次</strong></td>
                </tr>
                <tr>
                    <td class="borderRdddee3">2. 拍照留证，发给客户；</td>
                    <td class="textR"><i class="icon_violate">违</i>罚<strong>100元／次</strong></td>
                </tr>
                <tr>
                    <td class="borderRdddee3 textC">管道预埋</td>
                    <td class="borderRdddee3">1. 离出水口预留300mm不予敷设水泥砂浆，为泥瓦工敷设，便于调整出水口与墙面平整；</td>
                    <td class="textR"><i class="icon_violate">违</i>损坏赔偿</td>
                </tr>
                <tr>
                    <td class="borderRdddee3 textC" rowspan="3">卫浴龙头安装</td>
                    <td class="borderRdddee3">1. 所有出水口有软管连接位置，必须安装龙头，才能安装软管；</td>
                    <td class="textR"><i class="icon_violate">违</i>返工重做</td>
                </tr>
                <tr>
                    <td class="borderRdddee3">2. 安装前必须做水流畅通试验，至少5分钟，冲走管内灰尘，避免堵塞淋浴龙头；</td>
                    <td class="textR"><i class="icon_violate">违</i>损坏赔偿</td>
                </tr>                
                <tr>
                    <td class="borderRdddee3">3. 龙头安装必须牢固，无松动。安装工具必须先用布料包扎，避免刮花龙头。安装完后必须做畅通试验；</td>
                    <td class="textR"><i class="icon_violate">违</i>损坏赔偿</td>
                </tr>                
                <tr>
                    <td class="borderRdddee3 textC" rowspan="2">马桶安装</td>
                    <td class="borderRdddee3">1. 马桶底座与地面接触应保持水平度，用法兰安装底座与地面周边必须用玻璃胶收口，打胶后24小时内不得使用；</td>
                    <td class="textR"><i class="icon_violate">违</i>返工重做</td>
                </tr>
                <tr>
                    <td class="borderRdddee3">2. 安装完毕后调试水位，做冲水试验，检查是否通畅，是否有渗漏现象，无误后做成品保护；</td>
                    <td class="textR"><i class="icon_violate">违</i>损坏赔偿</td>
                </tr>
                <tr>
                    <td class="borderRdddee3 textC" rowspan="3">五金挂件安装</td>
                    <td class="borderRdddee3">1. 安装五金前，安装按照设计要求，无设计要求的，客户和项目经理确定具体位置，高度，并在安装位置标注；</td>
                    <td class="textR"><i class="icon_violate">违</i>返工重做</td>
                </tr>
                <tr>
                    <td class="borderRdddee3">2. 安装时先用玻璃钻头引孔，安装加膨胀螺丝，牢固无松动；</td>
                    <td class="textR"><i class="icon_violate">违</i>返工重做</td>
                </tr>                
                <tr>
                    <td class="borderRdddee3">3. 安装工具必须布料包扎，以免刮花五金挂件；</td>
                    <td class="textR"><i class="icon_violate">违</i>返工重做</td>
                </tr>  
            </tbody>
            
            <!-- 排水工程 -->
            <tbody style="display: none;">
                <tr>
                    <td class="borderRdddee3 textC" rowspan="4">交底定位放线</td>
                    <td class="borderRdddee3">1. 根据设计要求或客户要求，对设备、设施定位，对排水管道布局定位。</td>
                    <td class="textR"><i class="icon_violate">违</i>返工重做</td>
                </tr>
                <tr>
                    <td class="borderRdddee3">2. 厨房排水管≥φ75mm，淋浴、洗漱排水管、洗衣机排水管≥φ50mm，马桶、蹲便器排水管≥φ110mm；</td>
                    <td class="textR"><i class="icon_violate">违</i>返工重做</td>
                </tr>
                <tr>
                    <td class="borderRdddee3">3. 老房座厕管道口低的用110/75的UPVC变径处理，接头密封处理；</td>
                    <td class="textR"><i class="icon_violate">违</i>返工重做</td>
                </tr>
                <tr>
                    <td class="borderRdddee3">4. 洗衣机下水管必须单独连接主管道，不得与其他用水设备连接；</td>
                    <td class="textR"><i class="icon_violate">违</i>返工重做</td>
                </tr>
                <tr>
                    <td class="borderRdddee3 textC" rowspan="2">管道安装</td>
                    <td class="borderRdddee3">1. 安装管道的接头必须采用专用胶水连接，排水管的转弯点，过度支点必须用砖块或水泥砂浆加固，以防松动渗漏或积水。排水管须≥3%放坡，严禁管道倒灌积水；</td>
                    <td class="textR"><i class="icon_violate">违</i>返工重做</td>
                </tr>
                <tr>
                    <td class="borderRdddee3">2. 管道施工完毕，须进行畅通试验，以不积水，不倒灌为标准；</td>
                    <td class="textR"><i class="icon_violate">违</i>罚<strong>100元／次</strong></td>
                </tr>
                <tr>
                    <td class="borderRdddee3 textC">安全保护</td>
                    <td class="borderRdddee3">1. 排水施工完毕，排水口必须进行专用保护盖进行保护，避免垃圾堵塞；</td>
                    <td class="textR"><i class="icon_violate">违</i>罚<strong>100元／次</strong></td>
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
    </script>e