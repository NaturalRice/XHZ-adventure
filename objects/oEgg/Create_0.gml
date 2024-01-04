/// @description 初始化鸡蛋
//初始的移动角度
direction = random(360);//初始前1秒进行漫无目的的环游
//初始移动速度
speed = 2;
//追击移动速度
moveSpd = 4;
//目标
target = noone;
//是否追击目标
chase = false;//一开始不追击
//追击目标倒计时
alarm[0] = 45;
//寿命倒计时
alarm[1] = 240;

/// @description 初始化鸡蛋道具数据
image_xscale = 0;
image_yscale = 0;

