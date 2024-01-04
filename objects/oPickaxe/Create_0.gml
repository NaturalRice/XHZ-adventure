/// @description 
//Vars CD变量
cooldown = 0;

//Properties 旋转角度(45度）
rotation = 45;
//实例与可破坏对象交互的限制距离（32内可破坏）
breakDistance = 32;

//Attacking 攻击距离
attackDistance = 8;

//Selector
selectorInst = noone;//存储被选择的实例ID
selectorFrame = 0;//存储选择器动画的帧序号
selectorFrameNumber = sprite_get_number(sSelector);//存储选择器动画有多少帧