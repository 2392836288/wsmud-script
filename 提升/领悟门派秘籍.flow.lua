// raid.flow
// 四区：白三三
// 自动领悟门派进阶书籍
[if] (lianxi_map) == null
    ($lianxi_map) = 住房-练功房
[if] (chiyao) == null
    ($chiyao) = 否
#select ($MPJJname) = 门派,武当派|丐帮|华山派|峨眉派|少林派|逍遥派|杀手楼,(MPJJname)
#select ($lianxi_map)=练习地点,住房-练功房|帮会-练功房,(lianxi_map)
#select ($chiyao)=是否吃清心丹,是|否,(chiyao)
#config
@stopSSAuto
stopstate
[if] (MPJJname) == 武当派
    ($mpskills_name) = '太极拳','梯云纵','太极剑法','太极神功'
    ($mpskills_id) = 'taijiquan','tiyunzong','taijijian','taijishengong'
    ($mpbooks_name) = '太极拳进阶秘籍','梯云纵进阶秘籍','太极剑法进阶秘籍','太极神功进阶秘籍'
[if] (MPJJname) == 丐帮
    ($mpskills_name) = '混天气功','逍遥游','打狗棒','降龙十八掌'
    ($mpskills_id) = 'huntianqigong','xiaoyaoyou','dagoubang','xianglongzhang'
    ($mpbooks_name) = '混天气功进阶秘籍','逍遥游进阶秘籍','打狗棒进阶秘籍','降龙十八掌进阶秘籍'
[if] (MPJJname) == 华山派
    ($mpskills_name) = '劈石破玉拳','紫霞神功','狂风快剑','独孤九剑'
    ($mpskills_id) = 'poyuquan','zixiashengong','kuangfengkuaijian','dugujiujian'
    ($mpbooks_name) = '劈石破玉拳进阶秘籍','紫霞神功进阶秘籍','狂风快剑进阶秘籍','独孤九剑进阶秘籍'
[if] (MPJJname) == 峨眉派
    ($mpskills_name) = '九阴白骨爪','诸天化身步','临济十二庄','倚天剑法'
    ($mpskills_id) = 'jiuyinbaiguzhao','zhutianbu','linjizhuang','yitianjianfa'
    ($mpbooks_name) = '九阴白骨爪进阶秘籍','诸天化身步进阶秘籍','临济十二庄进阶秘籍','倚天剑法进阶秘籍'
[if] (MPJJname) == 少林派
    ($mpskills_name) = '一指禅','少林身法','燃木刀法','易筋经'
    ($mpskills_id) = 'yizhichan','shaolinshenfa','ranmudao','yijinjing'
    ($mpbooks_name) = '一指禅进阶秘籍','少林身法进阶秘籍','燃木刀法进阶秘籍','易筋经进阶秘籍'
[if] (MPJJname) == 逍遥派
    ($mpskills_name) = '北冥神功','天山六阳掌','凌波微步','小无相功'
    ($mpskills_id) = 'beimingshengong','liuyangzhang','lingboweibu','xianwuxianggong'
    ($mpbooks_name) = '北冥神功进阶秘籍','天山六阳掌进阶秘籍','凌波微步进阶秘籍','小无相功进阶秘籍'
[if] (MPJJname) == 杀手楼
    ($mpskills_name) = '穿心掌','杀生决','漫天花雨','踏雪寻梅'
    ($mpskills_id) = 'chuanxinzhang','shashengjue','mantianhuayu','taxuexunmei'
    ($mpbooks_name) = '穿心掌进阶秘籍','杀生决进阶秘籍','漫天花雨进阶秘籍','踏雪寻梅进阶秘籍'
$to (lianxi_map)
//循环匹配技能
($num)=0
[while] (num) < 4
    @toolbar jh
    @toolbar skills
    @js ($skill_name) = [(mpskills_name)][(num)]
    @js ($skill_id) = [(mpskills_id)][(num)]
    @js ($skill_book) = [(mpbooks_name)][(num)]
    @js ($skill_id2) = $(".skill:contains((skill_name))").attr("skid")
    [if] (skill_id2) == (skill_id)
        //检查是否吃药
        [if] (:status food) == false && (chiyao) == 是 && {b清心丹}? != null
            stopstate
            use {b清心丹}
        use {b(skill_book)}
        @tip 恭喜你领悟了
    [else]
        ($num) = (num) + 1
@recoverSSAuto
dazuo