// raid.flow
// 四区白三三
// 暂用版
//<-stopSSAuto
@cmdDelay 500
cr wuyue/qingcheng/shanlu
go westup
go north
look cao
tiao cao
yywd ok
pa tu
@tip 只要伸手就到了
answer s2
@tip 神界就在前方
answer s4
@tip 是人是鬼
answer s5
@tip 不要阻止我
answer s7
@tip 只是觉得有些诡异
answer s9
@tip 去看看
answer s10
[while] true
    @tip 青青往($direction)方走去|无边无际的黑暗中($goout)
    [if] (goout) != null
        @print (goout)
        [break]
    [if] (direction) == 东
        go east
    [if] (direction) == 西
        go west
    [if] (direction) == 北
        go north
    [if] (direction) == 南
        go south
look cao
@tip 你小心点
answer s1
cai cao
@tip 杀了他
answer s3
[if] (:living) == true
    @tip 青青看了你一眼转身跟了过去
    go west
    @wait 600000
    stopstate
    go north
    //@tip 青青呢
    //answer s2
    //go south
    //go south
    //@tip 后会有期
    //answer s1
//stopSSAuto->